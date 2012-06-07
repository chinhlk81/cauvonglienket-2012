<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CVLK2011.Models.Photo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<br />
    <div class="wrapper">        
        <ul class="navigationTabs">
            <li><a href="#about" rel="about">Click vào hình để xem album </a>
        <%: Html.ActionLink("Chọn album", "DanhSachAlbum")%>
    </li>            
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

   
   <br />
</asp:Content>

