<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.CommentListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý comments
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
<script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
 
<script type="text/javascript">
    function CommentsFilter() {
    var commentsDatePost = $('#datepicker1').val();
    var commentsStatus = $('#commentsStatus').val();
    $.post('/MembersManagement/FilterComments',
        { datePost: commentsDatePost, status: commentsStatus },
        function (data) {
            $('#commentsList').html(data).fadeIn(0);
        });
    }

      function Typical(id) {
        $.post("/MembersManagement/CheckTypical", { id: id });
    }

</script>
<%Html.RenderPartial("BoxMenu"); %>
<h2  class="manager_title">Quản lí Bình luận</h2>
<div style="text-align:right">
Ngày đăng <input type="text" id="datepicker1" style="width:100px; height:18px" name="DatePost",value="--Ngày đăng--" onchange="CommentsFilter()"/>
<%=Html.DropDownList("commentsStatus", ViewData["commentsStatus"] as SelectList, "---Trạng thái---", new { onchange = "CommentsFilter()" })%>
</div>   
<div id="commentsList">
<%Html.RenderPartial("UCCommentsList"); %>
</div>
</asp:Content>
