<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.BlogListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>

<table  class="table_list_admin">
    <tr class="title_list_admin">
        <td>
            Tên Blog
            </td>
        <td>
            Thành viên
            </td>
        <td>
            Ngày đăng
            </td>
        <td>
            Trạng thái  
            </td>
        <td>
            Xem
            </td>
        <td>
            Duyệt
            </td>
        <td>
            Không duyệt
            </td>
        <td>
            Xóa
            </td>
    </tr>
<%
if (Model != null)
{
    foreach (var item in Model.BlogList)
    { %>
    <tr >
        <td>
            <a href="<%=Url.Action("MembersReviewBlog",new { id = item.BlogID }) %>"><%=Html.Encode(item.BlogTitle)%></a>
            </td>
        <td>
            <%:Html.Encode(item.UserName)%>
            </td>
        <td>
            <%:Html.Encode(item.Datepost)%>
            </td>
        <td align="center">
            <%=Html.Encode(item.StatusText)%>
            </td>
        <td align="center">       
            <a href="<% =Url.Action("MembersReviewBlog",new { id = item.BlogID }) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a>
            </td>
        <%if (item.Status == Utilities.cstApprove)
        { %>
            <td style="visibility:collapse" align="center">
                <a href="<% =Url.Action("BlogApprove",new { id = item.BlogID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                </td>
            <td style="width:80px" align="center">
                <a href="<% =Url.Action("BlogUnApprove",new { id = item.BlogID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                </td>
        <%}
        else if (item.Status == CVLK2011.Models.Utilities.cstUnApprove)
        {%>
            <td align="center">
                <a href="<% =Url.Action("BlogApprove",new { id = item.BlogID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                </td>
            <td align="center" style="visibility:collapse; width:80px">
                <a href="<% =Url.Action("BlogUnApprove",new { id = item.BlogID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                </td>
        <%}
        else
        { %>
            <td align="center">
                <a href="<% =Url.Action("BlogApprove",new { id = item.BlogID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                </td>
            <td align="center" style="width:80px">
                <a href="<% =Url.Action("BlogUnApprove",new { id = item.BlogID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                </td>
        <%}%>
        <td style="width:80px" align="center">
            <a href="<% =Url.Action("DeleteBlog",new { id = item.BlogID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
            </td>
    </tr>
    <%}
}%>
</table>
<div class="pager">        
    <%: Html.PageLinks(Model.PagingInfo,
        x => Url.Action("MembersBlog", new { status = Model.Filter, page = x, blog = Model.CurrentBlog }))%>
    </div>