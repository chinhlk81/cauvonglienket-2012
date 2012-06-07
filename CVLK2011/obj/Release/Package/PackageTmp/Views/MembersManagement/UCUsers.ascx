<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.UserListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>

<table class="table_list_admin" >
<tr  class="title_list_admin">
    <td >
        Ảnh đại diện
        </td>
    <td>
        Tên thành viên
        </td>
    <td>
        Tài khoản
        </td>
    <td >
        Email
        </td>
    <td  >
        Điện thoại
        </td>
    <td >
        Giới tính
        </td>
    <td> 
        Ngày sinh
    </td>
    <td >
        Tham gia
        </td>
    <td >
        Trạng thái
        </td>
    <td>
        Loại
        </td>
        
        <td >
        Cấp độ
        </td>
         <td >
        Xem
        </td>
        
    
    <td>
        Bạn bè
        </td>
   <td>Sửa</td>
    <%if (Session["Type"] != null)
      {
          if (Session["Type"].ToString() == "Admin")
          { %>
    <td >
        Xóa
        </td>
       <%}
      } %>
</tr>
<% if (Model != null)
{
    if (Model.UserList != null)
    {
        foreach (var item in Model.UserList)
        { %>
        <tr align="left" >
            <td valign="bottom">
                <a href="<%=Url.Action("Details",new { id = item.UserID })%>"> <img alt="" src="<%:item.UserPicture %>" style="width: 100px; height: 80px" /></a>
                </td>
            <td >
                <%=Html.Encode(item.UserFullName)%>  
                <%if (item.UserStatus == CVLK2011.Models.Utilities.cstNewStatus)
                  { %><img src="../../Images/new.gif" alt="" /><%} %>  
                </td>
            <td >
                <%=Html.Encode(item.UserName)%>    
                </td>
            <td >
                <%=Html.Encode(item.UserEmail)%>
                </td>
            <td >
                <%=Html.Encode(item.UserPhone)%>
                </td>
            <td align="center" >
                <%=Utilities.AliasDictionary[item.UserGender]%>
                </td>
            <td>
            <%=Html.Encode(item.UserBirthday.ToShortDateString()) %>
            </td>
            <td >
                <%=Html.Encode(item.EventParentName)%>
                </td>
            <td align="center">
                <%=Html.Encode(item.StatusText)%> 
                </td>
            <td align="center">
                <%=Utilities.AliasDictionary[item.UserType]%>
                </td>
            
            <%if (item.UserIsVIP)
              { %>
            <td><b> VIP</b></td>
            <%}
              else
              { %>
            <td>
            
            </td>
            <%} %>
            <td align="center">
                <a href="<%=Url.Action("Details",new { id = item.UserID })%>"><img src="../../Images/admin_preview.png" alt="Xem" /></a>
            </td>
           <%-- <td align="center" onclick="CheckVIP(<%=item.UserID %>)">
                <%--<td align="center" onclick="document.location.href ='<%=Url.Action("CheckVIP",new { id = item.UserID, page=Model.PagingInfo.CurrentPage})%>'">
                 <%=Ajax.ActionLink("VIP", "CheckVIP", new { id = item.UserID, Model.Filter, page = Model.PagingInfo.CurrentPage }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "abc" }, new { @id = "ajLink" + item.UserID, Style = "visibility:hidden" })%>
                 <%= Html.CheckBox("uIsVIP", item.UserIsVIP)%>
                </td>--%>
               
            <td>
                <a href="<%=Url.Action("FriendsList",new { id = item.UserID })%>"><img src="../../Images/friendsIcon.gif" alt="Bạn bè" /></a>
                </td>
            
            <td align="center">
                <a href="<% =Url.Action("Edit",new{id=item.UserID}) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a></td>
            <%if (Session["Type"] != null)
              {
                  if (Session["Type"].ToString() == "Admin")
                  { %>
            <td align="center">
                <a href="<%=Url.Action("DeleteUser",new { id = item.UserID })%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()" /></a>
                </td>
               <%}
              } %>
        </tr>
    <%}
    }
}%>
</table>
<div class="pager">        
    <%: Html.PageLinks(Model.PagingInfo,
    x => Url.Action("Index", new { gender = Model.Filter, page = x, user = Model.CurrentUser }))%>
</div>
<script src="../../Scripts/jquery.js" type="text/javascript"></script>  
<script type="text/javascript" language="javascript">
    function CheckVIP(usid) {
        try{    
            //this for IE 
            var actionlink = document.getElementById("ajLink" + usid);
            actionlink.click();
            }catch (error) {
                $("#ajLink" + usid).click();
            }
    }
</script>

   