<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thay đổi mật khẩu thành viên
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    $(function () { $('#Password').focusout(MinLenght) });
    function MinLenght() {
        if ($('#Password').val().toString()) {
            if ($('#Password').val().length < 6) {
                $('#minlenght').css("visibility", "visible");
                return false;
            } else {
                $('#minlenght').css("visibility", "collapse");
            }
        }
    }
    function CheckInput() {        
        var newPass = $('#Password').val();
        var valid = true;
       
        if (newPass == "") {
            $("#minlenght").css("visibility", "visible");
            valid = false;
        }
        else {
            $("#minlenght").css("visibility", "collapse");
        }
        return valid;
    }
    </script>
    <div>
  <h2 class="manager_title_detail">Thay đổi mật khẩu thành viên</h2>
</div>
<%using (Html.BeginForm("ChangePassword", "MembersManagement", new { id = Model.UserID }, FormMethod.Post))
  { %>
<div class="table_detail_admin" >
<table>
    <tr>
        <td colspan="2" align="center"><b><%=Html.Encode(ViewData["Password"])%></b></td>
    </tr>
    <tr>
        <td>Mật khẩu mới</td>
        <td>
        <%=Html.HiddenFor(model => model.UserID)%>
        <%=Html.PasswordFor(model => model.Password, new { Style = "width:350px", mouseleave = "return MinLenght()" })%>
        <%=Html.ValidationMessageFor(model => model.Password)%>
        <div id="minlenght" style="visibility:collapse">Nhập mật khẩu/Mật khẩu nhỏ nhất là 6 ký tự</div></td>
        </tr>
    <tr>
        <td align="right"><input type="submit" value="Lưu" id="changepassword" onclick="return CheckInput()" /></td>
        <td align="left">
        <input type="reset" value="Hủy"/>
        </td>
        </tr>
</table>
</div>
<%} %>
</asp:Content>
