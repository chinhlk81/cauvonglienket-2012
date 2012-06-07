<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.FriendsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Danh sách bạn bè
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="../../../Scripts/jquery.autocomplete.js"></script>
    <link href="../../../Content/jquery.autocomplete.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        $(document).ready(function () {
            var SearchText = $("#SearchText").val();
            $("#SearchText").autocomplete("/MemberFriends/getAjaxResult/");
            var FullName = $("FullName").val();
        });

  </script>
 <%using (Html.BeginForm("SearchFriendsInList", "MemberFriends", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
    <div class="title_top_user"> Danh sách bạn bè</div>
    <table style="width: 100%;"  cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 70%;" valign="top">
                <table style="width: 100%;"  cellpadding="0" cellspacing="0">  
                    <tr>
                        <td class="td_edit_user_title">
                            <a href="#">Tất cả bạn</a></td>
                        <td align="right" class="td_edit_user_title">
                            &nbsp;<a href="<%=Url.Action("NewFriends","MemberFriends")%>"><img src="../../../Images/icon_find_user.png" alt="tìm thêm bạn" /></a></td>

                
                    </tr>
                    <tr>
                        <td >Có tất cả <b><%=ViewData["TotalFriends"] %></b> bạn</td>
                        <td  align="right">
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
                                    <% Model.iCurrentUserID = Convert.ToInt32(Session["CurrentUserID"].ToString());
                                            %>
                                    <div>
                                        <a href="<%=Url.Action("Index","MemberHome",new {id=item.UserIdOfFriend})%>"><img alt="" src="../<%=item.PictureOfFriend %>" style="width:110px; height:110px;" /></a>
                                        </div>
                                    <div><b><a href="<%=Url.Action("Index", "MemberHome", new { id = item.UserIdOfFriend })%>"><%=Html.Encode(item.FullNameOfFriend)%></a></b></div>
                                    <%--<div> <%:Html.ActionLink("Xóa", "Delete", new RouteValueDictionary { { "iUserID", Convert.ToInt32(Session["CurrentUserID"].ToString()) }, { "iFriendID", item.UserIdOfFriend }, { "iPage", Model.FriendsOfCurrentUserPagingInfo.CurrentPage }, { "cauthongbao", "Bạn có muốn xóa người bạn này?" } }, new { onclick = "return ConfirmDeleteMemberSite()" })%></div>--%>
                                    <div> 
                                    <%=Html.ActionLink("Xóa", "Delete", new { iUserID= Convert.ToInt32(Session["CurrentUserID"].ToString()), iFriendID= item.UserIdOfFriend, iPage= Model.FriendsOfCurrentUserPagingInfo.CurrentPage , cauthongbao= "Bạn có muốn xóa người bạn này?"}, new { onclick = "return ConfirmDeleteMemberSite()" })%>
                                    </div>
                                    </td>
                                <%}
                                    itemp++;
                                }%>
                            </tr>
                        <%}
                        }
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
                                <div>Bạn chưa có bạn bè</div>
                                <div><a href="<%=Url.Action("NewFriends","MemberFriends")%>">Click vào đây</a> để tìm thêm bạn mới</div>
                            </td>
                        </tr>
                    <%}
                    }
                }%>     
            </table>
                <div class="pager">        
                    <%: Html.PageLinks(Model.FriendsOfCurrentUserPagingInfo, x => Url.Action("Index", new { page = x, category = Model.FriendsOfCurrentUserCategory }))%>
                </div>
            </td>
            <td style="width: 30%;padding-left:10px" valign="top">
                <table style="width: 100%;border:1px solid #BBD6FA;padding-left:10px;padding-right:10px;background:#fff0f3" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="font-weight:bold;height:20px;border-bottom:1px solid #BBD6FA;text-align:center">Thông báo mới</td>
                    </tr>
                    <tr>
                        <td>
                            <div style="height:10px;"></div>
                            Bạn nhận 
                            <%if (ViewData["TotalAmountWantMakeFriendsWithMe"] != null)
                              {
                                  int icnt = Convert.ToInt32(ViewData["TotalAmountWantMakeFriendsWithMe"].ToString());
                                  if (icnt > 0)
                                  {%>
                                    <a href="<%=Url.Action("ShowUsersWantToMakeFriends", new {iUserID = Convert.ToInt32(Session["CurrentUserID"].ToString())})%>"><b><%=ViewData["TotalAmountWantMakeFriendsWithMe"]%></b></a>
                                    <%}
                                  else
                                  {%>
                                    <b><%=ViewData["TotalAmountWantMakeFriendsWithMe"]%></b>

                            
                                    <%}
                              }%>
                               lời mời kết bạn
                              <div style="height:10px;"></div>
                        </td> 
                    </tr>
                    <tr>
                        <td>
                            <div style="height:10px;"></div>
                            Bạn gửi 
                            <%if (ViewData["TotalAmountIWantMakeFriends"] != null)
                              {
                                  int iCntTotAmt = Convert.ToInt32(ViewData["TotalAmountIWantMakeFriends"].ToString());
                                  if (iCntTotAmt > 0)
                                  {%><a href=""><b><%=ViewData["TotalAmountIWantMakeFriends"]%></b></a>
                                  <%}
                                  else
                                  {%><b><%=ViewData["TotalAmountIWantMakeFriends"]%></b>
                                  <%}
                              }%>
                             lời yêu cầu kết bạn
                            <div style="height:10px;"></div>
                        </td> 
                    </tr>
                </table>
            </td>
        </tr>
    </table>
<%} %>
</asp:Content>
