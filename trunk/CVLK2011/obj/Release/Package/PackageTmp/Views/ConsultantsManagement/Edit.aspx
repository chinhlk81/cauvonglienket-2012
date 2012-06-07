<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Consultant>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Sửa thông tin tư vấn viên 
    </h2>
    <div style="text-align:right">
        <a href="<% =Url.Action("Create","ConsultantsManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      <a href="<% =Url.Action("Index","ConsultantsManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <div>
    <%using (Html.BeginForm("Edit", "ConsultantsManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
      { %>
        <table class="table_detail_admin" >
            <tr >
                <td  class="size-170" style="width: 126px">
                    Họ và tên
                </td>
                <td colspan="2">
                    <%:Html.TextBoxFor(model => model.ConsultantName, new { Style = "width:150px" })%>
                    <%:Html.ValidationMessageFor(model => model.ConsultantName)%>
                </td>
                
            </tr>
            <tr>
                <td class="size-170" style="width: 126px">
                   Điện thoại
                </td>
                <td colspan="2">
                   <%:Html.TextBoxFor(model => model.ConsultantPhone, new { Style = "width:150px" })%>
                    <%:Html.ValidationMessageFor(model => model.ConsultantPhone)%>
                </td>
                
            </tr>
            <tr>
                <td class="size-170" style="width: 126px">
                   Email
                </td>
                <td colspan="2">
                    <%:Html.TextBoxFor(model => model.ConsultantEmail, new { Style = "width:250px" })%>
                  <%=Html.ValidationMessageFor(Model => Model.ConsultantEmail)%>
                </td>
               
            </tr>
            <tr>
            <td class="size-170" style="width: 126px">
            Yahoo ID
            </td>
            <td colspan="2">
                    <%:Html.TextBoxFor(model => model.ConsultantYahooID, new { Style = "width:150px" })%>
                    <%:Html.ValidationMessageFor(model => model.ConsultantYahooID)%>
            </td>
            
            </tr>
            <tr>
            <td class="size-170" style="width: 126px">
            Skype ID
            </td>
            <td colspan="2">
             <%:Html.TextBoxFor(model => model.ConsultantSkypeID, new { Style = "width:150px" })%>
                    <%:Html.ValidationMessageFor(model => Model.ConsultantSkypeID)%>
                    </td>
            </tr>
            <tr>
            <td>Trạng thái</td>
            <td colspan="2">
             <%:Html.DropDownList("Status", ( SelectList)ViewData["Status1"])%>
            </td>
            </tr>
            <tr valign="bottom">
            <td valign="bottom"> Ảnh đại diện</td>
            <td style="width:75px">
                 <img alt="hình đại diện" src="<%: Model.ConsultantPicture %>" style="width: 60px" />
                </td>
                
                <td valign="bottom">
                &nbsp;<input id="file1" type="file" name="editFile"/></td>
            </tr>
           
            <tr>
            <td class="size-170" style="width: 126px">Mô tả</td>
            <td colspan="2">
             <%:Html.TextAreaFor(model => model.ConsultantDesc, new { Style = "width:350px" })%>
                    <%:Html.ValidationMessageFor(model => model.ConsultantDesc)%>
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
