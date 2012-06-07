<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MessageListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý tin nhắn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function MessagesFilter() {
        var messageDatePost = $('#datepicker1').val();
        var messageStatus = $('#messagesStatus').val();
        $.post('/MembersManagement/FilterMessages',
        { datePost: messageDatePost, status: messageStatus },
        function (data) {
            $('#messagesList').html(data).fadeIn(0);
        });
    }
    function ConfirmDelete() {
        if (confirm("Bạn chắc chắn xóa?") == true) {
            return true;
        }
        else {
            return false;
        }

    }
</script>
<%Html.RenderPartial("BoxMenu"); %>
<h2 class="manager_title">Quản lý tin nhắn</h2>

<div style="text-align:right"> <a href="<% =Url.Action("Create","MembersManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a></div>
<div style="text-align:right">
Ngày đăng <input type="text" id="datepicker1" style="width:100px; height:18px" name="DatePost",value="--Ngày đăng--" onchange="MessagesFilter()"/>
<%=Html.DropDownList("messagesStatus", ViewData["messagesStatus"] as SelectList, "---Trạng thái---", new { onchange = "MessagesFilter()" })%>   
</div>
<div id="messagesList">
<%Html.RenderPartial("UCMessagesList"); %>
    </div>   
</asp:Content>
