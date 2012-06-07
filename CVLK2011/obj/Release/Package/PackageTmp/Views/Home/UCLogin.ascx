<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.User>" %>
<%@ Import Namespace="CVLK2011.Models" %>
  
    
    <div>
    
    <%if (Session["CurrentUserID"] == null)
      {
          using (Html.BeginForm("UCLogin", "Home", FormMethod.Post, new { enctype = "multipart/form-data" }))
            { %>
    
            <table  class="table_login_footer">

        <tr>
            <td colspan="3" style="text-align:center;font-size:14px;font-weight:bold;height:30px;">
                Thành viên đăng nhập
                <%=Html.Encode(ViewData["LogOnResult"])%>
           </td>
        </tr>
        <tr>
            <td style="text-align:right;width:90px;">
                Tài khoản </td>
            <td colspan="2" style="padding-left:10px;">
                <%=Html.TextBoxFor(Model => Model.UserName)%>
                <%=Html.ValidationMessageFor(Model => Model.UserName)%>
                </td>
        </tr>
        <tr>
            <td style="text-align:right;">
                Mật khẩu 
            </td>
            <td colspan="2"style="padding-left:10px">
       
                <%=Html.PasswordFor(model => Model.Password)%>
                <%=Html.ValidationMessageFor(model => Model.Password)%>
            
                </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <input id="Button1" type="submit" class="btn_dangky_home" value="Đăng Nhập" />
                 
                </td>
            <td>
                <input id="Checkbox1" type="checkbox" checked="checked" /> &nbsp; Ghi nhớ</td>
        </tr>
        <tr>
            <td>
            </td>
            <td colspan="2" valign="top" style="font-size:9px; color:Gray">
               <%=Html.ActionLink("Quên mật khẩu?","ForgetPassword","Home")%></td>
        </tr>
        <tr>
            <td style="text-align:center;" colspan="3">
                <img alt="" src="../../Images/new_icon.gif" border="0"  /> &nbsp; <a href="http://ranhroi.vn/" target=_blank>Diễn Đàn </a> &nbsp |<img alt="" src="../../Images/new_icon.gif" border="0"  /> &nbsp;    <%: Html.ActionLink("Vip Member", "VIPMember", "Home")%> 
               
            </td>
        </tr>
   
    </table>

            <%}
      }else 
      {%> 

      <div>
     <table  class="table_login_footer">
    <tr>
        <td colspan="3" style="text-align:center;font-size:14px;font-weight:bold;height:30px;">
        Chào 
        <a href="<%=Url.Action("Index","MemberHome", new {id=Convert.ToInt32(Session["CurrentUserID"].ToString())})%>"> <%=Html.Encode(((User)Session["CurrentUserObject"]).UserFullName)%></a>
        &nbsp;|&nbsp;<%=Html.ActionLink("Thoát", "Logout", "Home")%>
   </td>
    </tr>
    <tr>
        <td style="text-align:center;" colspan="3">
        <a href="http://ranhroi.vn/" target=_blank>Diễn Đàn </a> &nbsp;  
           &nbsp; |<img alt="" src="../../Images/new_icon.gif" border="0"  /> &nbsp;
            <%: Html.ActionLink("Vip Member", "VIPMember", "Home")%> 
          </td>
    </tr>
   
</table>
   </div>
  <%} %>
 
 </div>



