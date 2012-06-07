<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.AlbumListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <h2 class="manager_title_detail">Chi tiết Album</h2>
    <div style="text-align:right">
        <a href="<% =Url.Action("Create","PhotoAlbumManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      <a href="<% =Url.Action("Index","PhotoAlbumManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
     <table class="table_list_admin"> 
        
        <% using (Html.BeginForm("UploadImage", "PhotoAlbumManagement", new { id = Model.Album.AlbumID }, FormMethod.Post, new { enctype = "multipart/form-data" }))
             {%>    
        <tr class="table_list_admin">
            <td style="width:180px">Tên Album</td>
            <td>Loại Album</td>
            <td>Thành viên</td>
            <td>Trạng thái</td>
            <td>Mô tả</td>            
            <td>&nbsp;</td>            
            <td>&nbsp;</td>            
        </tr>
        <tr>            
            <td><%= Html.Encode(Model.Album.AlbumName)%></td>
            <td><%=Html.Encode(CVLK2011.Models.Utilities.AliasDictionary[Model.Album.AlbumType])%></td>
            <td><%if (Model.Album.AlbumType == "Member") %><%= Html.Encode(Model.Album.UserFullName)%></td>
            <td><%= Html.Encode(Model.Album.ConfigText)%></td>
            <td><%= Html.Encode(Model.Album.Description)%></td>
            <td><%=Ajax.ActionLink("Xem Hình", "ShowPhoto", new { id = Model.Album.AlbumID }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "imageResult" })%></td>
            <td><%= Html.Hidden("idAlbum", Model.Album.AlbumID)%></td>
           
       </tr>     
       <tr>            
            <td><input multiple='multiple' type='file' name='file1' id='file1'/></td>
            <td><input id="btAdd" type="submit"  value="Up Hình" /></td> 
        </tr> 
        <%} %>
       </table>
      <!-- <div id="imageResult"><div>-->
       <div>
       <%Html.RenderPartial("ImageResult"); %>
       </div>
       <script type="text/javascript" src="<%= Url.Content("~/scripts/MicrosoftAjax.js") %>"></script>
       <script type="text/javascript" src="<%= Url.Content("~/scripts/MicrosoftMvcAjax.js") %>"></script>
       
			 <script type="text/javascript">

			     function ConfirmDelete() {
			         if (confirm("Bạn chắc chắn xóa?") == true) {
			             return true;
			         }
			         else {
			             return false;
			         }

			     }
			     
			    
    </script>


</asp:Content>
