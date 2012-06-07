<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetCommentByID_Result>" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Review bình luận
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Xem comments</h2>
    <div style="text-align:right">
    <a href="<% =Url.Action("MembersComments","MembersManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <div>
    <table  class="table_list_admin">
       
        <% if (Model != null)
           { %>
        <tr align="right">
        
            <td colspan="8">
        <%if (Model.UserID == Utilities.IDefaultUser)
          {%>
           <a href="<% =Url.Action("EditComment",new{id=Model.CommentID}) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a>
        <%} %>
             <%if (Model.Status == CVLK2011.Models.Utilities.cstApprove)
              { %> 
                    <a href="<%= Url.Action("UnApproveComment",new { id = Model.CommentID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
            <%}
               else if (Model.Status == CVLK2011.Models.Utilities.cstUnApprove)
              { %>
                     <a href="<%= Url.Action("ApproveComment",new { id = Model.CommentID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
               <%}
              else
              {%>
                   
                     <a href="<%= Url.Action("ApproveComment",new { id = Model.CommentID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                      <a href="<%= Url.Action("UnApproveComment",new { id = Model.CommentID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
             <% }
              %>
               <a href="<%= Url.Action("DeleteComment",new { id = Model.CommentID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
                </td>
            </tr>
        <tr>
            <td>
                Thành viên</td>
            <td>
            <%if (Model.UserID == Utilities.IDefaultUser)
              { %>
            Ban quản trị
            <%}
              else
              { %>
                <%=Html.Encode(Model.UserName)%>
                <%} %>
                </td>
            <tr>
             <td>
                 Blog</td>
            
            <td>
                <%=Model.BlogTitle%></td>
                
                </tr>
                <tr><td>Sự kiện</td>
                <td><%=Html.Encode(Model.EventName) %></td>
                </tr>
                <tr>
                <td>
                Ngày Post</td>
                
            <td>
                <%:Html.Encode(Model.Datepost) %></td></tr>
            <tr>
            <td>
                Trạng thái</td>
            <td >
                <%:Html.Encode(Model.StatusText) %></td></tr>
                <tr>
                <td>
                Mô tả</td>
            <td >
                <%:Html.Encode(Model.Description) %></td></tr>
           <tr>
             
            <td >
                Nội dung</td>
            <td >
                <div class="content_menu">
        <%=Html.TextArea("FckEditor1", Model.CommentContent, new { @readonly = "true", Style = "visibility:hidden;" })%>
    </div>
<div id="fcktoolbar" style="visibility:hidden"></div>

                </td>
            </tr>
              
            </tr>   
            
            <%} %>
        </table>
    </div>
    <script type="text/javascript">

        function ConfirmDelete() {
            if (confirm("Bạn chắc chắn xóa?") == true) {
                return true;
            }
            else {
                return false;
            }

        }
			     
			    
    </script>
    <script src="../../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
<script src="../../Content/fckeditor/editor/_source/fckconstants.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckeditorapi.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckjscoreextensions.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckscriptloader.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../../Content/fckeditor/") %>';
            //var sSkinPath = '<%= Url.Content("../../Content/fckeditor/editor/skins/office2003/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Config['SkinPath'] = '';
            oFCKeditor.Height = "700px";
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
