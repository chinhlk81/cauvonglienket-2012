<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetConsultantByID_Result>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Chi tiết tư vấn viên</h2>
    <div style="text-align:right">
     <%if (Session["Type"].ToString() == "Admin")
       { %>
        <a href="<% =Url.Action("Create","ConsultantsManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
        <%} %>
      <a href="<% =Url.Action("Index","ConsultantsManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>

    <div>
    <table class="table_detail_admin">
    <tr>
    <td rowspan="7" class="size-170" style="width: 165px">
    <img alt="hình đại diện" 
            src="<%:Model.ConsultantPicture %>" style="width: 169px" />
    </td>
    <td>
    <table>
    <tr>
    <td>
              Tư vấn viên:<%=Html.Encode(Model.ConsultantName)%>
              
    </td>
    </tr>
    <tr>
    <td>
            
                Điện thoại:<%:Html.Encode(Model.ConsultantPhone)%></td>
    </tr>
    <tr>
     <td>
            
               Email:<%:Html.Encode(Model.ConsultantEmail)%></td>
    </tr>
    <tr> <td>
            
                Yahoo ID:<%:Html.Encode(Model.ConsultantYahooID)%></td>
                </tr>
                <tr>
                <td>
                     Skype ID:<%:Html.Encode(Model.ConsultantSkypeID)%></td>
                </tr>
                <tr>
                <td>
                Trạng thái:<%:Html.Encode(Model.StatusText)%></td>
                </tr>
                <tr> <td>
                Mô tả:<%=Model.ConsultantDesc%></td>
                </tr>
                 <%if (Session["Type"].ToString() == "Admin")
                   { %>
                <tr>

                <td>
                    <a href="<%= Url.Action("Edit",new { id = Model.ConsultantID }) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a>
                    <a href="<%= Url.Action("Delete",new { id = Model.ConsultantID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
                </td>
                </tr>
                <%} %>
    </table>
    
    </td>
    </tr>
    
    </table>
    </div>   
   
</asp:Content>
