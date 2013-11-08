package com.find1x.dianfan.action;

import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.json.JSONObject;

import sun.misc.BASE64Decoder;

import com.facepp.error.FaceppParseException;
import com.facepp.http.HttpRequests;
import com.facepp.http.PostParameters;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FaceGetterAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	// private HttpRequests httpRequests = new HttpRequests(
	// "c98ff984eed53a0abe0278cd826e5946",
	// "VyHXNGf_RMIXzT8osobFYoZJiHA6w1no", true, true);
	private String api_key = "3aaee7a91c1665987830b0f627ef694f";
	private String api_secret = "jZrDnu4qW6KeKas_PMA0FTsOny1daLUE";
	private HttpRequests httpRequests = new HttpRequests(api_key, api_secret,
			true, true);
	private JSONObject result = null;
	private PrintWriter out;
	private String url;
	private String imgData;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		// response.setCharacterEncoding("UTF-8");
		out = response.getWriter();
		url = request.getParameter("url");
		imgData = request.getParameter("imgData");
		System.out.println(url);
		System.out.println(imgData);
//		for (byte bytes : (getByteArrayFromBase64(imgData))) {
//			System.out.print(bytes + " ");
//		}

		if (imgData != null && url == null) {
			base64ToImage(imgData);
			out.println("<img src=\"" + imgData + "\">");
			out.println("<br /><br />");
			detectByImg();
			out.println(result.toString());
			out.println("<br /><br />");
			faceInfo();
			out.println("<a href=\"index\">返回</a>");
		}
		if (url != null && imgData == null) {
			out.println("<img src=\"" + url + "\" /><br />");
			detectByUrl();
			out.println(result.toString());
			out.println("<br /><br />");
			faceInfo();
			out.println("<a href=\"FaceTest\">返回</a>");
		}
		if (url == null && imgData == null) {
			out.println("什么都没传过来啊！到底发生了什么！");
			out.println("<a href=\"index\">返回</a>");
		}
		out.close();
		return SUCCESS;
	}

	private void detectByUrl() {
		try {
			PostParameters postParameters = new PostParameters()
					.setUrl(url)
					.setAttribute("gender,age,race,smiling,glass,pose,landmark");
			result = httpRequests
					.request("detection", "detect", postParameters);
		} catch (FaceppParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void detectByImg() {
		try {
			File file=new File("F:/workspace/dianfan/WebContent/img/a.png");
			PostParameters postParameters = new PostParameters()
					.setImg(file)
					.setAttribute("gender,age,race,smiling,glass,pose,landmark");
			result = httpRequests
					.request("detection", "detect", postParameters);
			long nowTime=System.currentTimeMillis();
			file.renameTo(new File("F:/workspace/dianfan/WebContent/img/"+nowTime+".png"));
		} catch (FaceppParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 将 BASE64 编码的字符串 imgData 进行解码
	public byte[] getByteArrayFromBase64(String imgData) {
		if (imgData == null) // 图像数据为空
			return null;
		if (imgData.substring(0, 11).equals("data:image"))
			imgData = imgData.substring(22);
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgData);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			return b;
		} catch (Exception e) {
			return null;
		}
	}

	// base64字符串转化成图片
	public boolean base64ToImage(String imgData) { // 对字节数组字符串进行Base64解码并生成图片
		if (imgData == null) // 图像数据为空
			return false;
		if (imgData.substring(0, 10).equals("data:image")) {
			imgData = imgData.substring(22);
		}
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgData);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成png图片
			String imgFilePath = "F:/workspace/dianfan/WebContent/img/a.png";// 新生成的图片
			// String imgFilePath =
			// "/home/findix/软件/apache-tomcat-7.0.42/webapps/dianfan/WebContent/img/a.png";
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	private void faceInfo() {
		try {
			JSONObject face = result.getJSONArray("face").getJSONObject(0);
			out.println("id：" + face.getString("face_id"));
			JSONObject attribute = face.getJSONObject("attribute");
			JSONObject age = attribute.getJSONObject("age");
			JSONObject gender = attribute.getJSONObject("gender");
			JSONObject race = attribute.getJSONObject("race");
			JSONObject smiling = attribute.getJSONObject("smiling");
			JSONObject glass = attribute.getJSONObject("glass");
			out.println("年龄："
					+ (age.getInt("value") + "岁 (误差：" + age.getInt("range"))
					+ ")");
			out.println("是否带眼镜：" + glass.getString("value") + " "
					+ glass.getDouble("confidence"));
			out.println("性别：" + gender.getString("value") + " "
					+ gender.getDouble("confidence"));
			out.println("人种：" + race.getString("value") + " "
					+ race.getDouble("confidence"));
			out.println("笑意：" + smiling.getDouble("value"));

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
