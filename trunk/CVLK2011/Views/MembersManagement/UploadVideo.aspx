<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	UploadVideo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <% using (Html.BeginForm("ProcessUploadVideo", "MembersManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
        {%>
        <input type='file' name='videoUpload' id='video'/>
        <input id="btAdd" type="submit"  value="Up Video" />
        <%} %>
</asp:Content>
