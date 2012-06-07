<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật Avatar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div>
<%using (Html.BeginForm("Avatar", "MemberProfile", new { id = Model.UserID }, FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
<table>
<tr>

<td>
<div><%=Html.Encode(ViewData["AvatarMessage"]) %></div>
<img src="/<%=Model.UserPicture %>" alt="<%=Model.UserFullName %>" style="height:190px;width:250px" /></td>
</tr>
<tr>
<td>
<input type ="file" name="uploadFile" id="fileName" />
<input type="submit" value="Đăng ảnh" class="btn_user_update" />
<div id="dvNofile" style="visibility:visible">Có thể đăng tải tập tin ảnh <b>JPG</b>, <b>GIF</b> và <b>PNG</b> </div>
</td>

</tr>

</table>
<%} %>
</div>
<script type="text/javascript">
    function CheckInput() {
        alert("thong bao 1");
        if ($('#file').val().toString()=="") {
            alert("thong bao 2");
            $('#dvNofile').css("visibility", "visible");
            return false;
        }
        else {
            $('#dvNofile').css("visibility", "collapse");
        }
    }
</script>

</asp:Content>
