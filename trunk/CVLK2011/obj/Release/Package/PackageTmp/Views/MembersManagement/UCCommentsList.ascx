<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.CommentListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace="CVLK2011.Models" %>
<table  class="table_list_admin">
    <tr class="title_list_admin">
        <td>
            Thành viên
           
            </td>
        <td>
            Blog</td>
        <td>
            Sự kiện</td>
        <td>
            Nội dung </td>
        <td>
            Ngày post</td>
        <td >
            Trạng thái</td>
        <td>
            Nổi bậc</td>
        <td>
            Xem</td>
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
    foreach (var item in Model.CommentList)
    { %>
        <tr align="left">
            <td>
                <%:Html.Encode(item.UserName)%>
                </td>
            <td>
                <%=Html.Encode(item.BlogTitle) %>
                </td>
            <td>
                <%=Html.Encode(item.EventName) %>
                </td>
            <td >
            <%=Html.Encode(item.CommentContent) %>
                </td>
            <td>
                <%:Html.Encode(item.Datepost) %>
                </td>
            <td align="center" >
                <%=Html.Encode(item.StatusText) %></td>
            <%if(item.EventID!=Utilities.IDefaultEvent){ %>
               <td style="width:10px" align="center">
                      <%= Html.CheckBox("cmtTypical", item.IsTypical, new { onclick = "Typical('" + item.CommentID + "')" })%>
                    </td>
                    <%}else{ %>
                    <td></td>
                <%} %>
            <td align="center">
            <a href="<% =Url.Action("MembersReviewComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a>
            </td>
             <%if (item.Status == CVLK2011.Models.Utilities.cstApprove)
                { %>
                    <td style="visibility:collapse" align="center">
                        <a href="<% =Url.Action("ApproveComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                        </td>
                    <td style="width:80px" align="center">
                        <a href="<% =Url.Action("UnApproveComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                        </td> 
              <%}
               else if (item.Status == CVLK2011.Models.Utilities.cstUnApprove)
                {%>
                    <td align="center">
                        <a href="<% =Url.Action("ApproveComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                        </td>
                    <td align="center" style="visibility:collapse; width:80px">
                        <a href="<% =Url.Action("UnApproveComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                        </td>                        
               <%}
                else
                { %>
                    <td align="center">
                        <a href="<% =Url.Action("ApproveComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                        </td>
                    <td align="center" style="width:80px">
                        <a href="<% =Url.Action("UnApproveComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
                        </td> 
               <%} %>
            <td>
                <a href="<% =Url.Action("DeleteComment",new { id = item.CommentID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
                </td>
        </tr>
        <%}
    } %>
</table>
<div class="pager">        
    <%: Html.PageLinks(Model.PagingInfo,
    x => Url.Action("MembersComments", new {status=Model.Filter,page=x, comment=Model.CurrentComment})) %>
    </div>
   
  
