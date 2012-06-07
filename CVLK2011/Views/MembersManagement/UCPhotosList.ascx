<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.PhotosListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<table  class="table_list_admin">
    <tr class="title_list_admin">
        <td>
            Ảnh
            </td>
        <td>
            Thuộc Album
            </td>
        <td>
            Ngày Post
            </td>
        <td>
            Trạng thái
            </td>
        <td>Xem</td>
        <td>Duyệt</td>
        <td>Không duyệt</td>
        <td>Xóa</td>
    </tr>
<%
if (Model != null)
{
    foreach (var item in Model.PhotosList)
    { %>
        <tr align="left">
            <td>
              <a href="<% =Url.Action("MembersReviewPhoto",new { id = item.PhotoID }) %>">  <img alt="" src="<%:item.PhotoPath %>" style="width: 60px" /></a>
              </td>
            <td>
                <%=Html.Encode(item.AlbumName)%></td>
            <td>
               <%=Html.Encode(item.DateUpload)%></td>
                <td align="center">
                <%=Html.Encode(item.StatusText)%></td>
            
            
                 <td align="center">
               <a href="<% =Url.Action("MembersReviewPhoto",new { id = item.PhotoID }) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a>
               </td>
            <%if (item.Status == CVLK2011.Models.Utilities.cstApprove)
                { %>
                    <td style="visibility:collapse" align="center">
                    <a href="<% =Url.Action("ApprovePhoto",new { id = item.PhotoID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                   </td>
                    <td style="width:80px" align="center">
                    <a href="<% =Url.Action("UnApprovePhoto",new { id = item.PhotoID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/>
                    </td> 
              <%}
              else if (item.Status == CVLK2011.Models.Utilities.cstUnApprove)
                {%>
                    <td align="center"><a href="<%=Url.Action("ApprovePhoto", new { id = item.PhotoID })%>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a></td>
                    <td align="center" style="visibility:collapse; width:80px"><a href="<%=Url.Action( "UnApprovePhoto", new { id = item.PhotoID })%>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a></td>                        
               <%}
                else
                { %>
               <td align="center"><a href="<%=Url.Action("ApprovePhoto", new { id = item.PhotoID })%>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a></td>
               <td align="center" style="width:80px"><a href="<%=Url.Action("UnApprovePhoto", new { id = item.PhotoID })%>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a></td> 
               <%} %>
            <td align="center">
               <a href="<% =Url.Action("DeletePhoto",new { id = item.PhotoID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()" /></a>
            </td>
        </tr>
        <%}
          } %>
           </table>
<div class="pager">        
    <%: Html.PageLinks(Model.PagingInfo,
        x => Url.Action("MembersPhoto", new {datePost = Model.photoDateFilter, status = Model.photoStatusFilter, page=x, photo=Model.CurrentPhotos})) %>
     </div>