<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetCommentByID_Result>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CreateComment
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Bình luận</h2>
    <div style="text-align:right">
        <a href="<% =Url.Action("MembersComments","MembersManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
   <div>
 <% using (Html.BeginForm("EditComment", "MembersManagement", new { entype = "multipart/form-data" }))
    { %>
     
   <table class="table_detail_admin">
                    <tr>
                    <td colspan="2" align="center">
                    <b><%=ViewData["commentMessage"]%></b>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="2">
                    <%if (Model.EventID != Utilities.IDefaultEvent)
                      { %>
                      Sự kiện: <%=Model.EventName %>
                    <%}
                      else if (Model.BlogID != Utilities.IDefaultBlog)
                      { %>
                         Blog:<%=Model.BlogTitle %>
                    <%}
                      else
                      { %>
                       
                    Tổng hợp từ ban quản trị
                    
                    <%} %>
                    </td>
                    </tr>
                    <tr>
                    <td>Nội dung</td>
                        <td >
                         <%= Html.TextArea("FckEditor1", Model.CommentContent, new { @name = "FckEditor1", @id = "CommentContent", Style = "visibility:hidden" })%>
        
                           <%--<%=Html.TextArea(model => model.CommentContent, new { Style = "width:400px;border:1px solid #B4C6DC;height:200px" })%>--%>
                           <%=Html.ValidationMessageFor(model => model.CommentContent)%>   
                           <div id="dvcontent" style="text-align:left;color:Gray;font-size:14px;visibility:collapse">Vui lòng nhập nội dung bình luận!</div>
                         </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="left">
                           <input id="Submit" class="btn_user_update" type="submit" value="Gửi" onclick="return checkInputComment()" />
                        </td>
                        
                    </tr>
                </table>
<%} %>
 </div>
    <script type="text/javascript">

        
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
     <script src="../../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "500px";
            oFCKeditor.ReplaceTextarea();
        }
</script>
</asp:Content>
