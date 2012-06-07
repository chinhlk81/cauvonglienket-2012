<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MessageListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<table class="table_list_admin">
    <tr class="title_list_admin">
        <td>
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
            Xem </td>
        <td>
            Duyệt</td>
        <td>
            Không duyệt</td>
        <td>
            Xóa</td>
    </tr>
<%
    if (Model != null)
    {
        foreach(var item in Model.MessageList)
        { %>
    <tr>
        <td>
          <a href="<% =Url.Action("MembersReviewMessage",new { id = item.MessageID }) %>">  <%=item.MessageTitle %></a></td>
        <td>
            <%=item.MessageContent %></td>
        <td>
        <%if (item.MessageType == "Admin")
          {%>
        <div style="font-size:14px;">Ban quản trị</div>
        <%}
          else
          { %>
            <%=Html.Encode(item.UserNameSend)%>
            <%} %></td>
        <td>
            <%=Html.Encode(item.UserNameReceipt) %></td>
        <td align="center">
            <%=Html.Encode(item.StatusText) %></td>
        <td align="center">
            <a href="<% =Url.Action("MembersReviewMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a>
            </td>
            <%if (item.Status == CVLK2011.Models.Utilities.cstApprove)
            { %>
                <td style="visibility:collapse" align="center">
                    <a href="<% =Url.Action("ApproveMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                    </td>
                <td style="width:80px" align="center">
                    <a href="<% =Url.Action("UnApproveMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                    </td> 
              <%}
              else if (item.Status == CVLK2011.Models.Utilities.cstUnApprove)
                {%>
                <td align="center">
                    <a href="<% =Url.Action("ApproveMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                    </td>
                <td align="center" style="visibility:collapse; width:80px">
                    <a href="<% =Url.Action("UnApproveMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                    </td> 
               <%}else{ %>
                <td align="center">
                    <a href="<% =Url.Action("ApproveMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                    </td> 
                <td align="center" style="width:80px">
                    <a href="<% =Url.Action("UnApproveMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                    </td> 
               <%} %>
        <td>
            <a href="<% =Url.Action("DeleteMessage",new { id = item.MessageID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
            </td>
    </tr>
    <%}
} %>
</table>
<div class="pager">        
    <%: Html.PageLinks(Model.PagingInfo,
        x => Url.Action("MembersMessage", new {status=Model.Filter, page=x, message=Model.CurrentMessage})) %>
    </div>