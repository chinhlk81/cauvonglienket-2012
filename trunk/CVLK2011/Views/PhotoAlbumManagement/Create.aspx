<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Album>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Tạo mới album</h2>
    <div style="text-align:right"> 
    <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <%using (Html.BeginForm("Create", "PhotoAlbumManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
      { %>

    <table class="table_list_admin">
        <tr class="table_list_admin">
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 113px">
                Tên Album</td>
            <td>
            <%=Html.TextBoxFor(Model => Model.AlbumName, new { style = "width:250px;" })%>
            <%=Html.ValidationMessageFor(Model=>Model.AlbumName) %>
            </td>
        </tr>
        <tr>
        <td>Loại Album</td>
        <td>        
        <%:Html.DropDownList("AlbumType",new []{
        new SelectListItem{Text="Album của hệ thống",Value="Admin"}}, new { style = "width:250px;" })
            %>
        </td
        <tr>
            <td style="width: 113px">
                Mô tả</td>
            <td>
                <%=Html.TextAreaFor(Model => Model.Description, new { style = "width:450px;" })%></td>
        </tr>        
        <tr>
            <td style="width: 113px">
                &nbsp;</td>
            <td>
                <input id="btnAdd" type="submit"  value="Thêm" />
                <input  type="reset"  value="Làm lại" />            
            </td>
        </tr>
        </table>
        <%} %>        
</asp:Content>
