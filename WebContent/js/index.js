$("#snap").hide();

// Put event listeners into place
window
    .addEventListener(
        "DOMContentLoaded",
        function() {
            // Grab elements, create settings, etc.
            var info = document.querySelector('#info');
            var canvas = document.getElementById("canvas"),
                context = canvas
                    .getContext("2d"),
                video = document
                    .getElementById("video"),
                videoObj = {
                    "video": true
                }, errBack = function(error) {
                    console.log("Video capture error: ", error.code);
                };
            // Put video listeners into place
            if (navigator.getUserMedia) {
                // Standard
                navigator.getUserMedia(videoObj, function(stream) {
                    video.src = stream;
                    video.play();
                    info.innerHTML = '';
                }, errBack);
            } else if (navigator.webkitGetUserMedia) {
                // WebKit-prefixed
                navigator.webkitGetUserMedia(videoObj, function(
                    stream) {
                    video.src = window.webkitURL
                        .createObjectURL(stream);
                    video.play();

                    info.innerHTML = '';
                    $("#snap").show();
                }, errBack);
            }

            // Trigger photo take
            document
                .getElementById("snap")
                .addEventListener(
                    "click",
                    function() {
                        context.drawImage(video, 0, 0, 320,
                            240);
                        var imgData = canvas.toDataURL();
                        document.getElementById("snapimg").src = imgData;

                        $("#imgData").attr("value",
                            $("#snapimg").attr("src"));
                        var form = document
                            .getElementById("face");
                        $("#snap").hide();
                        $("#wait").show();
                        form.submit();
                    });
        }, false);

function doSubmit() {
    $("#imgData").attr("value", $("#snapimg").attr("src"));
    var form = document.getElementById("face");
    form.submit();
}
