<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.AlbumListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Đăng ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%if (Model != null)
  { %>
    <h2 class="manager_title_detail">Đăng hình Album: <%=Model.Album.AlbumName%></h2>
    <div style="text-align:right">
      <a href="<% =Url.Action("Details","MemberPhoto", new { id = Model.Album.AlbumID }) %>"><img src="" alt="Slide show"/></a>
    </div>
     <table class="table_list_admin"> 
        
        <% using (Html.BeginForm("UploadFiles", "MemberPhoto", new { id = Model.Album.AlbumID }, FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>           
       <tr>     
            
            <td>
            <%=Html.Encode(ViewData["UploadMessage"])%>
            <%= Html.Hidden("idAlbum", Model.Album.AlbumID)%>
            
            </td>       
            <td>&nbsp;</td>
            <td><input multiple='multiple' type='file' name='file1' id='file1'/></td>
            <td><input id="btAdd" type="submit" class="btn_user_update" value="Đăng Hình" /></td> 
            
        </tr> 
        <%} %>
       </table>
       <div style="text-align:right"><%=Ajax.ActionLink("Xem Hình", "ShowPhoto", new { id = Model.Album.AlbumID }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "imageResult" })%></div>
       <div id="imageResult">
      <%Html.RenderPartial("ImageResult"); %>
       </div>
       <%} %>
       <script type="text/javascript" src="<%= Url.Content("~/scripts/MicrosoftAjax.js") %>"></script>
       <script type="text/javascript" src="<%= Url.Content("~/scripts/MicrosoftMvcAjax.js") %>"></script>
</asp:Content>
