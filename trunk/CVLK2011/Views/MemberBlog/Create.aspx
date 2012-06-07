<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Blog>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
<script type="text/javascript">
    window.onload = function () {
        var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
        var sSkinPath = '<%= Url.Content("../../Content/fckeditor/editor/skins/office2003/") %>';
        var oFCKeditor = new FCKeditor('FckEditor1');
        oFCKeditor.BasePath = sBasePath;
        oFCKeditor.Height = "500px";
        oFCKeditor.ReplaceTextarea();
    }
    </script>
    <h2>Viết Blog</h2>
   <%using (Html.BeginForm("Create", "MemberBlog", FormMethod.Post, new { enctype = "multipart/form-data" }))
     { %>
    <div >
        <table style="width:100%;">
            <tr>
                <td style="width: 90px">
                    Tiêu đề</td>
                <td>
                    <%=Html.TextBoxFor(model => model.BlogTitle, new { Style="width:550px"})%>
                    <%=Html.ValidationMessageFor(Model =>Model.BlogTitle) %>
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    Ảnh minh họa</td>
                <td>
                    <input id="File1" type="file" name="upLoadFile"/></td>
            </tr>
            <tr>
                <td colspan="2">
                <%:Html.TextArea("FckEditor1", "", new { @name = "FckEditor1",Style = "visibility:hidden" })%>
                <%= Html.ValidationMessageFor(model=>model.BlogContent)%>
                </td>
            </tr>
            
            
            <tr>
                <td >
             </td>
                <td align="right">
                    <input id="Submit1" type="submit" value="Đăng Blog" style="width:80px"/>
                        
                        </td>
                <td>
                    </td>
            </tr>
        </table>
    </div>
    <%} %>

</asp:Content>
