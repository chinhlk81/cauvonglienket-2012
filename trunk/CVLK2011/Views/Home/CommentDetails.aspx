<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.CommentListViewModel>" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Bình luận
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="title_menu">Nội dung bình luận</h2>
    
    <div>
    <table cellpadding="0" cellspacing="0" style="width:85%">
       
        <% if (Model != null)
           { %>
        
        <tr align="left" style="height:25px">
            <td style="width:90px">
                Thành viên:</td>
            <td>
            <%if (Model.CommentByID.UserID == Utilities.IDefaultUser)
              { %>
            Ban quản trị
            <%}
              else
              { %>
                <%=Html.Encode(Model.CommentByID.UserName)%>
                <%} %>
                </td>
               </tr>
           <%if (Model.CommentByID.BlogID != Utilities.IDefaultBlog)
             {%>
            <tr align="left" style="height:20px">
             <td>
                 Blog :</td>
            
            <td>
                <%=Model.CommentByID.BlogTitle%></td>
                
                </tr>
                <%}
             else if (Model.CommentByID.EventID != Utilities.IDefaultEvent)
             { %>
                <tr align="left" style="height:20px">
                <td>Sự kiện :</td>
                <td><%=Html.Encode(Model.CommentByID.EventName)%></td>
                </tr>
                <%} %>
                <tr align="left" style="height:20px">
                <td>
                Ngày Post :</td>
                
            <td>
                <%:Html.Encode(Model.CommentByID.Datepost) %></td>
                </tr>
             </table>
             <table>
             <tr>
            <td colspan="2" align="left">
                <div class="content_menu">
                    <%=Html.TextArea("FckEditor1", Model.CommentByID.CommentContent, new { @readonly = "true", Style = "visibility:hidden;" })%>
                   
            </div>
        <div id="fcktoolbar" style="visibility:hidden"></div>

                </td>
            </tr>
            <tr>
            <td colspan="2">
            <hr  class="style_hr" style="width:90%"  />
             <br />
            <div id="abc">
            <%Html.RenderPartial("UCAllCommentTypical"); %></div>
            </td>
            </tr>
            <%} %>
        </table>
    </div>
    
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
            oFCKeditor.Height = "600px";
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
