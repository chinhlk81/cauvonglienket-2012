<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Admin>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Sửa thông tin Admin</h2>
    <script type="text/javascript">
        //    $(
        //            function () {
        //                $('#submit').click(CheckInput);
        //            }
        //        );
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
            var oldPass = $("#OldPassword").val();
            var newPass = $('#Password').val();
            var confirmpass = $('#ConfirmPassword').val();
            var valid = true;
            if (oldPass == "") {
                $("#dvOldPass").css("visibility", "visible");
                valid = false;
            }
            else {
                $("#dvOldPass").css("visibility", "collapse");
            }
            if (newPass == "") {
                $("#minlenght").css("visibility", "visible");
                valid = false;
            }
            else {
                $("#minlenght").css("visibility", "collapse");
            }
            if ($('#Password').val() != $('#ConfirmPassword').val()) {
                $('#confirm').css("visibility", "visible");
                valid = false;
            } else {
                $('#confirm').css("visibility", "collapse");
            }
            return valid;
        }
    </script>


    <div style="text-align:right">
     <a href="<% =Url.Action("Create") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới "/></a>
    <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a></div>
     <% using(Html.BeginForm()){ %>
    <fieldset>
    <table class="table_detail_admin">
        <tr>
            <td style="width: 105px">
               Tên đăng nhập</td>
            <td colspan="2">
                <%=Html.Encode(Model.UserName)%>
            </td>
        </tr>
         <tr>
        <td> Loại</td>
        <td>
        <%=Html.DropDownList("type", new[] { new SelectListItem { Text = "Tư Vấn Viên", Value = "Customer" }, new SelectListItem { Text = "Quản trị", Value = "Admin" } })%>
        <%=Html.ValidationMessageFor(model=>model.Type)%>
        </td>
        </tr>
        <%if (Model.Type != "Admin")
          { %>
        <tr>
        <td>Đăng nhập</td>
        <td><%=Html.CheckBoxFor(model => model.AllowLogOn)%></td>
        </tr>
        <%} %>
        <tr>
            <td style="width: 105px">
                Mô tả</td>
            <td colspan="2">
                    <%=Html.TextAreaFor(model => Model.Description, new { Style = "width:350px" })%>
            </td>
        </tr>
        <tr>
            <td style="width: 105px">
                &nbsp;</td>
            <td>
                <input id="Submit1" type="submit" value="Lưu" />&nbsp;
                <input id="Reset1" type="reset" value="Hủy" /></td>
        </tr>
        </table>
        </fieldset>
       <%} %>
       <div><b>Thay đổi mật khẩu</b></div>
       <div id="abc">
       <%--<%Html.RenderPartial("UCAdminPassword"); %>--%>
       </div>
       <table>
       <%using (Html.BeginForm("ChangePassword", "AdminManagement", new { id = Model.AdminID }, FormMethod.Post))
         { %>
         <tr>
  <td colspan="2" align="center"><b><%=Html.Encode(ViewData["Password"])%></b></td>
  </tr>
 <tr>
            <td style="width: 105px">
                Mật khẩu cũ</td>
            <td>
                <%=Html.PasswordFor(model => model.OldPassword, new { Style = "width:350px" })%>
                <%=Html.ValidationMessageFor(model => model.OldPassword)%>
                <div id="dvOldPass" style="visibility:collapse">Nhập mật khẩu cũ</div>
            </td>
        </tr>
        <tr>
            <td style="width: 105px">
                Mật khẩu mới</td>
            <td>
                <%=Html.PasswordFor(model => model.Password, new { Style = "width:350px", mouseleave = "return MinLenght()" })%>
               <%=Html.ValidationMessageFor(model => model.Password)%>
                <div id="minlenght" style="visibility:collapse">Nhập mật khẩu/Mật khẩu nhỏ nhất là 6 ký tự
                </div>
             </td>
        </tr>
        <tr>
            <td style="width: 105px">
                Xác nhận mật khẩu</td>
            <td >
                <%=Html.PasswordFor(model => model.ConfirmPassword, new { Style = "width:350px" })%>
                <%=Html.ValidationMessageFor(model => model.ConfirmPassword)%>
                    <div id="confirm" style="visibility:collapse"> Xác nhận không khóp
                     </div>
             </td>
        </tr>
        <tr>
        <td></td>
        <td>
        <input type="submit" value="Lưu" id="submit1" onclick="return CheckInput()" />
        <input type="reset" value="Hủy"/>
        </td>
        </tr>
        <%} %>
        </table>
</asp:Content>
