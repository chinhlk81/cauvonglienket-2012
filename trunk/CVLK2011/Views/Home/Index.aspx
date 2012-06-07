<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cầu vồng liên kết
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% =Html.Action("UCSuKienNoiBat")%>
    <%=Html.Action("UserImagesCarousel")%>
    <%=Html.Action("UCGocTuVan") %>
    <%--<div id="abc">
    <%=Html.Action("UCGocCamNhan") %>
    </div>--%>
</asp:Content>
