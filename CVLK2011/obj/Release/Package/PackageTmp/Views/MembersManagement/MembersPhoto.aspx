<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.PhotosListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý hình ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function PhotosFilter() {
        var photoDatePost = $('#datepicker1').val();
        var photosStatus = $('#photosStatus').val();
        $.post('/MembersManagement/FilterPhotos',
        { datePost: photoDatePost, status: photosStatus },
        function (data) {
            $('#photosList').html(data).fadeIn(0);
        });
    }
</script>
<%Html.RenderPartial("BoxMenu"); %> 
<h2 class="manager_title">Photo</h2>
<div style="text-align:right">
Ngày đăng ảnh <input type="text" id="datepicker1" style="width:100px; height:18px" name="DatePost",value="--Ngày đăng--" onchange="PhotosFilter()"/>
<%=Html.DropDownList("photosStatus", ViewData["photosStatus"] as SelectList, "---Trạng thái---", new { onchange = "PhotosFilter()" })%>   
</div>
<div id="photosList">
    <%Html.RenderPartial("UCPhotosList"); %>
    </div>   
<%--<script type="text/javascript">
	$('#datepicker1').change(filter);
	function filter() {
		var value = $('#datepicker1').val();
		var datevalue =new Date(value).getDay();
		alert('i am here: ' + value);
        var actionlink =document.location+'/date?'+value;
		alert('link: '+actionlink);
		document.location = actionlink;
                
    }
        
</script>--%>
</asp:Content>
