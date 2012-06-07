<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfig>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Nội dung Menu</h2>
    <div style="text-align:right">
        <a href="<% =Url.Action("MenuCreate","AdminManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      <a href="<% =Url.Action("MenuIndex","AdminManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>



    <table class="table_detail_admin">
        <tr>
            <td style="width:130px">
                Tên Menu:</td>
            <td>
               <%=Html.Encode(Model.MenuConfigName) %></td>
        </tr>
        <tr>
            <td>
               Nội dung</td>
            <td>
               <% =Model.Contents %></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
               <a href="<%=Url.Action("MenuUpdate",new {id=Model.MenuConfigID}) %>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a>
    <a href="<%=Url.Action("MenuDelete",new {id=Model.MenuConfigID}) %>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a></td>
        </tr>
    </table>




 
</asp:Content>
