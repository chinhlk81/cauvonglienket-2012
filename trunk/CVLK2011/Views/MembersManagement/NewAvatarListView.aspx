<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.UserListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách avatar chờ duyệt
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">

    $(function () {
        $('.checkall').click(function () {
            $(this).parents('fieldset:eq(0)').find(':checkbox').attr('AvatarApproved', this.checked);
        });
    });

            
</script>
<%using (Html.BeginForm("ActionApproveMultiAvatarUser", "MembersManagement", new {box = Model.box}, FormMethod.Post))
    {%>
<div>
<%
    if (Session["Type"] != null)
    {
        if (Session["Type"].ToString() == "Admin")
        {%>
        <input type="submit" name="ApprovedAvatar" value="Duyệt" class="btn_user_update" onclick="return ConfirmDeleteMemberSite()"/> 
        <input type="submit" name="UnApprovedAvatar" value="không Duyệt" class="btn_user_update" onclick="return ConfirmDeleteMemberSite()"/> 
    <%
        }
    }
%>
</div>
<fieldset>
<table>
<tr>
    <th style="width:100px;">Ảnh hiện tại</th>
    <th style="width:100px;">Ảnh chờ duyệt<img src="../../Images/new_icon.gif" alt="" /></th>
    <th style="width:10%;">Tên thành viên</th>
    <th style="width:10%;">Tài khoản</th>
    <th style="width:10%;">Giới tính</th>
    <th style="width:10%;">Ngày sinh</th>
    <th style="width:5%;">Phân loại</th>
    <th style="width:5%;">Xem</th>
    <th style="width:5%;">Sửa</th>
    <%
            if (Session["Type"] != null)
            {
                if (Session["Type"].ToString() == "Admin")
                {%>
            <th >Xóa</th>
        <%
                }
            }%>
    <th>Cấp độ</th>
    <%
            if (Session["Type"] != null)
            {
                if (Session["Type"].ToString() == "Admin")
                {%>
            <th>Duyệt <input type="checkbox"  class="checkall" /></th>
        <%
                }
            }%>
</tr>
<%
            if (Model != null)
            {
                if (Model.UserList != null)
                {
                    foreach (var item in Model.UserList)
                    {%>
        <tr align="left" >
            <td valign="bottom">
                <a href="<%=Url.Action("Details", new {id = item.UserID})%>"> <img alt="" src="<%:item.UserPicture%>" style="width: 100px; height: 80px" /></a>
                </td>
            <td valign="bottom">
                <a href="<%=Url.Action("Details", new {id = item.UserID})%>"> <img alt="" src="<%:item.UserAvatarUpload%>" style="width: 100px; height: 80px" /></a>
                </td>
            <td >
                <%=Html.Encode(item.UserFullName)%>  
                <%
                        if (item.UserStatus == CVLK2011.Models.Utilities.cstNewStatus)
                        {%><img src="../../Images/new_icon.gif" alt="" /><%
                        }%>  
                </td>
            <td >
                <%=Html.Encode(item.UserName)%>    
                </td>
            <td align="center" >
                <%=Utilities.AliasDictionary[item.UserGender]%>
                </td>
            <td>
                <%=Html.Encode(item.UserBirthday.ToShortDateString())%>
                </td>
            <td align="center">
                <%=Utilities.AliasDictionary[item.UserType]%>
                </td>
            <td align="center">
                <a href="<%=Url.Action("Details", new {id = item.UserID})%>"><img src="../../Images/admin_preview.png" alt="Xem" /></a>
                </td>
            <td align="center">
                <a href="<% =Url.Action("Edit", new {id = item.UserID})%>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a>
                </td>
            <%
                        if (Session["Type"] != null)
                        {
                            if (Session["Type"].ToString() == "Admin")
                            {%>
                    <td align="center">
                        <a href="<%=Url.Action("DeleteUser", new {id = item.UserID})%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()" /></a>
                        </td>
                    <%
                            }
                        }%>
              <td><%
                        if (item.UserIsVIP)
                        {%><b> VIP</b><%
                        }%></td>
            <td>
                <%=Html.CheckBox("cbox" + item.UserID, Model.AvatarApproved,
                                                        new {id = item.UserID, @class = "checkbox_width"})%></td>
        </tr>
    <%
                }
            }
    }%>
</table>
</fieldset>
<%
}%>
<div class="pager">        
    <%= Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new { userType = Model.userTypeFilter, userGender = Model.userGenderFilter, userStatus = Model.userStatusFilter, eventParrent = Model.userEventParrent, page = x, user = Model.CurrentUser }))%>
</div>
<script src="../../Scripts/jquery.js" type="text/javascript"></script>  
<script type="text/javascript" language="javascript">
    function CheckVIP(usid) {
        try {
            //this for IE 
            var actionlink = document.getElementById("ajLink" + usid);
            actionlink.click();
        } catch (error) {
            $("#ajLink" + usid).click();
        }
    }
</script>
</asp:Content>
