<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MenuConfig>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<table>
<tr>
<td>
 <%=  Html.TextArea("FckEditor1", Model.Contents, new { @readonly = "true", Style = "visibility:hidden" })%>

<div id="fcktoolbar" style="visibility:hidden"></div>
</td>
</tr>
</table>


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
        //var oFCKeditor1 =FCKeditorAPI.GetInstance('FckEditor1');
        oFCKeditor.BasePath = sBasePath;
        oFCKeditor.Height = "300px";
        oFCKeditor.Width = "600px";
        oFCKeditor.ToolbarSet = 'Basic';
        oFCKeditor.Config['ToolbarLocation'] = 'Out:fcktoolbar';
        oFCKeditor.ReplaceTextarea();



    }
    function FCKeditor_OnComplete( editorInstance )
    {
      
        editorInstance.EditorDocument.body.contentEditable='false';
        editorInstance.EditorDocument.designMode='off';
    }




</script>