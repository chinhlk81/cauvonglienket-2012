<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfigsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <h2 class="manager_title">Quản lý Menu</h2>
               
                <div style="text-align:right">
                 <a href="<% =Url.Action("MenuCreate","AdminManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
                </div>
    <div>
        <table   class="table_list_admin">
            <tr class="title_list_admin">
                <td style="width:90%">Tên Menu</td>
                <td style="width:5%">
                    Xem</td>
                <td style="width:5%">
                    Sửa</td>
                <td style="width:5%">
                    Xóa</td>
            </tr>
            <%if (Model != null)
              { %>
            <% foreach (var item in Model.MenuConfigsList)
               { %>
            <tr>
                <td style="width: 139px" class="size-150" align="center">
                <a href="<% =Url.Action("MenuDetail", new { id = item.MenuConfigID }) %>"> <%=Html.Encode(item.MenuConfigName) %></a>
                </td>
               
                <td style="width: 609px" class="modal-600">
                       <a href="<% =Url.Action("MenuDetail", new { id = item.MenuConfigID }) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a></td>
                <td style="width: 609px" class="modal-600">
                        <a href="<% =Url.Action("MenuUpdate", new { id = item.MenuConfigID }) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a></td>
                <td style="width: 609px" class="modal-600">
                         <a href="<% =Url.Action("DeleteMenu", new { id=item.MenuConfigID}) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a></td>
                </tr>
            <%}
              } %>
          
        </table>
         <div class="pager">        
        <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("MenuIndex", new {page=x, config=Model.CurrentMenuConfigs})) %>
     </div>
     </div>

		
</asp:Content>
