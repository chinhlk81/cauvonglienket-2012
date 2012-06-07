<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.FriendsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Bạn mới
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
    CVLK2011.Controllers.Member.MemberFriendsController friendsCtrl = new CVLK2011.Controllers.Member.MemberFriendsController();
%>
<%using (Html.BeginForm("SearchNewFriendsInList", "MemberFriends", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
<div class="title_top_user">Tìm bạn mới</div>
<div>
    <table style="width: 100%" class="td_edit_user_title">
        <tr>
        <td style="width:200px">
            có tất cả <%=ViewData["TotalNewFriends"]%> có thể kết bạn</td>
        <td align"right">
                <%=Html.TextBox("userFullName")%>&nbsp;<input id="Button4" type="submit" value="Tìm bạn" class="btn_user_update"/>
                &nbsp;<%=Html.ActionLink("Tìm kiếm nâng cao", "AdvanceSearch","MemberFriends")%>
            </td>
    </tr>
    </table>
    <table style="width:100%;">
    <%if (Model != null)
      {
          if (Model.UsersCanMakeFriendsList.Count > 0)
          {
              foreach (var item in Model.UsersCanMakeFriendsList)
              { %>
                <tr>
                    <td style="width: 115px">
                        <a href="<%=Url.Action("Index","MemberHome",new {id=item.UserID})%>"><img alt="" src="../<%=item.UserPicture %>" style="width:114px;" /></a></td>
                    <td valign="top">
                        <div><h3><b><a href="<%=Url.Action("Index","MemberHome",new {id=item.UserID})%>"><%=Html.Encode(item.UserFullName) %></a></b></h3></div>
                        <div>Giới tính: <%=Html.Encode(item.UserGender)%></div>
                        <div>Tuổi:<%if (item.UserBirthday!=null)
                                    { %>
                                        <%=Html.Encode(DateTime.Now.Year - item.UserBirthday.Year)%>
                                    <%}
                                    else
                                    {%>
                                        Không xác định
                                        <%} %>
                        </div>
                    </td>
                    <td valign="top">
                        <div>
                            <%
                            int iCurrentUserID = 0;
                            Int32.TryParse(Session["CurrentUserID"].ToString(), out iCurrentUserID);
                            if(friendsCtrl.CheckUserExistInFriendsList(iCurrentUserID, item.UserID, CVLK2011.Models.Utilities.cstNewStatus))
                            {%>
                                Đã gửi yêu cầu kết bạn
                                <%}else if(friendsCtrl.CheckUserExistInFriendsList(iCurrentUserID, item.UserID, CVLK2011.Models.Utilities.ctsAgree))
                                    {%>
                                    Đã kết bạn
                                    <%}else
                                        {%>
                                            <img src="../../../Images/addFriendGray16x16.jpg" alt="" />&nbsp;<a href="<%=Url.Action("MakeFriend","MemberFriends", new {iFriendID = item.UserID}) %>">kết bạn</a>
                                            <%} %>
                            </div>
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
                    <div><a href="<%=Url.Action("Index","MemberFriends")%>">Quay lại</a> danh sách bạn bè</div>
                </td>
              </tr>
            <%}
          }
    }%>
    </table>
</div>
<div class="pager">        
    <%= Html.PageLinks(Model.UsersCanMakeFriendsPagingInfo, x => Url.Action("NewFriends", new { page = x, category = Model.UsersCanMakeFriendsCategory }))%>
</div>
<%} %>
</asp:Content>
