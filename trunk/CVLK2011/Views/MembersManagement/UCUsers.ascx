<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.UserListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<script type="text/javascript">

    $(function () {
        $('.checkall').click(function () {
            $(this).parents('fieldset:eq(0)').find(':checkbox').attr('checked', this.checked);
        });
    });

            
</script>
<%--<table class="table_list_admin" >
<tr  class="title_list_admin">--%>

<fieldset>
<table>
<tr>
    <th style="width:100px;">Ảnh đại diện</th>
    <th style="width:10%;">Tên thành viên</th>
    <th style="width:10%;">Tài khoản</th>
    <th style="width:10%;">Điện thoại</th>
    <th style="width:10%;">Giới tính</th>
    <th style="width:10%;">Tỉnh thành</th>
    <th style="width:10%;">Ngày đăng ký</th>
    <th style="width:10%;">Ngày sinh</th>
    <th style="width:5%;">Phân loại</th>
    <th style="width:5%;">Xem</th>
    <th style="width:5%;">Sửa</th>
    <%if (Session["Type"] != null){
        if (Session["Type"].ToString() == "Admin")
        { %>
            <th >Xóa</th>
        <%}
    } %>
    <th>Cấp độ</th>
    <th>Bạn bè</th>
    <%if (Session["Type"] != null){
        if (Session["Type"].ToString() == "Admin")
        { %>
    <th><input type="checkbox"  class="checkall" /></th>
        <%}
      }%>
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
                  { %><img src="../../Images/new_icon.gif" alt="" /><%} %>  
                </td>
            <td >
                <%=Html.Encode(item.UserName)%>    
                </td>
            <td >
                <%=Html.Encode(item.UserPhone)%>
                </td>
            <td align="center" >
                <%=Utilities.AliasDictionary[item.UserGender]%>
                </td>
            <td>
                <%=Html.Encode(item.UserAddCity) %>
                </td>
            <td >
                <%=Html.Encode(item.UserRegisterDate)%>
                </td>
            <td>
                <%=Html.Encode(item.UserBirthday.ToShortDateString()) %>
                </td>
            <td align="center">
                <%=Utilities.AliasDictionary[item.UserType]%>
                </td>
            <td align="center">
                <a href="<%=Url.Action("Details",new { id = item.UserID })%>"><img src="../../Images/admin_preview.png" alt="Xem" /></a>
                </td>
           <%-- <td align="center" onclick="CheckVIP(<%=item.UserID %>)">
                <%--<td align="center" onclick="document.location.href ='<%=Url.Action("CheckVIP",new { id = item.UserID, page=Model.PagingInfo.CurrentPage})%>'">
                 <%=Ajax.ActionLink("VIP", "CheckVIP", new { id = item.UserID, Model.Filter, page = Model.PagingInfo.CurrentPage }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "abc" }, new { @id = "ajLink" + item.UserID, Style = "visibility:hidden" })%>
                 <%= Html.CheckBox("uIsVIP", item.UserIsVIP)%>
                </td>--%>
            <td align="center">
                <a href="<% =Url.Action("Edit",new{id=item.UserID}) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a>
                </td>
            <%if (Session["Type"] != null){
                  if (Session["Type"].ToString() == "Admin")
                  { %>
                    <td align="center">
                        <a href="<%=Url.Action("DeleteUser",new { id = item.UserID })%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()" /></a>
                        </td>
                    <%}
              } %>
              <%if (item.UserIsVIP){ %><td><b> VIP</b></td><%}else{ %><td></td><%} %>
            <td>
                <a href="<%=Url.Action("FriendsList",new { id = item.UserID })%>"><img src="../../Images/friendsIcon.gif" alt="Bạn bè" /></a>
                </td>
            <%if (Session["Type"] != null)
              {
                  if (Session["Type"].ToString() == "Admin")
                  { %>
            <td style="width:40px;">
                <%=Html.CheckBox("cbox" + item.UserID, Model.Checked, new { id = item.UserID, @class = "checkbox_width" })%>
                </td>
                <%}
              }%>
        </tr>
    <%}
    }
}%>
</table>
</fieldset>
<div class="pager">        
    <%= Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new { userType = Model.userTypeFilter, userGender = Model.userGenderFilter, userStatus = Model.userStatusFilter, eventParrent = Model.userEventParrent, page = x, user = Model.CurrentUser }))%>
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

   