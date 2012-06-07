<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.AdListViewModel>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>
    <table>
        <tr>
          <th>Hình ảnh</th>
            <th>
                Tiêu đề
            </th>
            <th>
                Nội dung
            </th>
            <th>
            Trang hiện thị
            </th>
            <th>Vi trí</th>
            <th>Liên kết</th>
            <th>Trạng thái</th>
            
            <th>Xem</th>
            <th>Sửa</th>
            <th>Xoá</th>
        </tr>
        
   <%if (Model != null)
     {
         if (Model.AdList != null)
         {
             foreach (var item in Model.AdList)
             {
          %>
    
        <tr>
          <td style="width:80px;height:80px;>
          <a href="<%=Url.Action("Details",new{id=item.AdID})%>">
        <%=Html.FlashPlayerEmbed(ResolveClientUrl("~/Content/Flash" + item.AdImageThumbPath), "", 200, 180, new { flashvars = "file=" + item.AdImageThumbPath + "&autostart=true", allowscriptaccess = "Always", allowfullscreen = "true" })%>
        </a></td>
            <td><%=item.AdTitle %></td>
            <td>
            <%if (item.AdContent.Length > 100)
              { %>
              <%=item.AdContent.Substring(0,100)%>...
            <%}
              else
              { %>
            <%=item.AdContent%>
            <%} %>
            </td>
            <td><%=Utilities.AliasDictionary[item.OnPage] %></td>
            <td><%=Utilities.AliasDictionary[item.Position] %></td>
            <td><%=item.AdLink %></td>
            <td><%=Utilities.AliasDictionary[item.AAStatus]%></td>
            <td>
               
                 <a href="<% =Url.Action("Details",new{id=item.AdID}) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a></td>
              <td>
               
                <a href="<%=Url.Action("Edit",new {id=item.AdID})%>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a></td>
                <td>
                <a href="<%= Url.Action("Delete", new { id = item.AdID })%>"> <img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
            </td>
        </tr>
    
    <% }%>
    <tr>
    <td colspan="10">
   <div class="pager2">
    <%=Ajax.Pager(Model.PagingInfo.CurrentPage, Model.PagingInfo.TotalItems, "AdList",Model.Filter, Model.PagingInfo.ItemsPerPage, "Paging")%>
       </div></td></tr>
       <%
             }
         }
     %>
      
    </table>

  

