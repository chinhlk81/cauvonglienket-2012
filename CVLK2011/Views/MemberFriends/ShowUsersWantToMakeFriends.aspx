<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.FriendsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowUsersWantToMakeFriends
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%using (Html.BeginForm("ShowUsersWantToMakeFriends", "MemberFriends", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
<div class="title_top_user"> <a>Username</a>   / Tìm bạn mới</div>
<div>
    <table style="width: 100%" class="td_edit_user_title">
        <tr>
            <td style="width:200px">
                </td>
        </tr>
    </table>
    <table style="width:100%;">
    <%if (Model != null)
      {
          if (Model.UsersWantToMakeFriendsWithMeList.Count > 0)
          {
              foreach (var item in Model.UsersWantToMakeFriendsWithMeList)
              { %>
                <tr>
                    <td style="width: 115px">
                        <a href="<%=Url.Action("Index","MemberHome",new {id=item.UserIdOfFriend})%>"><img alt="" src="../<%=item.UserPictureOfFriend %>" style="width:114px;" /></a></td>
                    <td valign="top">
                        <div><h3><b><%=Html.ActionLink(item.UserFullNameOfFriend, "Index", "MemberHome", new { id = item.UserIdOfFriend })%></b></h3></div>
                        <div>Giới tính: <%=Html.Encode(item.UserGenderOfFriend)%></div>
                        <div>Tuổi:
                                        <%=Html.Encode(DateTime.Now.Year - item.UserBirthdayOfFriend.Year)%>
                                    
                        </div>
                    </td>
                    <td valign="top">
                        <div><a href="<%=Url.Action("UpdateStatusToFriends","MemberFriends", new {iUserID = Convert.ToInt32( Session["CurrentUserID"].ToString()),iFriendID = item.UserIdOfFriend, strStatus = "Agree"}) %>">Đồng ý</a> | <a href="<%=Url.Action("UpdateStatusToFriends","MemberFriends", new {iUserID = Convert.ToInt32( Session["CurrentUserID"].ToString()),iFriendID = item.UserIdOfFriend, strStatus = "Disagree"}) %>">Từ chối</a></div>
                        </td>
                </tr>
                <tr>
                    <td colspan="3"><hr /></td>
                </tr>
                <%}
          }
          else
          {
              if (ViewData["NoneFriendsMessage"] != null)
              {%>
            <tr>
                <td colspan = "3">
                    <div><%=ViewData["NoneFriendsMessage"]%></div>
                </td>
            </tr>
            <%}
              else
              { %>
              <tr>
                <td colspan = "3">
                    <div>không còn ai để có thể kết bạn</div>
                    <div><a href="<%=Url.Action("Index","MemberFriends",new { id = Convert.ToInt32(Session["CurrentUserID"].ToString())})%>">Quay lại</a> danh sách bạn bè</div>
                </td>
              </tr>
            <%}
          }
    }%>
    </table>
</div>
<div class="pager">        
    <%= Html.PageLinks(Model.UsersWantToMakeFriendsWithMePagingInfo, x => Url.Action("ShowUsersWantToMakeFriends", new {iUserID = Convert.ToInt32(Session["CurrentUserID"].ToString()), page = x, category = Model.UsersWantToMakeFriendsWithMePagingInfo }))%>
</div>
<%} %>

</asp:Content>
