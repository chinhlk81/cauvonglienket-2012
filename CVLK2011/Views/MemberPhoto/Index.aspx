<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MemberAlbumListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%if (Session["CurrentUserID"].ToString() == Session["GuestUserID"].ToString())
  { %>
    
    <table style="width:100%;text-align:center;" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_edit_user_title" colspan="2" align="left">
              Album của tôi </td>
           
                <td align="right" class="td_edit_user_title">
                
                 <a href="<%=Url.Action("Create","MemberPhoto")%>"><img src="../../../Images/icon_plus.png" alt="Tạo album" /></a>
                 </td>
        </tr>
        <%int count = 0;
            if(Model.AlbumLists!=null){
                foreach (var item in Model.AlbumLists)
                {
                    count++;
                    if (count == 1)
                    {%>
            <tr><td><br /></td></tr>
                <td>
                    <div><a href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><img src="<%=item.PhotoPath %>" alt="" width="150px" height="100px" /></a></div>
                    <div class="name_album"><a  href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><%=item.AlbumName%></a></div>
                    <div><%=item.NumberPho%> photo 
                    |<a  href="<% =Url.Action("UploadImages", "MemberPhoto", new {id=item.AlbumID})%>">Đăng ảnh</a>
                    |<a  href="<% =Url.Action("EditInfo", "MemberPhoto", new {id=item.AlbumID})%>">Sửa</a></div>
                </td>           
               
            <%}
                    if (count < 4 && count != 1)
                    {%>                
                 <td>
                    <div><a href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><img src="<%=item.PhotoPath %>" alt="" width="150px" height="100px" /></a></div>
                    <div class="name_album"><a  href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><%=item.AlbumName%></a></div>
                    <div><%=item.NumberPho%> photo
                    |<a  href="<% =Url.Action("UploadImages", "MemberPhoto", new {id=item.AlbumID})%>">Đăng ảnh</a>
                    |<a  href="<% =Url.Action("EditInfo", "MemberPhoto", new {id=item.AlbumID})%>">Sửa</a></div>
                </td>                         
            <%}
                    if (count == 3)
                    {
                        count = 0; %>
                         
            </tr>
           
            <%}
                }%>
                <tr><td>
                 <div class="pager" style="text-align:right">        
        <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new {page=x, category=Model.CurrentAlbum})) %>
        </div></td></tr>
         <% } %>         
    </table>   
      <br />
<%}
  else
  { %>
   <table style="width:100%;text-align:center;" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_edit_user_title" colspan="2" align="left">
              Album của tôi </td>
           
        </tr>
        <%int count = 0;
      if(Model.AlbumLists!=null){
          foreach (var item in Model.AlbumLists)
          {
              count++;
              if (count == 1)
              {%>
            <tr>
                <td>
                    <div><a href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><img src="<%=item.PhotoPath %>" alt="" width="150px" height="100px" /></a></div>
                    <div class="name_album"><a  href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><%=item.AlbumName%></a></div>
                    <div><%=item.NumberPho%> photo 
                    </div>
                </td>           
               
            <%}
              if (count < 4 && count != 1)
              {%>                
                 <td>
                    <div><a href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><img src="<%=item.PhotoPath %>" alt="" width="150px" height="100px" /></a></div>
                    <div class="name_album"><a  href="<% =Url.Action("Details","MemberPhoto", new {id=item.AlbumID})%>"><%=item.AlbumName%></a></div>
                    <div><%=item.NumberPho%> photo
                    </div>
                </td>                         
            <%}
              if (count == 3)
              {
                  count = 0; %>
                         
            </tr>
            
            <%}
          }%>
          <tr><td>
                 <div class="pager" style="text-align:right">        
        <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new {page=x, category=Model.CurrentAlbum})) %>
        </div></td></tr>
         <% } %>         
    </table>    
    <br />
<%} %>
</asp:Content>
