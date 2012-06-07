<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Ad>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quảng cáo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2 class="manager_title">Chi tiết quảng cáo</h2>  
<div style="text-align:right"> <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Trờ về"/></a>
    <a href="<%=Url.Action("Edit",new {id=Model.AdID})%>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a>
</div>
<div class="display-label"></div>
<div class="display-field">
<%if (!String.IsNullOrWhiteSpace(Model.AdImageThumbPath))
{ %>
<%=Html.FlashPlayerEmbed(ResolveClientUrl("~/Content/Flash" + Model.AdImageThumbPath), "", 326, 262, new { flashvars = "file=" + Model.AdImageThumbPath + "&autostart=true", allowscriptaccess = "Always", allowfullscreen = "true" })%>
<%} %>
</div>
<table border=0 cellpadding=0 cellspacing=0>
    <tr>
        <td class="td_details">Trạng thái</td>
        <td class="td_details_colon">:</td>
        <td class="td_details_Data"><%=Utilities.AliasDictionary[Model.AAStatus] %></td>
        </tr>
    <tr>
        <td class="td_details">Vị trí</td>
        <td class="td_details_colon">:</td>
        <td class="td_details_Data"><%=Utilities.AliasDictionary[Model.Position] %></td>
        </tr>
    
    <tr>
        <td class="td_details">Trang hiển thị</td>
        <td class="td_details_colon">:</td>
        <td class="td_details_Data"><%=Utilities.AliasDictionary[Model.OnPage] %></td>
        </tr>
    <tr>
        <td class="td_details">Liên kết</td>
        <td class="td_details_colon">:</td>
        <td class="td_details_Data"><%= Model.AdLink %></td>
        </tr>
    <tr>
        <td class="td_details">Ghi chú</td>
        <td class="td_details_colon">:</td>
        <td class="td_details_Data"><%: Model.AdDesc %></td>
        </tr>
    <tr>
        <td class="td_details">Tiêu đề</td>
        <td class="td_details_colon">:</td>
        <td class="td_details_Data"><%= Model.AdTitle %></td>
        </tr>
    <tr>
        <td class="td_details">Nội dung</td>
        <td class="td_details_colon">:</td>
        <td class="td_details_Data"><div class="display-field"><%= Model.AdContent %></div></td>
        </tr>
</table>
</asp:Content>

