<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfig>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Giới thiệu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="title_menu">
    
     Giới Thiệu

    </div>
    <div class="content_menu">
        <%=Model.Contents %>
   </div><!--End #mainContent-->



	  			
		   
		


</asp:Content>
