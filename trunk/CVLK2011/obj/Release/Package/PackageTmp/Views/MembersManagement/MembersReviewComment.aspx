<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetCommentByID_Result>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Review hình ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Xem comments</h2>
    <div style="text-align:right">
    <a href="<% =Url.Action("MembersComments","MembersManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <div>
    <table  class="table_list_admin">
        <tr class="title_list_admin">
            <td>
                Thành viên</td>
            <td>
                 Blog</td>
            <td>Sự kiện</td>
            <td>
                Ngày Post</td>
                <td>
                Trạng thái</td>
            <td>
                Mô tả</td>
            <td >
                Nội dung</td>
            
            
        </tr>
        <% if (Model != null)
           { %>
        
        <tr align="left">
            <td>
                <%:Html.Encode(Model.UserName) %></td>
            <td>
                <%=Model.BlogTitle%></td>
                <td><%=Html.Encode(Model.EventName) %></td>
            <td>
                <%:Html.Encode(Model.Datepost) %></td>
            <td >
                <%:Html.Encode(Model.StatusText) %></td>
            <td >
                <%:Html.Encode(Model.Description) %></td>
            <td >
                <%:Html.Encode(Model.CommentContent) %></td>
              
            </tr>   
            <tr>
            <td colspan="8">
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
</asp:Content>
