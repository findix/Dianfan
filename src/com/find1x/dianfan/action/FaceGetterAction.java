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
			out.println("<a href=\"index\">����</a>");
		}
		if (url != null && imgData == null) {
			out.println("<img src=\"" + url + "\" /><br />");
			detectByUrl();
			out.println(result.toString());
			out.println("<br /><br />");
			faceInfo();
			out.println("<a href=\"FaceTest\">����</a>");
		}
		if (url == null && imgData == null) {
			out.println("ʲô��û�������������׷�����ʲô��");
			out.println("<a href=\"index\">����</a>");
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

	// �� BASE64 ������ַ��� imgData ���н���
	public byte[] getByteArrayFromBase64(String imgData) {
		if (imgData == null) // ͼ������Ϊ��
			return null;
		if (imgData.substring(0, 11).equals("data:image"))
			imgData = imgData.substring(22);
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64����
			byte[] b = decoder.decodeBuffer(imgData);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// �����쳣����
					b[i] += 256;
				}
			}
			return b;
		} catch (Exception e) {
			return null;
		}
	}

	// base64�ַ���ת����ͼƬ
	public boolean base64ToImage(String imgData) { // ���ֽ������ַ�������Base64���벢����ͼƬ
		if (imgData == null) // ͼ������Ϊ��
			return false;
		if (imgData.substring(0, 10).equals("data:image")) {
			imgData = imgData.substring(22);
		}
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64����
			byte[] b = decoder.decodeBuffer(imgData);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// �����쳣����
					b[i] += 256;
				}
			}
			// ����pngͼƬ
			String imgFilePath = "F:/workspace/dianfan/WebContent/img/a.png";// �����ɵ�ͼƬ
			// String imgFilePath =
			// "/home/findix/���/apache-tomcat-7.0.42/webapps/dianfan/WebContent/img/a.png";
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
			out.println("id��" + face.getString("face_id"));
			JSONObject attribute = face.getJSONObject("attribute");
			JSONObject age = attribute.getJSONObject("age");
			JSONObject gender = attribute.getJSONObject("gender");
			JSONObject race = attribute.getJSONObject("race");
			JSONObject smiling = attribute.getJSONObject("smiling");
			JSONObject glass = attribute.getJSONObject("glass");
			out.println("���䣺"
					+ (age.getInt("value") + "�� (��" + age.getInt("range"))
					+ ")");
			out.println("�Ƿ���۾���" + glass.getString("value") + " "
					+ glass.getDouble("confidence"));
			out.println("�Ա�" + gender.getString("value") + " "
					+ gender.getDouble("confidence"));
			out.println("���֣�" + race.getString("value") + " "
					+ race.getDouble("confidence"));
			out.println("Ц�⣺" + smiling.getDouble("value"));

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
