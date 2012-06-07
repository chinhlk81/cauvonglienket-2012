<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.GetUserByID_Result>" %>


<div>
    
<table  class="table_login_footer">

    <tr>
        <td colspan="3" style="text-align:center;font-size:14px;font-weight:bold;height:30px;">
        Chào <%=Html.ActionLink(Model.UserFullName,"Index","MemberHome") %>
        <a href="<%=Url.Action("Index","MemberHome", new {id=Convert.ToInt32(Session["CurrentUser"].ToString())})%>"> <%=Html.Encode(Model.UserFullName) %></a>

        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        <%=Html.ActionLink("Thoát","Logout","Home") %>
        </td>
        
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center;" colspan="3">
        <a href="http://ranhroi.vn/" target=_blank>Diễn Đàn </a> &nbsp;  
        <%if (Model.UserIsVIP != true)
          { %>
           &nbsp; |<img alt="" src="../../Images/new_icon.gif" border="0"  /> &nbsp;
            <%: Html.ActionLink("Vip Member", "VIPMember", "Home")%> 
          <%} %>
          </td>
    </tr>
   
</table>
 </div>

