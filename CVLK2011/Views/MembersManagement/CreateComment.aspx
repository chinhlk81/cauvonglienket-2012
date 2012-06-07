<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Comment>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CreateComment
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Bình luận</h2>
    <div style="text-align:right">
        <a href="<% =Url.Action("MembersComments","MembersManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <div id="comment">
    <%Html.RenderPartial("UCCreateComment"); %>
    </div>
    <script type="text/javascript">

        function ShowHideRow(parm) {
            if (parm == "event") {
                $("#trEvent").css("visibility", "visible");
                $("#trBlog").css("visibility", "collapse");
            }
            else if (parm == "blog") {
                $("#trEvent").css("visibility", "collapse");
                $("#trBlog").css("visibility", "visible");
            }
            else {
                $("#trEvent").css("visibility", "collapse");
                $("#trBlog").css("visibility", "collapse");
            }
        }
        function checkInputComment() {
            var comment = $("#CommentContent").val();
            if (comment == "") {
                $("#dvcontent").css("visibility", "visible");
                return false;
            }
            else {
                $("#dvcontent").css("visibility", "collapse");
                return true;
            }
        }
    </script>
     <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "500px";
            oFCKeditor.ReplaceTextarea();
        }
</script>
</asp:Content>
