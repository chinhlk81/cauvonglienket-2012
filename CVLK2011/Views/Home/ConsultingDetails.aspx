<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.ConsultingsListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Góc tư vấn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div class="title_menu">
  Chi tiết góc tư vấn
</div>
    <table style="width:90%;color:#000;font-size:12px">
   <tr>
   <td >
   <div style="color:#AF0007;font-weight:bold" >--Câu hỏi--</div>
   <%= Html.Encode(Model.CurrentConsulting.ConsultingQuestions )%>
   <div></div>
   </td>
   </tr>
   <tr>
   <td style="text-align:justify;border-top:1px solid #ccc;padding-left:30px;padding-right:5px;">
   <br />
   <div style="color:#AF0007;font-weight:bold" >--Trả lời--</div>
   
       <div id="fcktoolbar" style="visibility:hidden"></div>
     <div class="content_menu">
                    <%=Html.TextArea("FckEditor1", Model.CurrentConsulting.ConsultingAnwsers, new { @readonly = "true", Style = "visibility:hidden;" })%>
            </div>
      
   
   </td>
   </tr>
   </table>
   <hr  class="style_hr" style="width:90%"  />
   <br />
    <table style="width:90%">
     
    <tr>
    <td >
    <%Html.RenderPartial("UCConsultingList"); %>
    </td>
    </tr>
    
    </table>
        
        

 <script src="../../../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
<script src="../../Content/fckeditor/editor/_source/fckconstants.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckeditorapi.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckjscoreextensions.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckscriptloader.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../../../Content/fckeditor/") %>';
            //var sSkinPath = '<%= Url.Content("../../Content/fckeditor/editor/skins/office2003/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Config['SkinPath'] = '';
            oFCKeditor.Height = "1000px";
            oFCKeditor.Width = "720px";
            oFCKeditor.ToolbarSet = 'Basic';
            oFCKeditor.Config['scrolling'] = 'no';
            oFCKeditor.Config['ToolbarLocation'] = 'Out:fcktoolbar';
            oFCKeditor.ReplaceTextarea();
        }
        function FCKeditor_OnComplete(editorInstance) {
            editorInstance.EditorDocument.body.contentEditable = 'false';
            editorInstance.EditorDocument.designMode = 'off';
        }
</script>
       
       
        
    

</asp:Content>

