<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetEventParentByID_Result>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết dịch vụ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Chi tiết dịch vụ</h2>
        <div style="text-align:right">
        <a href="<%=Url.Action("Create","EventParentsManagement") %>"><img src="/../Images/admin_add.png" alt="Tạo mới" /></a>
            <a href="<%=Url.Action("Index","EventParentsManagement") %>"><img src="/../Images/admin_back.png" alt="Trở về" /></a>
        </div>
    <fieldset>
       <table class="table_detail_admin">
       <tr>
       <td class="size-150" style="width: 136px"><div class="display-label">Tên dịch vụ</div></td>
       <td> <div class="display-field"><%: Model.EventParentName %></div></td>
       </tr>
       <tr>
       <td class="size-150" style="width: 136px"><div class="display-label">Nội dung (Tóm tắt)</div></td>
       <td> <div class="display-field"><%: Model.EventParentTitle %></div></td>
       </tr>
        <tr>
       <td class="size-150" style="width: 136px"><div class="display-label">Hình ảnh</div></td>
       <td> <div class="display-field"><img src="<%= Model.EventParentImage %>" alt="hình" style="width: 180px; height:140px"/></div></td>
       </tr>
       <tr>
       <td class="size-150" style="width: 136px"><div class="display-label">Trạnh thái</div></td>
       <td><div class="display-field"><%: Model.StatusText %></div></td>
       </tr>
       <tr>
       <td class="size-150" style="width: 136px">Mô tả</td>
       <td>
        <div class="display-field"><%= Model.EventParentDesc %></div></td>
       </tr>
       <tr>
       <td class="size-150" style="width: 136px"></td>
       <td>
       <a href="<%=Url.Action("Edit",new{id=Model.EventParentID})%>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a>
       <a href="<%=Url.Action("Delete",new{id=Model.EventParentID})%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()" /></a>
       
       </td>
       </tr>
       </table>
        
    </fieldset>
    

</asp:Content>

