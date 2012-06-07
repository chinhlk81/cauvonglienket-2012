<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.FriendsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách bạn bè
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    
%>
<%using (Html.BeginForm("SearchFriendsInList", "MembersManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
    <h2 class="table_list_admin"> Danh sách bạn bè</h2>
    <table class="table_list_admin" style="width: 100%;"  cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 70%;" valign="top">
                <table class="table_list_admin" style="width: 100%;"  cellpadding="0" cellspacing="0">
                    <tr>
                        <td >Có tất cả <b><%=ViewData["TotalFriends"] %></b> bạn</td>
                        <td  align="right">
                        <%=Html.Hidden("userID", ViewData["UserID"])%>
                        <%=Html.TextBox("FullName") %>
                        <input id="btnSearch" style="width: 27px; height: 25px; background-image: url(../../../Images/i_search.gif)" type="submit" value="" />&nbsp;
                        </td>
                    </tr>
                </table>
                <table style="width:100%;">
                <%if (Model != null)
                {
                    if (Model.FriendsOfCurrentUserList.Count > 0)
                    {
                        int itemp = 0;
                        for (int i = 0; i < Model.FriendsOfCurrentUserList.Count; i = itemp)
                        {
                            if (i % 4 == 0)
                            {%>
                            <tr>
                            <%for (int j = 0; j < 4; j++)
                                {
                                    if (itemp <= Model.FriendsOfCurrentUserList.Count - 1)
                                    {
                                        var item = Model.FriendsOfCurrentUserList[itemp];%>
                                    <td style="width: 120px;text-align:center">
                                    <%=Html.HiddenFor(id => item.UserIdOfFriend)%>
                                    <div>
                                        <a href="<%=Url.Action("Index","MemberHome",new {id=item.UserIdOfFriend})%>"><img alt="" src="../<%=item.PictureOfFriend %>" style="width:110px; height:110px;" /></a>
                                        </div>
                                    <div><b><a href="<%=Url.Action("Index", "MemberHome", new { id = item.UserIdOfFriend })%>"><%=Html.Encode(item.FullNameOfFriend)%></a></b></div>
                                    <%--<div> <%:Html.ActionLink("Xóa", "Delete", new RouteValueDictionary { { "iUserID", Convert.ToInt32(Session["CurrentUserID"].ToString()) }, { "iFriendID", item.UserIdOfFriend }, { "iPage", Model.FriendsOfCurrentUserPagingInfo.CurrentPage }, { "cauthongbao", "Bạn có muốn xóa người bạn này?" } }, new { onclick = "return ConfirmDeleteMemberSite()" })%></div>--%>
                                    <div> 
                                    <%=Html.ActionLink("Xóa", "Delete", new { iUserID = Convert.ToInt32(ViewData["UserID"]), iFriendID = item.UserIdOfFriend, iPage = Model.FriendsOfCurrentUserPagingInfo.CurrentPage, cauthongbao = "Bạn có muốn xóa người bạn này?" })%>
                                    </div>
                                    </td>
                                <%}
                                    itemp++;
                                }%>
                            </tr>
                        <%}
                        }
                    }
                }%>     
            </table>
            <div class="pager">        
                <%=Html.PageLinks(Model.FriendsOfCurrentUserPagingInfo, x => Url.Action("FriendsList", new { page = x, category = Model.FriendsOfCurrentUserCategory }))%>
            </div>
            </td>
        </tr>
    </table>
<%} %>

</asp:Content>
