<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.AdListViewModel>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý quảng cáo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Quản lý quảng cáo</h2>
    <div style="text-align:right">
        <a href="<%=Url.Action("Create","AdsManagement")%>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>

</div>
<div style="text-align:right">
    <%=Html.DropDownList("onpage", new[] {
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstOnHomePage], Value=Utilities.cstOnHomePage},
    new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstOnDetailPage], Value=Utilities.cstOnDetailPage}
     }, "--Trang hiện thị--", new { onchange = "AdsFilter()", @id = "onpage" })%>
     </div>
    <div id="AdList">
    <%Html.RenderPartial("UCAdList"); %>
    </div>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script type="text/javascript">
        function AdsFilter() {

            var onPage = $('#onpage').val();
            $.post('/AdsManagement/FilterOnPage',
            { onPage: onPage},
            function (data) {
                $('#AdList').html(data).fadeIn(0);
            });
        }
</script>
</asp:Content>
