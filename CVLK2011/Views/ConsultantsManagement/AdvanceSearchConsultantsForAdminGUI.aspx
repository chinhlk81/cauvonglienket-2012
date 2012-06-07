<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Consultant>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AdvanceSearchConsultantsForAdminGUI
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%using (Html.BeginForm("AdvanceSearchConsultantsResultForAdminGUI", "ConsultantsManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
     
    <div class="content_menu">
      <table style="width:100%;">
            <tr>
                <td>
                    Tên hỗ trợ viên</td>
                <td>
                    <%=Html.TextBoxFor(Model => Model.ConsultantName, new { @class = "text_fill_register" })%>
                    </td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td  colspan="2">
                    <%=Html.TextBoxFor(Model => Model.ConsultantEmail)%></td>
            </tr>
            <tr>
                <td>
                    Điện thoại</td>
                <td  colspan="2">
                    <%=Html.TextBoxFor(Model => Model.ConsultantPhone, new { @class = "text_fill_register" })%> 
                    </td>
            </tr>
            <tr>
                <td>
                    Yahoo ID</td>
                <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.ConsultantYahooID)%></td>
            </tr>
            <tr>
                <td>
                    Skype ID</td>
                <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.ConsultantSkypeID)%></td>
            </tr>
            <tr>
                <td>
                    Thông tin mô tả</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.ConsultantDesc)%></td>
            </tr>
            <tr>
                <td align="right">
                    <input name = "btnAdvanceSearch" id="Button6" type="submit" value="Tìm" style="width:50px;"/></td>
                <td align="left" colspan="2">
                    <input name = "btnResetSearch" id="Button7" 
                        type="reset" value="nhập lại" style="width:80px;"/></td>
            </tr>
        </table>

      	</div>
	   
        <div class="footer_menu">
    
     &nbsp;</div>
<%} %>

</asp:Content>
