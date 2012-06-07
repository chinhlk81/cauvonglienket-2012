<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Album>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo hình ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2 class="title_top_user">Tạo mới album</h2>

    <div style="text-align:right"> 
    <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <%using (Html.BeginForm("Create", "MemberPhoto", FormMethod.Post, new { enctype = "multipart/form-data" }))
      { %>

    <table class="table_list_admin">
        <tr class="table_list_admin">
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="message_title_left">
                Tên Album</td>
            <td>
            <%=Html.TextBoxFor(Model => Model.AlbumName, new { Style = "width:400px;border:1px solid #B4C6DC" })%>
            <%=Html.ValidationMessageFor(Model=>Model.AlbumName) %>
            </td>
        </tr>
        <tr>
            <td class="message_title_left">
                Mô tả
            </td>
            <td>
                <%=Html.TextAreaFor(Model => Model.Description, new { Style = "width:406px;border:1px solid #B4C6DC" })%>
            </td>
        </tr>        
        <tr>
            <td style="width: 113px">
                &nbsp;
            </td>
            <td>
                <input id="btnAdd" type="submit" class="btn_user_update" value="Lưu" />
            </td>            
        </tr>
        </table>
        <%} %>  

</asp:Content>
