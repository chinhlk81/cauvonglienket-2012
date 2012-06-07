<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.ConfigValueViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cấu hình
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Cấu hình</h2>
   
    <div style="text-align:right">
        <a href="<% =Url.Action("Index","ConfigValue") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <div style="text-align:center">
    <b><%=ViewData["CreateMessage"] %></b>
    </div>
     <table>
      <%using (Html.BeginForm("CreateCareer", "ConfigValue", FormMethod.Post))
        { %>
    
    <tr class="title_list_admin"><td colspan="2" align="left">Ngành nghề</td></tr>
    <tr>
    <td>Tên ngành nghề</td>
    <td>
    <%=Html.TextBoxFor(model => model.CareerName)%>
    <%=Html.ValidationMessageFor(model=>model.CareerName) %>
    </td>
    </tr>
    <tr><td>Mô tả</td>
    <td>
    <%=Html.TextAreaFor(p => p.CareerDesc, new { Style = "width:434px" })%>
    </td></tr>
    <tr>
    <td></td>
    <td><input  type="submit" value="Lưu"/></td>
    </tr>
    <%}
       %>
    </table>
    <br />
    <br />
     <table>
    
    <%using (Html.BeginForm("CreateProvince", "ConfigValue", FormMethod.Post))
      {  %>
    <tr class="title_list_admin"><td align="left" colspan="2">Tỉnh thành</td></tr>
    <tr>
    <td>Tên tỉnh thành</td>
    <td>
    
    
    <%=Html.TextBoxFor(model => model.ProvinceName)%>
    <%=Html.ValidationMessageFor(model=>model.ProvinceName) %>
    </td>
    </tr>
    <tr><td>Mô tả</td>
    <td>
    <%=Html.TextAreaFor(model => model.ProvinceDesc, new { Style = "width:434px" })%>
    </td></tr>
    <tr>
    <td></td>
    <td>
    <input  type="submit" value="Lưu"/>
    </td>
    </tr>
    <%} %>
    </table>
</asp:Content>
