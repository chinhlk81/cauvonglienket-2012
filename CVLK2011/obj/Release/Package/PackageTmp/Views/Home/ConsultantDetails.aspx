<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetConsultantByID_Result>" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
   Chi tiết tư vấn
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">

       <div class="title_menu" style="text-align:center">
    
    Thông tin tư vấn viên

    </div>

    <div class="content_menu" style="text-align:center">
      <%if (Model != null)
        { %>
      <table style="border:1px solid #ccc;" >
      <tr>
      <td align="left">  
    <table style="width:100%;text-align:left;padding:10px">
        <tr>
            <td rowspan="5" style="width:180px;padding:10px;">
                <img alt="" src=" <%=Model.ConsultantPicture %>" width="100" height="100"/></td>
            <td colspan="2">
               <%=Html.Encode(Model.ConsultantName) %></td>
        </tr>
        <tr>
            <td>
                Hotline:</td>
            <td style="width:100%">
               <%=Html.Encode(Model.ConsultantPhone) %></td>
        </tr>
        <tr>
            <td >
               Yahoo:</td>
                <td>
                <a href="ymsgr:sendIM?<%=Model.ConsultantYahooID %>">
 <img src="http://opi.yahoo.com/online?u=<%=Model.ConsultantYahooID %>&m=g&t=1" border="0" alt="Ho tro khach hang 24/24" align="absmiddle" /></a>
                </td>
        </tr>
        <tr>
            <td >
                Skype:</td>

                <td>
                <a href="skype:<%=Model.ConsultantSkypeID %>?call">
<img src="http://download.skype.com/share/skypebuttons/buttons/call_green_transparent_70x23.png" border="0" width="70" height="23" alt="Skype Me™!" align="absmiddle" /></a>
                
                
                </td>
        </tr>
        <tr>
        <td>Email:</td>
        
        <td> <a href="mailto:<%=Model.ConsultantEmail %>"> <%=Html.Encode( Model.ConsultantEmail) %></a></td>
        </tr>
        
    </table>
    </td>
      <td style="text-align:left;border-left:1px solid #ccc;padding-left:10px;vertical-align:top;padding-top:10px">
      <%=Model.ConsultantDesc %>
      </td>
      </tr>
      </table>
    <%} %>
                  	</div>
	   
        <div class="footer_menu">
    
     <img alt="" src="../../Images/content_bottom.png" border="0"  />
    </div>


</asp:Content>
