<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.BlogListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>

  <br />

      <table style="width: 100%;">
       
        <tr>
            <td style="width:110px; font-size:14px;color:#4A6EA4;font-weight:bold;">
                <b> <%=Html.ActionLink("Blog bạn bè", "FriendBlog", new { id=Model.GuestUser})%></b></td>
            <td align="right"><hr />
                </td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
    </table>

    <%if (Model.FriendBlogList != null)
      { %>
    <%foreach (var item in Model.FriendBlogList)
      { %>
    <table style="width: 100%;">

        <tr>
        
            <td rowspan="6" valign="top" style="width:110px;">
                <div>
                        <img src="<%=item.ImageUpload %>" alt="" style="width:100px; height:90px"/>
               </div>
               </td>
        
            <td class="name_title_link">
                <%=Html.ActionLink(item.BlogTitle, "Details", new { id = item.BlogID })%>
                </td>
        </tr>
        <tr>
            <td>
               <%=Html.Encode(item.Datepost)%>
             </td>
        </tr>
        <tr>
            <td style="height: 11px">
            <%if (item.BlogContent.Length > 200)
              { %>
                       
                    <%= item.BlogContent.Remove(200)%>...
                    <%}
              else
              { %>
                       <%=item.BlogContent%>
                    <%} %> 
               </td>
        </tr>
         
    </table>
    <hr />
    <%}%>
      
       <%--<div class="pager">        
            <%: Html.PageLinks(Model.FriendPagingInfo, x => Url.Action("Index", new { page = x, CurrentFriendBlog = Model.CurrentFrindBlog }))%>
        </div>--%>
        <div style="text-align:right"><h6 class="title_blog"> <%=Html.ActionLink("Xem tất cả", "FriendBlog", new { id=Model.GuestUser})%></h6></div>
        <%} %>
       