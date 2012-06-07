<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfig>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Giới thiệu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="title_menu">
    
     Giới Thiệu

    </div>
    <div id="fcktoolbar" style="visibility:hidden"></div>
    <div class="content_menu">
     <%=  Html.TextArea("FckEditor1", Model.Contents, new { @readonly = "true", Style = "visibility:hidden;" })%>
   </div><!--End #mainContent-->


   <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
<script src="../../Content/fckeditor/editor/_source/fckconstants.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckeditorapi.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckjscoreextensions.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckscriptloader.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            //var sSkinPath = '<%= Url.Content("../../Content/fckeditor/editor/skins/office2003/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.Config['SkinPath'] = '';
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "1000px";
            oFCKeditor.Width = "820px";
            oFCKeditor.ToolbarSet = 'Basic';
            oFCKeditor.Config['ToolbarLocation'] = 'Out:fcktoolbar';
            oFCKeditor.ReplaceTextarea();
        }
        function FCKeditor_OnComplete(editorInstance) {
            editorInstance.EditorDocument.body.contentEditable = 'false';
            editorInstance.EditorDocument.designMode = 'off';
        }
</script>
	  			
		   
		


</asp:Content>
