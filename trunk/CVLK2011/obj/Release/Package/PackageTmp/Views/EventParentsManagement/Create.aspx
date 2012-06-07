<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.EventParent>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo dịch vụ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Tạo dịch vụ</h2>
    <div style="text-align:right">
    <a href="<%=Url.Action("Index","EventParentsManagement") %>"><img src="../../Images/admin_back.png" alt="Sửa" /></a>
           
    </div>
    <%using (Html.BeginForm("Create","EventParentsManagement",FormMethod.Post,new {enctpye="multipart/form-data"}))
      { %>
    <div>
    
        <table  class="table_detail_admin">
            <tr>
                <td class="size-170" style="width: 162px">
                    Tên dịch vụ</td>
                <td>
                 <%=Html.TextBoxFor(model=>model.EventParentName) %>
                <%=Html.ValidationMessageFor(model=> model.EventParentName) %>
                </td>
            </tr>
            <tr>
                <td class="size-170" style="width: 162px">
                    Trạng thái</td>
                <td>
                <%= Html.DropDownList("status", (SelectList)ViewData["Status"], new { Style = "width:150px" })%>
                </td>
            </tr>
            <tr>
                <td class="size-170" style="width: 162px">
                    Mô tả</td>
                <td>
                <%:  Html.TextArea("FckEditor1", "", new { @name="FckEditor1" })%>
                </td>
            </tr>
            <tr>
                <td class="size-170" style="width: 162px">
                    &nbsp;</td>
                <td>
                    <input id="Submit1" type="submit" value="Lưu" />
                    <input id="Reset1" type="reset" value="Hủy" /></td>
            </tr>
        </table>
    
    </div>
    <%} %>
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
