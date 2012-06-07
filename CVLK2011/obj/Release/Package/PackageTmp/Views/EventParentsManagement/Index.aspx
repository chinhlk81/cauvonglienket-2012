<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.EventParentsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý dịch vụ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Quản lý dịch vụ</h2>
    <div style="text-align:right"> 
    <a href="<%=Url.Action("Create","EventParentsManagement") %>"><img src="../../Images/admin_add.png" alt="Thêm mới" /> </a>
    </div>
    <div>
    
        <table class="table_list_admin">
            <tr class="title_list_admin">
                <td>
                    Tên dịch vụ</td>
                <td>
                    Mô tả</td>
                
                <td>
                    Xem</td>
                <td>
                    Sửa</td>
                <td>
                    Xóa</td>
            </tr>
            <%if (Model != null)
              { %>
            <% foreach (var item in Model.EventParentsList)
               { %>
            <tr>
                <td>
                    <%=item.EventParentName%>
                </td>
                
                <td>
                    <%=Html.Encode(item.StatusText)%></td>
                <td>
                     <a href="<%=Url.Action("Details", new { id = item.EventParentID }) %>"><img src="../../Images/admin_preview.png" alt="Xem" /></a>
                     </td>
                <td>
                     <a href="<%=Url.Action("Edit", new { id = item.EventParentID }) %>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a>
                     </td>
                <td>
                     <a href="<%=Url.Action("Delete", new { id = item.EventParentID }) %>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
                     </td>
            </tr>
           <%}
              } %>
        </table>
     <div class="pager">        
        <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new {page=x, evp=Model.CurrentEventParents})) %>
     </div>
    </div>

</asp:Content>
