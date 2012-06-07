<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thay đổi mật khẩu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  
    <table style="width:100%;text-align:center;" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_edit_user_title" colspan="2" align="left">
              Thay đổi mật khẩu </td>
           
                <td align="right" class="td_edit_user_title">
                
                 
                 </td>
        </tr>
        </table>
        <br />

    <script type="text/javascript">
        $(
            function () {
                $('#submit').click(CheckInput);
                $('#Password').focusout(MinLenght);
                $('#ConfirmPassword').focusout(CheckInput);
                $('#OldPassword').focusout(CheckInput);

            });
           
            function MinLenght() {
                if ($('#Password').val().toString()) {
                    if ($('#Password').val().length < 6) {
                        $('#minlenght').css('visibility', 'visible');
                        return false;
                    } else {
                        $('#minlenght').css('visibility', 'collapse');
                    }
                }
            }

            function CheckInput() {
            var valid =true;
            if ($('#Password').val().toString()) {
                if ($('#Password').val().length < 6) {
                    valid= false;
                } 
            }
                if ($('#Password').val() != $('#ConfirmPassword').val()) {
                    $('#confirm').css("visibility", "visible");
                    valid= false;
                } else {
                    $('#confirm').css("visibility", "collapse");
                }
                if ($('#OldPassword').val() == "") {
                    $('#divOldPass').css("visibility", "visible");
                    valid = false;
                }
                else
                {
                    $('#divOldPass').css("visibility", "collapse");
                }
                return valid;
               }
    
    </script>
     <script src="../../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../../Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>
    <% Html.EnableClientValidation(); %>
     <%using (Html.BeginForm("ChangePassword", "MemberProfile", new { id = Model.UserID }, FormMethod.Post, new { entype = "mutilpart/form-data" }))
      { %>
      <div style="text-align:center"><%=Html.Encode( ViewData["PasswordMessage"]) %></div>
    <table style="width: 400px;margin-left: auto;margin-right: auto;background:#EFF6FF;border:1px solid #ccc;padding:20px;"  cellpadding="0" cellspacing="0">
    <tr >
    <td align="right" valign="top">
    Mật khẩu cũ&nbsp;
    </td>
    <td>
    <div> <%=Html.PasswordFor(model=>model.OldPassword) %>
      <%=Html.ValidationMessageFor(model=>model.OldPassword) %>
      </div>
      <div id="divOldPass" style="visibility:collapse;color:Red">Nhập mật khẩu cũ</div>
    </td>
    </tr>
    <tr>
    <td align="right" valign="top">
    Mật khẩu mới&nbsp;
    </td>
    <td><div> <%=Html.PasswordFor(model => model.Password)%>
      <%=Html.ValidationMessageFor(model => model.Password)%>
      </div>
      <div id="minlenght" style="visibility:collapse;color:Red">Mật khẩu nhỏ nhất là 6 ký tự
      </div></td>
    </tr>
    <tr>
    <td align="right" valign="top">
    Xác nhận mật khẩu mới &nbsp;
    </td>
    <td><div> <%=Html.PasswordFor(model=>model.ConfirmPassword)%>
      <%=Html.ValidationMessageFor(model => model.ConfirmPassword)%>         
      </div>
      <div id="confirm" style="visibility:collapse;color:Red"> Xác nhận không khớp
      </div></td>
    </tr>
    <tr>
    <td></td>
    <td><div>
      <input type="submit" class="btn_user_update" value="Lưu" name="submit" onclick="return CheckInput()" />
      </div></td>
    </tr>
    </table>
   
      
      
      
    <%} %>

</asp:Content>
