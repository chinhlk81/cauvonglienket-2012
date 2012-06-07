<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetConsultingByID_Result>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Cập nhật</h2>
     <div style="text-align:right">
    <a href="<%=Url.Action("Create","ConsultingsManagement")%>"><img src="../../Images/admin_add.png" alt="Tạo mới" /></a>
    <a href="<%=Url.Action("Index","ConsultingsManagement")%>"><img src="../../Images/admin_back.png" alt="Trở về" /></a>
    </div>
    <%using (Html.BeginForm("Edit", "ConsultingsManagement", FormMethod.Post))
      { %>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>                    
        <table class="table_detail_admin">
        <tr>
        <td style="width:130px">
                Câu hỏi tư vấn
            </td>
        <td> 
                <%: Html.TextAreaFor(model => model.ConsultingQuestions, new {Style="width:550px"})%>
                <%: Html.ValidationMessageFor(model => model.ConsultingQuestions) %>
            </td>
        </tr>

        <tr>
           <td>
                Câu trả lời
            </td>
            <td>
                <%= Html.TextArea("FckEditor1", Model.ConsultingAnwsers, new { @name = "FckEditor1" })%>
                <%: Html.ValidationMessageFor(model => model.ConsultingAnwsers) %>
          </td>
        </tr>

        <tr>
        <td >
                Mô tả
             </td>
        <td>
                <%: Html.TextAreaFor(model => model.ConsultingDesction, new { Style = "width:550px" })%>
                <%: Html.ValidationMessageFor(model => model.ConsultingDesction) %>
            </td>
        </tr>

        <tr>
        <td>
                Trạng thái
        </td>
        <td>                
                <%:Html.DropDownList("consulStatus", ViewData["ConsultStatus"] as SelectList, new { Style = "width:150px" })%>
       </td>
        </tr>
        <tr>
        <td>
            <%: Html.HiddenFor(model => model.ConsultingID)%>
        </td>
        <td><input type="submit" value="Cập Nhật" />
        </td>
        </tr>
        </table>
        </fieldset>

    <% } %>

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

