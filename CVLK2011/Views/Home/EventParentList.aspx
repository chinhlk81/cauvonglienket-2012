<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.EventParentsListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách dịch vụ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="title_menu">
    
    Dịch vụ

    </div>

    <table style="text-align:left;margin-left:30px;line-height:25px;font-weight:bold">
       
<%if(Model!=null){
      if(Model.EventParentsList!=null){
       
         foreach (var item in Model.EventParentsList) { %>
    
        <tr>
            <td>
            - <a href="<%=Url.Action("EventParentDetails",new{id=item.EventParentID}) %>">  <%: item.EventParentName %></a>
            </td>
        </tr>
    
    <% }
      }
      }%>

    </table>

    <br />
     <br />

</asp:Content>

