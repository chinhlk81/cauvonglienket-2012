<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.UserListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý thành viên 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script src="../../../Scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="../../../Scripts/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
<script src="../../../Scripts/jquery.cascadingDropDown.js" type="text/javascript"></script>

<script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
<script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>

<script type="text/javascript">
//    function 
//    ChangeValue(thisvalue) {
//        $("#svalue").val(thisvalue);
//        //        $("#slink").click();
//        $("#filter").click();

//    }
    function UserFilter() {
        var userType = $('#userType').val();
        var userGender = $('#userGender').val();
        var userStatus = $('#userStatus').val();
        var event = $('#events').val();
        $.post('/MembersManagement/FilterMembers',
            { userType: userType, userGender: userGender, userStatus: userStatus, eventParrent: event },
            //$(this).serialize(),
            function (data) {
                $('#userList').html(data).fadeIn(0);
            });
    }
</script>
<%Html.RenderPartial("BoxMenu"); %>
<h2 class="manager_title">Quản lý thành viên</h2>
<div style="text-align:right"> <a href="<% =Url.Action("Register","MembersManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a></div>
<%using (Html.BeginForm("SearchMembersFromlist", "MembersManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
<div style="text-align:right">
    Tìm kiếm:<%=Html.TextBox("userFullName")%>
    <input id="btnSearch" type="submit" value="Tìm" 
        style="width: 49px; height: 20px" />
    <%=Html.ActionLink("Tìm kiếm nâng cao","AdvanceSearchUsersForAdminGUI", "MembersManagement") %>
    </div>
    <br />
<%} %>

<div style="text-align:right">
<%--<%using (Ajax.BeginForm("FilterGender", new { gender = "" }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "abc" }))
{ %>
<input type="hidden" id="svalue" name="svalue" />
<input type="submit" value=""  style="visibility:hidden" id="filter"/>
<%} %>--%>
<%=Html.DropDownList("events",ViewData["Events"] as SelectList,"--Sự kiện tham gia--", new { onchange = "UserFilter()" })%>
<%=Html.DropDownList("userStatus", ViewData["UserStatus"] as SelectList, "--Trạng thái--", new { onchange = "UserFilter()" })%>
<%=Html.DropDownList("userType", new[] {
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNone], Value=Utilities.cstUserTypeNone},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeCouples], Value=Utilities.cstUserTypeCouples},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypePerfectCouple], Value=Utilities.cstUserTypePerfectCouple},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeWaitngAppointment], Value=Utilities.cstUserTypeWaitngAppointment},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeWaitingReply], Value=Utilities.cstUserTypeWaitingReply},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeOther], Value=Utilities.cstUserTypeOther},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNoContacted], Value=Utilities.cstUserTypeNoContacted},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeMet], Value=Utilities.cstUserTypeMet},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypePotential], Value=Utilities.cstUserTypePotential},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNoSerious], Value=Utilities.cstUserTypeNoSerious},
    }, "--Loại thành viên--", new { onchange = "UserFilter()" })%>
<%=Html.DropDownList("userGender", new[] {
    new SelectListItem{Text="Nam",Value="Male"},
    new SelectListItem{Text="Nữ",Value="Female"}
    }, "--Giới tính--", new { onchange = "UserFilter()" })%>
</div>

<div id="userList">
    <%Html.RenderPartial("UCUsers"); %>
</div>
</asp:Content>
