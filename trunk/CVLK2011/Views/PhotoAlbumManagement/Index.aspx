<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.AlbumListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý thư viện ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script src="../../../Scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="../../../Scripts/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
<script src="../../../Scripts/jquery.cascadingDropDown.js" type="text/javascript"></script>
<script type="text/javascript">
    function ConfirmDelete() {
        if (confirm("Bạn chắc chắn xóa?") == true) {
            return true;
        }
        else {
            return false;
        }

    }

    function AlbumsFilter() {
        var userID = $('#userID').val();
        var albumType = $('#albumType').val();
        var albumStatus = $('#albumStatus').val();
        
        $.post('/PhotoAlbumManagement/FilterAlbums',
            { userID: userID, albumType: albumType, albumStatus: albumStatus },
            function (data) {
                $('#albumsList').html(data).fadeIn(0);
            });
    }
</script>
    
<h2 class="manager_title">Album ảnh</h2>
<div style="text-align:right"><a href="<%=Url.Action("Create","PhotoAlbumManagement") %>"><img src="../../Images/admin_add.png" alt="Tạo mới" /></a></div>
<div style="text-align:right">
    <%=Html.DropDownList("albumStatus", ViewData["AlbumStatus"] as SelectList, "-- Trạng thái --", new { onchange = "AlbumsFilter()" })%>
    <%=Html.DropDownList("albumType",new[] {
            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstAlbumTypeAdmin], Value=Utilities.cstAlbumTypeAdmin},
            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstAlbumTypeEvent], Value=Utilities.cstAlbumTypeEvent},
            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstAlbumTypeMember], Value=Utilities.cstAlbumTypeMember},
            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstAlbumTypeShare], Value=Utilities.cstAlbumTypeShare},
            }, "--Loại album--", new { onchange = "AlbumsFilter()" })%>
    </div> 
<div id="albumsList">
    <%Html.RenderPartial("UCAlbums"); %>
    </div>
</asp:Content>
