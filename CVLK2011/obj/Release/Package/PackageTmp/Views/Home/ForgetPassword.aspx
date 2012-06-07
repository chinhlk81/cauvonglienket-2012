<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quên mật khẩu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div><br /><br /></div>
<div>
    <div style="text-align:center"><%=Html.Encode(ViewData["SendSuccess"])%><%=Html.Encode(ViewData["Fail"])%></div>
    <%using (Ajax.BeginForm("ForgetPassword", "Home", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "CaptchaHolder" }))
      {%>
      <table style="width:750px;text-align:left;font-weight:bold;color:#000">
      <tr>
      <td valign="top" align="center">
      Tài khoản:
      </td>
      <td colspan="2">
      <%=Html.TextBox("txtName", "", new { Style = "width:350px" })%>
      <div id="dvName" style="visibility:collapse" >Không tồn tại tên tài khoản này. Vui lòng kiểm tra lại</div>
      </td>
      </tr>
      <tr>
      <td valign="top" align="center">Email</td>
      <td colspan="2">
      <%=Html.TextBox("txtEmail", "", new { Style = "width:350px" })%>
      <div id="dvEmail" style="visibility:collapse">Không tồn tại Email này.Vui lòng kiểm tra lại</div>
      </td>
      </tr>
      
      <tr>
      <td align="right"></td>
      <td align="right" style="width:200px">
            <div id="CaptchaHolder" style="width:200px;height:60px"><%Html.RenderPartial("Captcha");%></div></td>
            <td align="left">
            <div><%= Ajax.ImageActionLink("../../Images/refreshCaptcha.jpg", "Tạo chuỗi mới", "Captcha", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "CaptchaHolder" })%></div>
      </td>
      <td align="left">
      </td>
      </tr>
      <tr>
      <td valign="top"  align="center">
            Mã xác nhận
      </td>
      <td colspan="2">
      <%=Html.TextBox("txtCaptcha", "", new { Style = "width:350px" })%> 
      <div id="dvNoMacht" style="visibility:collapse"> Vui lòng nhập mã xác nhận </div>
      </td>
      </tr>
      <tr>
      <td></td>
      <td colspan="2"><input type="submit" id="submit" value="Tìm" onclick="return CheckInput()" /></td>
      </tr>
      </table>


    <%} %>
     <script type="text/javascript">
         $(
            function () {
                $('#submit').click(CheckInput);
            }
            );
                $("#txtName").focusout(CheckName);
                $("#txtEmail").focusout(CheckEmail);
                       
            
                function CheckName() {
                    var name = $("#txtName").val();
                    $.post("/Home/CheckName/", { username: name },
	                    function (data) {
	                        if (data == "False") {
	                            $('#dvName').css("visibility", "collapse");
	                            return false;
	                        }
	                        else {
	                            $('#dvName').css("visibility", "visible");
	                            return true;
	                        }
	                    });
                }
                function CheckEmail() {
                    var email = $("#txtEmail").val();
                    $.post("/Home/CheckEmail/", { email: email },
	                    function (data) {
	                        if (data != "True") {
	                            $('#dvEmail').css("visibility", "collapse");
	                            return true;
	                        }
	                        else {
	                            $('#dvEmail').css("visibility", "visible");
	                            return false;
	                        }
	                    });
                }

            function CheckInput() {
                            var valid = true;
                            if ($('#txtName').val() == "") {
                                $('#dvName').css("visibility", "visible");
                                valid= false;
                            }
                            else {
                                $('#dvName').css("visibility", "collapse");
                                
                            }

                            if ($('#txtEmail').val() == null) {
                                $('#dvEmail').css('visibility', 'visible');
                                valid = false;
                            } else {
                                var emailSyntax = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
                                var emailInput = $('#txtEmail').val();
                                if (emailSyntax.test(emailInput)) {
                                    $('#dvEmail').css('visibility', 'collapse');
                                   
                                } else {
                                    $('#dvEmail').css('visibility', 'visible');
                                    valid = false;
                                }
                                if ($('#txtCaptcha').val() == "") {
                                    $('#dvNoMacht').css('visibility', 'visible');
                                    valid = false;

                                } else {
                                    $('#dvNoMacht').css('visibility', 'collapse');
                                }
                                var email = $("#txtEmail").val();
                                $.post("/Home/CheckEmail/", { email: email },
	                            function (data) {
	                            if (data != "True") {
	                            $('#dvEmail').css("visibility", "collapse");
	                            
	                        }
	                        else {
	                            $('#dvEmail').css("visibility", "visible");
	                            return false;
	                        }
	                    });
	                    var name = $("#txtName").val();
	                    $.post("/Home/CheckName/", { username: name },
	                    function (data) {
	                        if (data == "False") {
	                            $('#dvName').css("visibility", "collapse");
	                            return false;
	                        }
	                        else {
	                            $('#dvName').css("visibility", "visible");
	                            return true;
	                        }
	                    });
                       return valid;
                    } 
                }
                   
    </script>

    
    
</div>	   
</asp:Content>
