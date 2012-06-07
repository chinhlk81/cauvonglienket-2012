<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật thông tin
    
 </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <div class="tabs">
    <%= ViewData["thongbao"]%>
    <ul class="tabmenu  hidden">
        <li><a href="#tab-1">Thông tin cơ bản</a></li>
        <li><a href="#tab-2">Thông tin riêng tư</a></li>
        <li><a href="#tab-3">Thông tin liên lạc</a></li>
        <li><a href="#tab-4">Học vấn - nghề nghiệp</a></li>
        <li><a href="#tab-5">Sở thích</a></li>
    </ul>
     <% Html.RenderPartial("tab1"); %>
     <% Html.RenderPartial("tab2"); %>
     <% Html.RenderPartial("tab3"); %>
     <% Html.RenderPartial("tab4"); %>
     <% Html.RenderPartial("tab5"); %>
     </div>
</div>
</asp:Content>
