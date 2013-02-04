<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AjaxCall._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.9.0.min.js"></script>
</head>
<body>
    <form>
        <div>
            <div>
                Input:
            </div>
            <input type="text" id="txt_1" placeholder="Type something…" onkeyup="javascript: Search(this);"/>
            <div>
                Result:
            </div>
            <input type="text" id="txt_2"/>
            <input type="text" id="txt_3"/>
        </div>
    </form>
    <script type="text/javascript" language="javascript">
        function Search(textbox) {
            MakeRequest(textbox.value);
        }

        function MakeRequest(value) {
            
            var dataToSend = '{\"txtValue\":' + value + '}';

            var request = $.ajax({
                url: "Default.aspx/GetServerValues",
                type: "POST",
                data: dataToSend,
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });

            request.done(function (response) {
                $('#txt_2').val(response.d[0]);
                $('#txt_3').val(response.d[1]);
            });

            request.fail(function (XMLHttpRequest, textStatus, errorThrown) {
                alert("Request failed: " + textStatus);
            });
        }
        
    </script>
</body>
</html>
