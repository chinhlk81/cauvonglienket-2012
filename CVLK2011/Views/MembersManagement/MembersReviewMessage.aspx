<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetMessageByID_Result>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Review tin nhắn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

       <h2 class="manager_title_detail">Xem tin nhắn</h2>
       <div style="text-align:right">
       <a href="<% =Url.Action("MembersMessage","MembersManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
       </div>
 <div>
    <table class="table_list_admin">
    <tr class="title_list_admin">
        <td>
            &nbsp;
            Tiêu đề</td>
        <td>
            Nội dung</td>
        <td>
            Người gởi</td>
        <td>
            Người nhận</td>
        <td>
            Trạng thái</td>
        <td>
            Mô tả</td>
    </tr>
    <%if (Model != null)
      { %>
    <tr>
        <td>
            <%=Html.Encode(Model.MessageTitle)%></td>
        <td>
            <%=Html.Encode(Model.MessageContent)%></td>
        <td>
            <%=Html.Encode(Model.UserNameSend)%></td>
        <td>
            <%=Html.Encode(Model.UserNameReceipt)%></td>
        <td>
            <%=Html.Encode(Model.StatusText)%></td>
        <td>
            <%=Html.Encode(Model.MessageDesc)%></td>
       </tr>
        <tr>
            <td></td>
             <td>
             <%if (Model.Status == CVLK2011.Models.Utilities.cstApprove)
              { %> 
                    <a href="<%= Url.Action("UnApproveMessage",new { id = Model.MessageID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="UnApprove Message"/></a>
            <%}
               else if (Model.Status == CVLK2011.Models.Utilities.cstUnApprove)
              { %>
                     <a href="<%= Url.Action("ApproveMessage",new { id = Model.MessageID }) %>"><img src="../../../Images/admin_duyet.png" alt="Approve Message"/></a>
               <%}
              else
              {%>
                   
                     <a href="<%= Url.Action("ApproveMessage",new { id = Model.MessageID }) %>"><img src="../../../Images/admin_duyet.png" alt="Approve Message"/></a>
                      <a href="<%= Url.Action("UnApproveMessage",new { id = Model.MessageID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="UnApprove Message"/></a>
             <% }
              %>
               <a href="<%= Url.Action("DeleteMessage",new { id = Model.MessageID }) %>"><img src="../../../Images/admin_xoa.png" alt="Delete" onclick="return ConfirmDelete()"/></a>
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
