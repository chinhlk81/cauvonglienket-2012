<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Blog>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cập nhật Blog</h2>
   <%using (Html.BeginForm("Edit", "MemberBlog", FormMethod.Post, new { enctype = "multipart/form-data" }))
     { %>
    <div >
        <table style="width:100%;">
            <tr>
                <td style="width: 81px">
                    Tiêu đề</td>
                <td>
                    <%=Html.TextBoxFor(model => model.BlogTitle, new { Style = "width:550px" })%>
                    <%=Html.ValidationMessageFor(model =>model.BlogTitle) %>
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width:auto">
                    Ảnh minh họa</td>
                <td>
                    <img src="../<%=Model.ImageUpload %>" alt="Hình ảnh" style="width:90px; height:90px"/> &nbsp;
                    <input id="File1" type="file" name="editFile"/></td>
            </tr>
            <tr>
                <td colspan="2">
                 <%=Html.TextArea("FckEditor1", Model.BlogContent, new { @name = "FckEditor1" })%>
                <%= Html.ValidationMessageFor(model=>model.BlogContent)%>
                </td>
            </tr>
            
            
            <tr>
                <td style="width: 81px">
             </td>
                <td align="right">
                    <input id="Submit1" type="submit" value="Cập nhật" style="width:80px"/></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <%} %>
     <script src="../../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "400px";
            oFCKeditor.ReplaceTextarea();
        }
</script>

</asp:Content>
