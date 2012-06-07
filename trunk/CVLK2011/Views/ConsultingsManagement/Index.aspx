<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.ConsultingsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Góc tư vấn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <h2 class="manager_title">Quản lý gốc tư vấn</h2>
   <%if (Session["Type"].ToString() == "Admin")
     { %>
    <div style="text-align:right">
     <a href="<% =Url.Action("Create","ConsultingsManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
    </div>
    <%} %>
    <div>
    <table class="table_list_admin">
    <tr  class="title_list_admin">
    <td>Câu hỏi</td>
    <td>Trạng thái</td>
    <td>Mô tả</td>
    <td>Xem</td>
     <%if (Session["Type"].ToString() == "Admin")
       { %>
    <td>Sửa</td>
    <td>Xóa</td>
    <%} %>
    </tr>
     <% foreach (var item in Model.Products){ %>
            <tr>
                <td>
                 <a href="<% =Url.Action("Details",new{id=item.ConsultingID}) %>">   <%= Html.Encode(item.ConsultingQuestions) %></a>
                 
                 </td>
                
                <td>
                    <%= Html.Encode(item.ConfigText) %></td>
                <td>
                    <%= Html.Encode(item.ConsultingDesction) %>
                </td>                
                <td>
                        <a href="<% =Url.Action("Details",new{id=item.ConsultingID}) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a></td>                
                <%if (Session["Type"].ToString() == "Admin")
                  { %>
                <td>
                   <a href="<% =Url.Action("Edit",new{id=item.ConsultingID}) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a></td>                
                <td>
                  <a href="<% =Url.Action("Delete",new{id=item.ConsultingID}) %>"><img src="../../../Images/admin_xoa.png" alt="Xoa" onclick="return ConfirmDelete()"/></a></td>                
                  <%} %>
            </tr>
    <%} %> 

    </table>
     <div class="pager">        
        <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new {page=x, category=Model.CurrentCategory})) %>
     </div>
     <br />
     <br />
    </div>

</asp:Content>
