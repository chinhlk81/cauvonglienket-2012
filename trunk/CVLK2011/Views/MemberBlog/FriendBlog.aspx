<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.FriendsBlogListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Blog bạn bè
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%;">
       <tr>
            <td colspan="2" align="right">
               &nbsp;</tr>
       <tr>
            <td style="width:120px; font-size:14px;color:#4A6EA4;font-weight:bold;">
                <b>Danh sách blog</b></td>
            <td align="right"><hr />
                </td>
        </tr>
        <tr>
            <td colspan="2">
            <div style="text-align:right"><%=Html.ActionLink("Trở về", "Index", new {id=Convert.ToInt32(Session["GuestUserID"])})%></div>
            </td>
        </tr>
    </table>
    <%if (Model != null)
      {
          if (Model.FriendBlogList != null)
          {
              foreach (var item in Model.FriendBlogList)
              { %>
    <table style="width: 100%;">
        <tr>
        
            <td rowspan="6" valign="top" style="width:110px;">
                <div>
                        <img src="<%=item.ImageUpload %>" alt="" style="width:100px; height:90px"/>
               </div>
               </td>
        
            <td>
                <%=Html.ActionLink(item.BlogTitle, "Details", new { id = item.BlogID })%>
                </td>
        </tr>
        <tr>
            <td>
               <%=Html.Encode(item.Datepost)%>
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
      
    
      <div class="pager">        
            <%: Html.PageLinks(Model.PagingInfo, x => Url.Action("FriendBlog", new { page = x, CurrentBlog = Model.CurrentBlog }))%>
        </div>
    <%}
      }%>
</asp:Content>
