<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Album>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Cập nhật thông tin thư viện ảnh</h2>
    <%using (Html.BeginForm("Edit", "PhotoAlbumManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
      { %>

    <table class="table_list_admin">
        <tr class="table_list_admin">
            
            <td style="width: 113px">
                Tên Album</td>
            <td>
            <%=Html.TextBoxFor(model => Model.AlbumName, new { style = "width:250px;" })%>
            <%=Html.ValidationMessageFor(model=>Model.AlbumName) %>
            </td>
        </tr>
       <tr>
        <td>Loại Album</td>
       <td> 
        <%=Html.Encode(Utilities.AliasDictionary[Model.AlbumType])
            
            %>
        </td>
        </tr>
        
        <tr>
            <td style="width: 113px; height: 31px;">
                Trạng thái</td>
            <td style="height: 31px">
                     <%:Html.DropDownList("albumstatus", ViewData["AlbumStatus"] as SelectList, new { style = "width:250px;" })%>
           </td>
        </tr>
        <tr>
            <td style="width: 113px">
                Mô tả</td>
            <td>
                <%=Html.TextAreaFor(model => Model.Description, new { style = "width:450px;" })%></td>
        </tr>        
        <tr>
            <td style="width: 113px">
                &nbsp;</td>
            <td>
                <input id="btnAdd" type="submit" value="Cập nhật" />
            </td>
        </tr>
        </table>
        <%} %>    

</asp:Content>

