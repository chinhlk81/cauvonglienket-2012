<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetConsultingByID_Result>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chit tiết tư vấn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Chi tiết tư vấn</h2>
    <div style="text-align:right">
     <%if (Session["Type"].ToString() == "Admin")
       { %>
    <a href="<%=Url.Action("Create","ConsultingsManagement")%>"><img src="../../Images/admin_add.png" alt="Tạo mới" /></a>
    <%} %>
    <a href="<%=Url.Action("Index","ConsultingsManagement")%>"><img src="../../Images/admin_back.png" alt="Trở về" /></a>
    </div>
    <table  style="border:1px solid #ccc;font-size:13px;text-align:justify;padding:5px;">
    <tr>
    <td style="width:90px;font-size:13px;color:#3E5A8F;font-weight:bold;">
    Câu hỏi
    </td>
    <td>
     <%= Html.Encode(Model.ConsultingQuestions)%>
    </td>
    </tr>

     <tr>
   <td style="width:90px;font-size:13px;color:#3E5A8F;font-weight:bold;">
        Trả lời
    </td>
    <td style="padding:20px">
        <%= Model.ConsultingAnwsers%>
    </td>
    </tr>
     <tr>
    <td>
    Trạng thái
    </td>
    <td>
      <%= Html.Encode(Model.ConfigText)%>
    </td>
    </tr>
     <tr>
    <td>
        Mô tả
    </td>
    <td>
        <%= Html.Encode(Model.ConsultingDesction)%>
    </td>
    </tr>
    <tr>
    <td></td>
    <td>
     <%if (Session["Type"].ToString() == "Admin")
       { %>
    <div style="text-align:left">
    <a href="<%=Url.Action("Edit", new {id= Model.ConsultingID })%>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a>
    <a href="<%=Url.Action("Delete",new { id=Model.ConsultingID })%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
    </div>
    <%} %>
    </td>
    </tr>
    </table>
    

</asp:Content>
