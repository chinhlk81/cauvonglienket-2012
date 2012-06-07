<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Consultant>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Đội ngũ tư vấn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <h2 class="manager_title_detail">Thêm tư vấn viên</h2>
     <div style="text-align:right">
        <a href="<% =Url.Action("Index","ConsultantsManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <div>
    <%using (Html.BeginForm("Create", "ConsultantsManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
      { %>
        <table class="table_detail_admin">
            <tr >
                <td  class="size-170" style="width: 126px">
                    Họ và tên
                </td>
                <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.ConsultantName, new {Style="width:150px"})%>
                    <%=Html.ValidationMessageFor(Model => Model.ConsultantName)%>
                </td>
                
            </tr>
            <tr>
                <td class="size-170" style="width: 126px">
                   Điện thoại
                </td>
                <td colspan="2">
                   <%=Html.TextBoxFor(Model => Model.ConsultantPhone, new { Style = "width:150px" })%>
                    <%=Html.ValidationMessageFor(Model => Model.ConsultantPhone)%>
                </td>
                
            </tr>
            <tr>
                <td class="size-170" style="width: 126px">
                   Email
                </td>
                <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.ConsultantEmail, new { Style = "width:250px" })%>
                   <%=Html.ValidationMessageFor(Model => Model.ConsultantEmail)%>
                </td>
               
            </tr>
            <tr>
            <td class="size-170" style="width: 126px">
            Yahoo ID
            </td>
            <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.ConsultantYahooID, new { Style = "width:150px" })%>
                    <%=Html.ValidationMessageFor(Model => Model.ConsultantYahooID)%>
            </td>
            
            </tr>
            <tr>
            <td class="size-170" style="width: 126px">
            Skype ID
            </td>
            <td colspan="2">
             <%=Html.TextBoxFor(Model => Model.ConsultantSkypeID, new { Style = "width:150px" })%>
                    <%=Html.ValidationMessageFor(Model => Model.ConsultantSkypeID)%>
                    </td>
            </tr>
            <tr>
            <td>Trạng thái</td>
            <td colspan="2">
            <%=Html.DropDownList("status",(SelectList)ViewData["Status"])%>
            </td>
            </tr>
            <tr valign="middle">
            <td valign="middle"> Ảnh đại diện</td>
            <td style="width:75px">
                 <img alt="Hình đại diện" src="" style="width: 71px" />
                <br />
                </td>
                <td valign="bottom">
                &nbsp;<input id="File1" type="file" name="uploadFile" /></td>
            </tr>
            
            <tr>
            <td class="size-170" style="width: 126px">Mô tả</td>
            <td colspan="2">
             <%=Html.TextAreaFor(Model => Model.ConsultantDesc, new { Style = "width:350px" })%>
                    <%=Html.ValidationMessageFor(Model => Model.ConsultantDesc)%>
            </td>
            </tr>
            <tr>
            <td class="size-170" style="width: 126px"></td>
            <td colspan="2">
                &nbsp;
                <input id="Submit1" type="submit" value="Lưu" />
                <input id="Reset1" type="reset" value="Hủy" /></td>
            </tr>
        </table>
   
    <%} %>
    </div>

</asp:Content>
