<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CVLK2011.Models.Admin>>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   
  
   <h2 class="manager_title">Quản lý Admin</h2>


                   <div style="text-align:right"><a href="<%=Url.Action("Create","AdminManagement") %>"><img src="../../Images/admin_add.png" alt="Tạo mới" /></a></div>
    <div>
    <div>
     <a href="<% =Url.Action("ActiveConsultants") %>"><img src="../../../Images/active.png" alt="Active" onclick="return ConfirmActive()"/></a>
                     
                     <a href="<% =Url.Action("DeactivateConsultants") %>"><img src="../../../Images/deactive.png" alt="Deactivate" onclick="return ConfirmDeActive()"/></a>
    </div>
    <table class="table_list_admin">
        <tr class="title_list_admin">
            <td>
                Tên đăng nhập</td>
            <td>
            Loại
            </td>
            <td>
                Mô tả</td>
                <td style="width:80px">Đăng nhập</td>
            <td style="width:5%">
                Xem</td>
            <td style="width:5%">
                Sửa</td>
            <td style="width:5%">
                Xóa</td>
        </tr>
        <%if (Model != null)
          { %>
        <% foreach (var item in Model)
           { %>
        <tr align="left">
            <td>
            <a href="<% =Url.Action("Details", new { id = item.AdminID }) %>">    <%=Html.Encode(item.UserName)%>   </a>  
           </td>
            <td>
            <%=Html.Encode(Utilities.AliasDictionary[item.Type])%>
            </td>
            <td>
                <%=Html.Encode(item.Description)%>    
            </td>
            <td align="center"><%if (item.Type != "Admin")
              { %>
            <%=Html.CheckBox("AllowLogon", item.AllowLogOn, new { onclick = "AllowLogOn('" + item.AdminID + "')" })%>
            <%} %>
            </td>
                 <td align="center" >
                <a href="<% =Url.Action("Details", new { id = item.AdminID }) %>"><img src="../../../Images/admin_preview.png" alt="Xem "/></a>
             </td>
                 <td align="center">
               
              <a href="<% =Url.Action("Edit", new { id = item.AdminID }) %>"><img src="../../../Images/admin_edit.png" alt="Sửa "/></a></td>
            <td align="center">
               
              <a href="<% =Url.Action("Delete", new { id = item.AdminID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa " onclick="return ConfirmDelete()"/></a></td>
        </tr>
       <%}
          } %>
        </table>
        
     </div>

     <script type="text/javascript">
         function ConfirmActive() {
             if (confirm("Bạn chắc chắn hiển thị toàn bộ danh sách?") == true) {
                 return true;
             }
             else {
                 return false;
             }

         }
         function ConfirmDeActive() {
             if (confirm("Bạn chắc chắn ẩn toàn bộ danh sách?") == true) {
                 return true;
             }
             else {
                 return false;
             }

         }
         function ConfirmDelete() {
             if (confirm("Bạn chắc chắn xóa?") == true) {
                 return true;
             }
             else {
                 return false;
             }

         }

         function AllowLogOn(id) {
             $.post("/AdminManagement/AllowLogOn", { id: id });
         }    
    </script>
		

</asp:Content>
