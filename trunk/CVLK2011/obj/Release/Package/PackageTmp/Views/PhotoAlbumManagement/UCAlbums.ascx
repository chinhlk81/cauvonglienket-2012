<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.AlbumListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<table class="table_list_admin">
    <tr class="title_list_admin">
        <td >
            Tên Album</td>
        <td>
            Loại Album</td>
        <td>
            Thành viên</td>
        <td>
            Trạng thái</td>
        <td>
            Xem</td>
        <td>
            Sửa</td>
        <td>
            Xóa</td>
    </tr>
<% foreach (var item in Model.Products)
    { %>
    <tr>
        <td>
            <a href="<% =Url.Action("Details", new { id = item.AlbumID }) %>">   <%=item.AlbumName %></a>
            </td>
        <td>
            <%=CVLK2011.Models.Utilities.AliasDictionary[item.AlbumType].ToString() %>
            </td>
        <td>
            <%if(item.AlbumType=="Member") %>
                <%=item.UserFullName %>
                </td>
        <td align="center">
            <%=item.ConfigText %>
            </td>
        <td align="center">
            <a href="<% =Url.Action("Details", new { id = item.AlbumID }) %>"><img src="../../../Images/admin_preview.png" alt="Xem "/></a>
            </td>
        <td align="center">
            <a href="<% =Url.Action("Edit", new { id = item.AlbumID }) %>"><img src="../../../Images/admin_edit.png" alt="Sửa "/></a>
            </td>
        <td align="center">
            <a href="<% =Url.Action("Delete", new { id = item.AlbumID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa " onclick="return ConfirmDelete() "/></a>
            </td>
    </tr>
<%} %>
</table>
<div class="pager">        
<%: Html.PageLinks(Model.PagingInfo,
    x => Url.Action("Index", new {status=Model.Filter,page=x, category=Model.CurrentCategory})) %>
</div>