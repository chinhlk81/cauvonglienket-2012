<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MemberHomeListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Trang cá nhân
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div  style="width:400px;float:left" >  
 
    <table>
   <tr>

        <td>
        <div id="wall">
            <%Html.RenderPartial("MainWall"); %>
        </div>
        </td>
   </tr> 
 </table>
   </div>
<div  style="width:300px;float:right" >  
    <div id="NewEventHolder"><%Html.RenderPartial("NewEvents"); %></div>
                <br />

                <div><%Html.RenderPartial("Blogs"); %></div>

            <br />
            <div><%Html.RenderPartial("Albums"); %></div>
  </div>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
   

    
</asp:Content>
