<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div>
     <div id="left">
          <ul>
              <li><%: Html.ActionLink("Thành viên", "Index", "MembersManagement")%></li>
              <li><%: Html.ActionLink("Tìm kiếm nâng cao", "MembersSearch", "MembersManagement")%></li>
              <li><%: Html.ActionLink("Hình ảnh", "MembersPhoto", "MembersManagement")%></li>
              <li><%: Html.ActionLink("Blog", "MembersBlog", "MembersManagement")%></li>
              <li><%: Html.ActionLink("Comments", "MembersComments", "MembersManagement")%></li>
              <li><%: Html.ActionLink("Message", "MembersMessage", "MembersManagement")%></li>
           </ul>
       </div>
</div>
