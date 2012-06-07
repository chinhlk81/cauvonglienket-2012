<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.OlineSupport>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết hỗ trợ trưc tuyến
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Hỗ trợ trực tuyến</h2>

     <div style="text-align:right">
      <%if (Session["Type"].ToString() == "Admin")
        { %>
        <a href="<% =Url.Action("OSCreate","ConsultantsManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
        <%} %>
      <a href="<% =Url.Action("OSIndex","ConsultantsManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <table style="width: 100%" class="table_detail_admin">
        <tr>
            <td>
               Phone 1 </td><td><%= Model.OSPhone1 %></td>
        </tr>
        <tr>
            <td>
               Phone2 </td><td><%= Model.OSPhone2 %></td>
        </tr>
        <tr>
            <td>
               CellPhone1 </td><td> <%= Model.OSCellPhone1 %></td>
        </tr>
        <tr>
            <td>
               CellPhone2 </td><td> <%= Model.OSCellPhone2 %></td>
        </tr>
        <tr>
            <td>
                Yahoo1 </td><td><%= Model.OSYahoo1 %></td>
        </tr>
        <tr>
            <td>
               Yahoo2 </td><td><%= Model.OSYahoo2 %></td>
        </tr>
        <tr>
            <td>
               Skype1 </td><td><%= Model.OSSkype1 %></td>
        </tr>
        <tr>
            <td>
               Skype2 </td><td> <%= Model.OSSkype2 %></td>
        </tr>
        <tr>
            <td>
                IsActive </td><td><%= Model.IsActive %></td>
        </tr>
        <tr>
            <td>
               Description </td><td><%= Model.Description %></td>
        </tr>
          <tr>
            <td>
               EmailTo1 </td><td><%= Model.OSEmailTo1 %></td>
        </tr>
          <tr>
            <td>
                EmailTo2 </td><td><%= Model.OSEmailTo2 %></td>
        </tr>
         
         
         <tr>
            <td>
               Address </td><td><%= Model.Address %></td>
        </tr>
         <tr>
            <td>
                Address1 </td><td><%= Model.Address1 %></td>
        </tr>
         <tr>
            <td>
                Fax </td><td><%= Model.Fax %></td>
        </tr>
         
         <tr>
            <td>
               Fax1 </td><td><%= Model.Fax1 %></td>
        </tr>
        <tr>
            <td>
               Port </td><td><%= Model.OSPort %></td>
        </tr>
         <tr>
            <td>
               Host </td><td><%= Model.OSHost %></td>
        </tr>
        

    </table>

   
</asp:Content>

