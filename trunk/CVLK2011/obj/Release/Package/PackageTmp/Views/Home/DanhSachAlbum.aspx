

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.AlbumCatalogueListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="title_menu">
    
    Thư viện ảnh

    </div>
    <div class="content_menu">

   
    <%if(Model!=null){

          if (Model.Albums != null)
          {
           %>
      	<table style="width:100%;text-align:center;border-top:1px solid #ccc;padding-top:20px;">            
        <%int count = 0;
          foreach (var item in Model.Albums)
          {
              count++;
              if (count == 1)
              {%>
            <tr>
                <td class="photoalbum_frame" style="height:175px">
                    <p><a  href="<% =Url.Action("ChiTietAlbum","Home", new {id=item.AlbumID})%>"><%=item.AlbumName%></a></p>
                    <a style="position:relative;top:-10px" href="<% =Url.Action("ChiTietAlbum","Home", new {id=item.AlbumID})%>"><img src="<%=item.PhotoPath %>" alt="" width="194px" height="120" /></a>
                </td> 
               
            <%}
              if (count < 4 && count != 1)
              {%>
                
                <td class="photoalbum_frame">
                    <p><a href="<% =Url.Action("ChiTietAlbum","Home", new {id=item.AlbumID})%>"><%=item.AlbumName%></a></p>
                    <a style="position:relative;top:-10px"  href="<% =Url.Action("ChiTietAlbum","Home", new {id=item.AlbumID})%>"><img src="<%=item.PhotoPath %>" alt="" width="194px" height="120"/></a>
                </td>                       
            <%}
              if (count == 3)
              {
                  count = 0; %>
                         
            </tr>
            <%}
          }
          }%>
          
        
        </table>    
        </div>
        <div class="pager" style="text-align:right">        
        <%: Html.PageLinks(Model.PagingInfo,
                        x => Url.Action("DanhSachAlbum", new { page = x, category = Model.CurrentAlbums }))%>
        </div>
        <%} %>
        <br />
        <br />
</asp:Content>