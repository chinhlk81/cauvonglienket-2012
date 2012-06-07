<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.OlineSupportListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách
  </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Hỗ trợ trực tuyến</h2>
     <%if(Session["Type"].ToString() == "Admin")
       { %>
     <div style="text-align:right">
        <a href="<% =Url.Action("OSCreate","ConsultantsManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      
    </div>
    <%} %>
    <table class="table_list_admin">
        <tr class="table_list_admin">
            
            <th>
                Điện thoại 1
            </th>
            
            <th>
                Di động 1
            </th>
            
            <th>
                Email gởi
            </th>
            <th>
                Email nhận 1
            </th>
            <th>
                Yahoo 1
            </th>
            
            <th>
                Skype 1
            </th>
             <th>
                Sử dụng
            </th>
            <th>
            Xem
            </th>
             <%if (Session["Type"].ToString() == "Admin")
               { %>
            <th>Sửa</th>
            <th>Xóa</th>
            <%} %>
        </tr>
       <%if (Model != null)
         {
             if (Model.Products != null)
             { %>
    <% foreach (var item in Model.Products)
       { %>
    
        <tr>
           
            <td>
                <%=Html.Encode(item.OSPhone1)%>
            </td>
            
            <td>
                <%=Html.Encode(item.OSCellPhone1)%>
            </td>
            
            <td>
                <%=Html.Encode(item.OSEmailFrom)%>
            </td>
            <td>
                <%=Html.Encode(item.OSEmailTo1)%>
            </td>
            
            <td>
                <%=Html.Encode( item.OSYahoo1)%>
            </td>
            
            <td>
                <%=Html.Encode(item.OSSkype1)%>
            </td>
            <%if (Session["Type"].ToString() == "Admin")
              { %>
            <td align="center" onclick="document.location.href ='<%=Url.Action("OSCheck",new { id = item.OSID })%>'">
           
                <%=Html.CheckBox("OSActive", item.IsActive)%>
            </td>
             <%}
              else
              { %>
             <td>
             <%=Html.CheckBox("OSActive", item.IsActive)%>
             </td>
             <%} %>
            <td align="center">
            <a href="<%=Url.Action("OSDetails", "ConsultantsManagement", new { id=item.OSID })%>"><img src="../../../Images/admin_preview.png" alt="Xem"/> </a> 
            </td>
             <%if (Session["Type"].ToString() == "Admin")
               { %>
             <td align="center">
               <a href="<%=Url.Action("OSUpdate", "ConsultantsManagement", new { id=item.OSID })%>"><img src="../../../Images/admin_edit.png" alt="Sửa"/> </a> 
               </td>
               <td align="center">
                 <a href="<%=Url.Action("OSDelete", "ConsultantsManagement", new { id=item.OSID })%>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/> </a> 
                </td>
                <%} %>
        </tr>
    
    <% }
             }
         }%>
     
    </table>
    <div class="pager">        
        <%= Html.PageLinks(Model.PagingInfo,
            x => Url.Action("OSIndex", new {page=x, category=Model.CurrentCategory})) %>
        </div>
    
</asp:Content>

