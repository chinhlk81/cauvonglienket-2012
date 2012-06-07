<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.Admin>" %>
<table class="table_detail_admin">

<%using (Ajax.BeginForm("UCAdminPassword", new { id = Model.AdminID }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "abc" }))
  { %>
  <tr>
  <td colspan="2" align="center"><%=Html.Encode(ViewData["Password"])%></td>
  </tr>
 <tr>
            <td style="width: 105px">
                Mật khẩu cũ</td>
            <td>
                <%=Html.PasswordFor(model => model.OldPassword, new { Style = "width:250px" })%>
                <%=Html.ValidationMessageFor(model => model.OldPassword)%>
                <div id="dvOldPass" style="visibility:collapse">Nhập mật khẩu cũ</div>
            </td>
        </tr>
        <tr>
            <td style="width: 105px">
                Mật khẩu mới</td>
            <td>
                <%=Html.PasswordFor(model => model.Password, new { Style = "width:250px", mouseleave = "return MinLenght()" })%>
               <%=Html.ValidationMessageFor(model => model.Password)%>
                <div id="minlenght" style="visibility:collapse">Nhập mật khẩu/Mật khẩu nhỏ nhất là 6 ký tự
                </div>
             </td>
        </tr>
        <tr>
            <td style="width: 105px">
                Xác nhận mật khẩu</td>
            <td >
                <%=Html.PasswordFor(model => model.ConfirmPassword, new { Style = "width:250px" })%>
                <%=Html.ValidationMessageFor(model => model.ConfirmPassword)%>
                    <div id="confirm" style="visibility:collapse"> Xác nhận không khóp
                     </div>
             </td>
        </tr>
        <tr>
        <td></td>
        <td>
        <input type="submit" value="Lưu" id="submit" onclick="return CheckInput()"/>
        <input type="reset" value="Hủy"/>
        </td>
        </tr>
        <%} %>
</table>
<%--<script src="../../Scripts/jquery.js" type="text/javascript"></script>--%>
<script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
<script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>

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
        var oldPass=$("#OldPassword").val();
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
        else
        {
            $("#minlenght").css("visibility", "collapse");
        }
       if ($('#Password').val() != $('#ConfirmPassword').val()) {
            $('#confirm').css("visibility", "visible");
            valid= false;
        } else {
            $('#confirm').css("visibility", "collapse");
        }
        return valid;
    }
    </script>
