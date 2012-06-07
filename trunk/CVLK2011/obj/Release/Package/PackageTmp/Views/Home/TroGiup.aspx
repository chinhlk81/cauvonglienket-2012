<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfig>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Trợ giúp
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <div class="title_menu">
    
    Trợ giúp

    </div>
    <div class="content_menu">

        <%=Model.Contents %>
    	</div>
	   
        <div class="footer_menu">
    
     <img alt="" src="../../Images/content_bottom.png" border="0"  />
    </div>

</asp:Content>
