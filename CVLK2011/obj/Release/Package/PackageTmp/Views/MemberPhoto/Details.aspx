<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CVLK2011.Models.Photo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="wrapper2">        
    <ul class="navigationTabs">
            <li><a href="#about" rel="about">Click vào hình để xem album </a></li>  
            <li> <%: Html.ActionLink("Chọn Album", "Index", new { id = Session["GuestUserID"] })%></li>          
        </ul>
        <div class="tabsContent">
            <div class="#about">                		
				<div id="myGallery" class="spacegallery">
                <% foreach (var item in Model)
                   { %>
					<img src="<%: item.PhotoPath %>" alt="" />					
                <%} %>
				</div>
            </div>           
        </div>		
    </div>

    

    <script src="../../../Scripts/jquery.js" type="text/javascript"></script>
    <script src="../../../Scripts/eye.js" type="text/javascript"></script>
	<script src="../../../Scripts/utils.js" type="text/javascript"></script>
    <script src="../../../Scripts/spacegallery.js" type="text/javascript"></script>
    <script src="../../../Scripts/layout.js" type="text/javascript"></script>

</asp:Content>
