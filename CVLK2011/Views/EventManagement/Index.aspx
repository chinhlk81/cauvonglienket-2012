<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.EventsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách sự kiện
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <h2 class="manager_title">Quản lý sự kiện</h2>




                 <div style="text-align:right"> 
                 <a href="<%=Url.Action("Create","EventManagement")%>"><img src="../../Images/admin_add.png" alt="Tạo mới" /></a>
                 </div>
    <div>
        <table class="table_list_admin">
        
            <tr class="title_list_admin">
                <td>
                    
                    Sự kiện</td>
                <td>
                    
                    Thời gian</td>
                <td>
                    
                    Địa điểm</td>
                <td>
                    
                    Độ tuổi tham dự</td>
                
                <td style="width: 20px">
                    
                   Nổi bậc</td>
                <td>
                    Xem</td>
                
                <td>
                    Sửa</td>
                
                <td>
                    Xóa</td>
                
            </tr>
            <% foreach (var item in Model.Products){ %>
            <tr >
                <td>
                    &nbsp;
                   <a href="<%=Url.Action("Details", new { id = item.EventID })%>"> <%= Html.Encode(item.EventName) %></a>
                   
                   </td>
                <td>
                    <%= Html.Encode(item.EventTime) %> Ngày 
                    <%= Html.Encode(item.EventDate.ToString("dd/MM/yyyy"))%>
                    
                    </td>
                <td>
                    <%= Html.Encode(item.EventLocation) %></td>
                <td>
                    <%= Html.Encode(item.EventAgeJoint) %></td>
                
               <%-- <td style="width: 10px" align="center" onclick="document.location.href ='<%=Url.Action("CheckTypical",new { id = item.EventID })%>'" >--%>
                <td style="width: 10px" align="center">
                      <%= Html.CheckBox("eveTypical", item.IsTypical, new { onclick ="CheckTypical('"+item.EventID+"')"})%>
                   </td>
                
                <td align="center">
                   <a href="<%=Url.Action("Details", new { id = item.EventID })%>"><img src="../../Images/admin_preview.png" alt="Xem" /></a>
                   </td>
                <td align="center">
                    <a href="<%=Url.Action("Edit", new { id = item.EventID })%>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a></td>
                <td align="center">
                   <a href="<%=Url.Action("Delete", new { id = item.EventID })%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete() "/></a></td>
            </tr>
          <%} %>
        </table>
        <div class="pager">        
        <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new {page=x, category=Model.CurrentCategory})) %>
        </div>
        
     </div>

	 


   <script type="text/javascript">

       function CheckTypical(id) {
           $.post("/EventManagement/CheckTypical", { id: id });
       }

</script>
   
</asp:Content>
