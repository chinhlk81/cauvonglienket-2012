<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.ConsultingsListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Góc tư vấn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div class="title_menu">
  Chi tiết góc tư vấn
</div>
    <table style="width:90%;color:#000;font-size:12px">
   <tr>
   <td >
   <div style="color:#AF0007;font-weight:bold" >--Câu hỏi--</div>
   <%= Html.Encode(Model.CurrentConsulting.ConsultingQuestions )%>
   <div></div>
   </td>
   </tr>
   <tr>
   <td style="text-align:justify;border-top:1px solid #ccc;padding-left:30px;padding-right:5px;">
   <div style="color:#AF0007;font-weight:bold" >--Trả lời--</div>
   <%= Model.CurrentConsulting.ConsultingAnwsers %>
   </td>
   </tr>
   </table>
   <hr  class="style_hr" style="width:90%"  />
   <br />
    <table style="width:90%">
     
    <tr>
    <td >
    <%Html.RenderPartial("UCConsultingList"); %>
    </td>
    </tr>
    
    </table>
        
        
       
       
        
    

</asp:Content>

