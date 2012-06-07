<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.BlogListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function BlogsFilter() {
        var blogsDatePost = $('#datepicker1').val();
        var blogsStatus = $('#blogsStatus').val();
        $.post('/MembersManagement/FilterBlogs',
            { datePost: blogsDatePost, status: blogsStatus},
            function (data) {
                $('#BlogsList').html(data).fadeIn(0);
            });
    }
</script>
<%Html.RenderPartial("BoxMenu"); %>
<h2 class="manager_title">Quản lý Blog</h2>
<div style="text-align:right">
Ngày đăng <input type="text" id="datepicker1" style="width:100px; height:18px" name="DatePost",value="--Ngày đăng--" onchange="BlogsFilter()"/>
<%=Html.DropDownList("blogsStatus", ViewData["blogsStatus"] as SelectList, "---Trạng thái---", new { onchange = "BlogsFilter()" })%>
</div>
<div id="BlogsList">
<%Html.RenderPartial("UCBlogsList"); %>
</div>
</asp:Content>
