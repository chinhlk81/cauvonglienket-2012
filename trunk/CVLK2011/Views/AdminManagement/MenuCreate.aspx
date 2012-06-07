<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfig>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Tạo Menu</h2>
     <div style="text-align:right"> <a href="<% =Url.Action("MenuIndex") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a></div>
    <% using (Html.BeginForm("MenuCreate", "AdminManagement", FormMethod.Post, new  {enctype = "multipart/form-data" }))
       {%>
       <%-- <%: Html.ValidationSummary(true)%>--%>

        <fieldset>
            
            <div class="editor-label">
               Tên Menu
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(Model => Model.MenuConfigName)%>
                <%: Html.ValidationMessageFor(Model => Model.MenuConfigName)%>
            </div>
            
            <div class="editor-label">
                Nội dung
            </div>
            <div class="editor-field">
              <%= Html.TextArea("FckEditor1", "", new { @name = "FckEditor1" })%>
               
                <%: Html.ValidationMessageFor(Model => Model.Contents)%>
            </div>
            
            <p>
                <input type="submit" value="Lưu" />
                <input type="reset" value="Hủy" />
            </p>
        </fieldset>

    <% } %>

     <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "500px";
            oFCKeditor.ReplaceTextarea();
        }
</script>

</asp:Content>

