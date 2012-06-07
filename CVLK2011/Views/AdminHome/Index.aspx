<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.AdminHomeModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Trang chủ Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%Html.RenderPartial("BoxMenu"); %>
<%CVLK2011.Models.Utilities utilities = new CVLK2011.Models.Utilities();%>
<div><h2 class="manager_title">Sinh nhật thành viên trong tháng</h2></div>

<div>

<%if (Model != null)
{
    if (Model.UserList.Count > 0)
    {%>
<table class="table_list_admin" >
    <tr  class="title_list_admin">
        <td >
            Ảnh đại diện</td>
        <td>
            Tên thành viên</td>
        <td>
            Ngày sinh</td>
        <td>
            Tài khoản</td>
        <td >
            Email</td>
        <td  >
            Điện thoại</td>
        <td >
            Giới tính</td>
        <td >
            Trạng thái</td>
        <td >
            Ngày thanh toán</td>
    </tr>
        <%foreach (var item in Model.UserList)
        { %>
    <tr align="left" >
        <td valign="bottom">
            <a href="<%=Url.Action("Details","MembersManagement",new { id = item.UserID })%>"> <img alt="" src="<%:item.UserPicture %>" style="width: 100px; height: 80px" /></a>
            </td>
        <td >
            <%=Html.Encode(item.UserFullName)%>  
                <%if (item.UserStatus == CVLK2011.Models.Utilities.cstNewStatus)
                  { %><img src="../../Images/new_icon.gif" alt="" /><%} %>
            </td>
        <td>
            <%=Html.Encode(item.UserBirthday.ToShortDateString())%>
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
            <%=CVLK2011.Models.Utilities.AliasDictionary[item.UserGender]%>
            </td>
        <td align="center">
            <%=Html.Encode(item.StatusText)%>   
            </td>
        <td >
            <%if (item.UserDatePayment.HasValue)
              { %>
                    <%=Html.Encode(item.UserDatePayment.Value.ToString("dd/MM/yyyy"))%>     
                    <%}%>
            </td>
    </tr>
        <%}%>
</table>
    <%}else
        {%>
            <div>Không có thành viên nào sinh nhật trong tháng</div>
        <%}
}%>
<div class="pager">        
    <%=Html.PageLinks(Model.PagingInfo,
    x => Url.Action("Index", new { gender = Model.Filter, page = x, user = Model.CurrentUser }))%>
</div>
</asp:Content>
