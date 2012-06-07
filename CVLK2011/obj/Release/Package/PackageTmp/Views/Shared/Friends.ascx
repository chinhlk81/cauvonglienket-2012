<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MemberHomeListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<div>
<h3 class="ds_banbe"></h3>
         <table class="ds_banbe">
               <%if (Model != null)
                 {
                     if (Model.FriendList != null)
                     {
                         foreach(var item in Model.FriendList)
                             
                         {
                      %>
                 <tr>
                     <td style="width:55px">
                          <img alt="" src="/<%=item.PictureOfFriend %>" width="50px"  /> </td>
                     <td >
                       <a href="<%=Url.Action("Index","MemberHome",new { id=item.UserIdOfFriend }) %>"><%=Html.Encode(item.FullNameOfFriend)%></a>
                     </td>
                 </tr>
                 
                 <%}%>
                      <tr><td colspan="2" style="text-align:right"><a href="<%=Url.Action("Index","MemberFriends",new{id=Model.UserIDOnWall}) %>">Xem tất cả</a></td></tr>   
                <% }%>
                 
                 <%} %>
             </table>
             
</div>
