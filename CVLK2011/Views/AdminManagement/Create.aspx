<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Admin>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo Admin 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     
    <h2 class="manager_title_detail">Tạo mới</h2>
    <div style="text-align:right"> 
    <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
     <script type="text/javascript">
            $(
            function () {
                $('#submit').click(CheckInput);
            }
        );
            $(function () { $('#Password').focusout(MinLenght)});
            function MinLenght() {
                if ($('#Password').val().toString()) {
                    if ($('#Password').val().length < 5) {
                        $('#minlenght').css("visibility", "visible");
                        return false;
                    } else {
                        $('#minlenght').css("visibility", "hidden");
                    }
                }
            }
            function CheckInput() {
                if ($('#Password').val() != $('#ConfirmPassword').val()) {
                    $('#confirm').css("visibility", "visible");
                    return false;
                } else {
                    $('#confirm').css("visibility", "hidden");
                }
               }
    </script>
    <div style="text-align:center"><b><%=ViewData["LogOnMessage"] %></b></div>
    <% using(Html.BeginForm()){ %>
    <fieldset>
    <table class="table_detail_admin">
        <tr>
            <td style="width: 105px">
               Tên đăng nhập</td>
            <td colspan="2">
                <%=Html.TextBoxFor(Model => Model.UserName, new { Style="width:150px"})%>
                <%=Html.ValidationMessageFor(Model => Model.UserName) %>
            </td>
        </tr>
        <tr>
        <td> Loại</td>
        <td>
        <%=Html.DropDownList("type", new[] { new SelectListItem { Text = "Tư Vấn Viên", Value = "Customer" }, new SelectListItem { Text = "Quản trị", Value = "Admin", Selected = true } })%>
        <%=Html.ValidationMessageFor(model=>model.Type)%>
        </td>
        </tr>
        <tr>
            <td style="width: 105px">
                Mật khẩu</td>
            <td>
                <%=Html.PasswordFor(Model => Model.Password, new { Style = "width:150px", mouseleave = "return MinLenght()" })%>
                <%=Html.ValidationMessageFor(Model=>Model.Password) %>
            </td>
            <td><div id="minlenght" style="visibility:hidden">Mật khẩu > 5 ký tự
      </div></td>
        </tr>
        <tr>
            <td style="width: 105px">
                Xác nhận mật khẩu</td>
            <td>
                <%=Html.PasswordFor(model => model.ConfirmPassword, new { Style = "width:150px" })%>
                <%=Html.ValidationMessageFor(model=>model.ConfirmPassword) %></td>
               <td>
                    <div id="confirm" style="visibility:hidden"> Xác nhận không khớp
                     </div></td>
        </tr>
        <tr>
            <td style="width: 105px">
                Mô tả</td>
            <td colspan="2" >
                    <%=Html.TextAreaFor(Model => Model.Description, new { Style = "width:350px" })%>
            </td>
        </tr>
        <tr>
            <td style="width: 105px">
                &nbsp;</td>
            <td colspan="2" >
                <input id="submitButton" type="submit" value="Lưu" name="submit" onclick="return CheckInput()"/>&nbsp;
                <input id="Reset1" type="reset" value="Hủy" /></td>
        </tr>
        </table>
        </fieldset>
       <%} %>
       </asp:Content>
