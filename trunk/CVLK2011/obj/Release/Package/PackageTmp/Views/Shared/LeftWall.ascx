<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MemberHomeListViewModel>" %>

   <div>
        
             <img alt="" src="/<%=(Model.PictureOnWall) %>" width="180px" height="220px" border="0px" /> 

  <ul>
  <%if ((Session["CurrentUserID"]) != null)
    {
        if(Convert.ToInt32(Session["CurrentUserID"]) ==Model.UserIDOnWall)
        { %>
            <li> <a href="<%=Url.Action("Avatar","MemberProfile",new {id=Model.UserIDOnWall}) %>"> <img src="../../../Images/zme_editcanhan.png" align="top" border="0" alt=""/> &nbsp; Cập nhật Avatar</a></li>
        <%} %>
    <li> <a href="<%=Url.Action("Index","MemberHome",new {id=Model.UserIDOnWall}) %>"> <img src="../../../Images/ico_edit_16.png" align="top" border="0"alt=""/> &nbsp; Tường</a></li>
    <li><a href="<%=Url.Action("Index","MemberProfile",new {id=Model.UserIDOnWall}) %>"><img src="../../../Images/icon_info.gif" align="top"alt=""/>  &nbsp; Thông tin</a></li>
    <%if (Model.UserIDOnWall != Convert.ToInt32(Session["CurrentUserID"]))
      { %>
        <li><a href="<%=Url.Action("Create","MemberMessage",new {id=Model.UserIDOnWall}) %>"><img src="../../../Images/icon_info.gif" align="top"alt=""/>  &nbsp; Gởi tin nhắn</a></li>
    <%} %>
    <li><a href="<%=Url.Action("Index","MemberPhoto",new {id=Model.UserIDOnWall}) %>"> <img src="../../../Images/icon_photo.gif" align="top"alt=""/>  &nbsp;Xem Photo</a></li>
    <li><a href="<%=Url.Action("Index","MemberFriends",new {id=Model.UserIDOnWall})%>"> <img src="../../../Images/friend_icon.png" align="top"alt=""/> &nbsp; Bạn bè</a></li>
 <%} %>
  </ul>
</div>


