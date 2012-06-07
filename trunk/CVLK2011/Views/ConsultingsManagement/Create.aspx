<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Consulting>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo mới
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Tạo góc tư vấn</h2>
     <div style="text-align:right">
    <a href="<%=Url.Action("Index","ConsultingsManagement")%>"><img src="../../Images/admin_back.png" alt="Trở về" /></a>
    </div>
    <div>
    <% using (Html.BeginForm("Create", "ConsultingsManagement", FormMethod.Post))
       { %>
    <table  class="table_detail_admin">
    <tr  class="table_detail_admin">
    <td >Câu hỏi</td>
    <td><%:Html.TextAreaFor(Model => Model.ConsultingQuestions, new { Style = "width:550px" })%>
    <%:Html.ValidationMessageFor(Model => Model.ConsultingQuestions)%>
    </td>
    </tr>
    <tr>
    <td style="width: 88px">Trả lời</td>
    <td>
        <%= Html.TextArea("FckEditor1", "", new { @name = "FckEditor1" })%>
        <%:Html.ValidationMessageFor(Model => Model.ConsultingAnwsers)%>
    </td>
    </tr>
    
    <tr>
    <td style="width: 88px">Mô tả</td>
    <td><%:Html.TextAreaFor(Model => Model.ConsultingDesction, new { Style = "width:550px" })%>
    
    </td>
    </tr>
    <tr>
    <td style="width: 88px">Trạng thái</td>
    <td>
    <%:Html.DropDownList("consulStatus", ViewData["ConsultStatus"] as SelectList, new { Style = "width:150px" })%>
    </td>
    </tr>
    <tr>
    <td></td>
     <td>
            <input id="btnAdd" type="submit"  value="Thêm" />
             <input  type="button"   value="Làm lại"  name="Reset" onclick="document.location.href ='<%=Url.Action("Create")%>'"  />            
     </td>
    </tr>
    </table>
    <%} %>
    </div>
      <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "500px";
            oFCKeditor.ReplaceTextarea();
        }
</script>
</asp:Content>
