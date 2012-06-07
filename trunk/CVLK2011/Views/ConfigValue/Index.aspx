<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.ConfigValueViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	   Cấu hình
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Cấu hình</h2>
     <div style="text-align:right">
        <a href="<% =Url.Action("CreateCareer","ConfigValue") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      
    </div>
    <%if (Model != null)
      { %>
     <div>
        <table class="table_list_admin">
            <tr class="title_list_admin">
            <td align="left" colspan="2">Ngành ngề</td>
           
            </tr>
            <%if (Model.careerList != null)
              {
                  foreach (var item in Model.careerList)
                  { %>
            <tr>
            <td>
           <%=Html.Encode(item.CareerName)%>
            </td>
           <td style="width:40px">
              <a href="<% =Url.Action("DeleteCareer",new{id=item.CareerID}) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
            </td>
            </tr>
            <%} %>
            </table>
            </div>
            <div>
            
             <table class="table_list_admin">
            <tr class="title_list_admin">
            <td align="left" colspan="2">Tỉnh thành</td>
            
            </tr>
            <%if (Model.provinceList != null)
              {
                  foreach (var item in Model.provinceList)
                  { %>
            <tr>
            <td>
           <%=Html.Encode(item.ProvinceName)%>
            </td>
            <td style="width:40px">
              <a href="<% =Url.Action("DeleteProvince",new{id=item.ProvinceID}) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
            </td>
            </tr>
            <%} %>
            </table>
            
            </div>
            <%}%>
             <div class="pager">        
        <%: Html.PageLinks(Model.PagingInfo, x => Url.Action("Index", new { page = x, currentPage = Model.CurrentProvince }))%>
        </div>
              <%}
      }%>
</asp:Content>
