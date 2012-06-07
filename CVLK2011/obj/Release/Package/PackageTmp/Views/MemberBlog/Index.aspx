<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.BlogListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách Blogs
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%;">
       <tr>
            <td colspan="2" align="right">
            <%if (Model.OwnerUser == Model.GuestUser)
              { %>
                    <%:Html.ActionLink("Viết blog", "Create", "MemberBlog")%>
             <%} %>
           </td>
        </tr>
        <tr>
            <td style="width:120px; font-size:14px;color:#4A6EA4;font-weight:bold;">
                <b>Danh sách blog</b></td>
            <td align="right"><hr />
                </td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
    </table>
    <%if (Model != null)
      {
          if (Model.BlogList != null)
          {%>
        <%foreach (var item in Model.BlogList)
          { %>
            <table style="width: 100%;">
            <tr>
                <td rowspan="6" valign="top" style="width:110px;">
                    <div>
                        <img src="/<%=item.ImageUpload %>" alt="" style="width:100px; height:90px"/>
                    </div>
                </td>
                <td class="name_title_link">
                    <%=Html.ActionLink(item.BlogTitle, "Details", new { id = item.BlogID })%>
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.Encode(item.Datepost)%>
                    <%if (Model.OwnerUser == Model.GuestUser)
                      { %>
                            <a href="<%=Url.Action("Edit",new { id = item.BlogID } )%>"><img src="../../../Images/icon_edit_user.png" alt="Sửa" /></a> |<a href="<%=Url.Action("Delete",new { id = item.BlogID }) %>"><img src="../../../Images/deleteIcon.gif" alt="Xóa" onclick="return ConfirmDeleteMemberSite()" /></a>
                    <%} %>
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
   
    <%}
          }%>
          <div class="pager">        
            <%: Html.PageLinks(Model.PagingInfo, x => Url.Action("Index", new { page = x, CurrentBlog = Model.CurrentBlog }))%>
        </div>
      <%} %>

     <%Html.RenderPartial("UCFriendBlog"); %>
    
</asp:Content>
