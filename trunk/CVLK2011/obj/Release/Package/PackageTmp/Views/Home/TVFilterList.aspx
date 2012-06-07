<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.UserSearchResultViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Kết quả tìm kiếm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    CVLK2011.Controllers.Member.MemberFriendsController friendsCtrl = new CVLK2011.Controllers.Member.MemberFriendsController();
%>
  <div class="title_menu">
    
   Kết quả tìm kiếm

    </div>
    <div class="content_menu">



    <table style="width:100%;">
    <%if (Model != null)
      {
          if (Model.SearchResults == null)
          {%>
          <tr><td>Không tìm thấy kết quả phù hợp với yêu cầu của bạn. </td></tr> 
        <%}
          if (Model.SearchResults != null)
          {
              if (Model.SearchResults.Count() == 0)
              {%>
            <tr><td>Xin lỗi! Chúng tôi không tìm thấy kết quả phù hợp với yêu cầu của bạn. </td></tr> 
            <%}
              else
              {

                  int itemp = 0;
                  for (int i = 0; i < Model.SearchResults.Count; i = itemp)
                  {
                      if (i % 4 == 0)
                      {%>
                <tr>
                <%
        for (int j = 0; j < 4; j++)
        {
            if (itemp <= Model.SearchResults.Count - 1)
            {
                var item = Model.SearchResults[itemp];%>
                        <td style="width: 200px;text-align:center">
                        <div>
                            <a href="<%=Url.Action("Index",new {id=item.UserID})%>"><img alt="" src="<%=item.UserPicture %>" style="width:110px; height:110px;" /></a>
                            </div>
                            <div><b><%=Html.ActionLink(item.UserFullName, "MemberFriends", new { id = item.UserID })%></b></div>
                            <div>Sinh năm:<%=Html.Encode(item.UserBirthday.ToString("yyyy"))%></div>
                            <div>Địa chỉ:<%=Html.Encode(item.UserAddCity)%></div>
                            <%if (Session["CurrentUserID"] != null)
                              { 
                                int iCurrentUserID = 0;
                                Int32.TryParse(Session["CurrentUserID"].ToString(), out iCurrentUserID);
                                if(friendsCtrl.CheckUserExistInFriendsList(iCurrentUserID, item.UserID, CVLK2011.Models.Utilities.cstNewStatus))
                                {%>
                                   <span style="color:#3b5998"> Đã gửi yêu cầu kết bạn</span>
                                    <%}else if(friendsCtrl.CheckUserExistInFriendsList(iCurrentUserID, item.UserID, CVLK2011.Models.Utilities.ctsAgree))
                                        {%>
                                      <span style="color:#3b5998"> kết bạn</span>
                                        <%}else
                                            {%>
                                                <img src="../../../Images/addFriendGray16x16.jpg" alt="" />&nbsp;<a href="<%=Url.Action("MakeFriend","MemberFriends", new {iFriendID = item.UserID}) %>">kết bạn</a>
                                            <%}
                              } %>
                        </td>
                    <%}
            itemp++;
        }%>
            
            </tr>
            <%}
                  }
              }%>
              <tr><td colspan="4">
              <br/>
                <div class="pager" style="text-align:right">        
                <%: Html.PageLinks(Model.PagingInfo,
                        x => Url.Action("TVFilterList", new {gender=Model.FilterGender,From=Model.FilterFrom,To=Model.FilterTo,province=Model.FilterProvince ,page = x, currentPage = Model.CurrentPage }))%>
        </div>
        </td></tr>
        
          <%}
      }%>     
</table>
    
         	</div>
	   
    

</asp:Content>
