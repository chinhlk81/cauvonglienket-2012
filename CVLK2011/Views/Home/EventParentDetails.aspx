<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.EventParentsListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Dịch vụ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="content_menu">
    <div>
    <table>
    <tr>
    <td colspan="2"></td>
    </tr>
     <tr>
    <td rowspan="2">
    <img src="<%=Model.EventParent.EventParentImage %>" alt="" width="480" height="320" />
    </td>
    <td >
    <div id="title">
     <h4>   <%=Model.EventParent.EventParentTitle%></h4>
      </div>
        <div id="more">
        <a style="cursor:pointer" onclick="ShowDetails()">Xem thêm...</a>
        </div>
    </td>
    </tr></table>
    
    </div>
     
     <div id="content" style="visibility:collapse">
        <div id="fcktoolbar" style="visibility:hidden;height:auto"></div>
                 <%=Html.TextArea("FckEditor1", Model.EventParent.EventParentDesc , new { @readonly = "true", Style = "visibility:hidden" })%>
        </div>
    </div>
   <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
<script src="../../Content/fckeditor/editor/_source/fckconstants.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckeditorapi.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckjscoreextensions.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckscriptloader.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
//            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
//            //var sSkinPath = '<%= Url.Content("../../Content/fckeditor/editor/skins/default/") %>';
//            var oFCKeditor = new FCKeditor('FckEditor1');
//            oFCKeditor.BasePath = sBasePath;
//            oFCKeditor.Height = "900px";
//            oFCKeditor.Width = "820px";
//            oFCKeditor.ToolbarSet = 'Basic';
//            oFCKeditor.Config['SkinPath'] = '';
//            oFCKeditor.Config['ToolbarLocation'] = 'Out:fcktoolbar';
//            var abc = oFCKeditor._GetIFrameHtml();
//            alert(abc);
//            
//            oFCKeditor.ReplaceTextarea();
        }
        function FCKeditor_OnComplete(editorInstance) {
            editorInstance.EditorDocument.body.contentEditable = 'false';
            editorInstance.EditorDocument.designMode = 'off';
        }
        function ShowDetails() {
            $('#content').css('visibility', 'visible');
            $("#more").css("visibility", 'collapse');
            $("#title").css("visibility", 'collapse');
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            //var sSkinPath = '<%= Url.Content("../../Content/fckeditor/editor/skins/default/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "900px";
            oFCKeditor.Width = "820px";
            oFCKeditor.ToolbarSet = 'Basic';
            oFCKeditor.Config['SkinPath'] = '';
            oFCKeditor.Config['ToolbarLocation'] = 'Out:fcktoolbar';
            oFCKeditor.ReplaceTextarea();
        }
    </script>
	
</asp:Content>
