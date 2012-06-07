<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfig>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Cập nhật Menu</h2>
     <div style="text-align:right">
        <a href="<% =Url.Action("MenuCreate","AdminManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      <a href="<% =Url.Action("MenuIndex","AdminManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <% using (Html.BeginForm("MenuUpdate", "AdminManagement", FormMethod.Post, new  {enctype = "multipart/form-data" }))
       {%>
        <%: Html.ValidationSummary(true)%>

     
            



            <table class="table_detail_admin">
                <tr>
                    <td>
                        Tên menu</td>
                    <td>
                          <%=Html.TextBoxFor(model => model.MenuConfigName)%>
                <%=Html.ValidationMessageFor(model => model.MenuConfigName)%></td>
                </tr>
                <tr>
                    <td>
                        Nội dung</td>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td colspan="2">
                       <%=Html.TextArea("FckEditor1", Model.Contents, new { @name = "FckEditor1" })%>
                <%=Html.ValidationMessageFor(model => model.Contents)%></td>
                </tr>
                <tr>
                <td>
                </td>
                <td>
                <input type="submit" value="Lưu"/>
                <input type="reset" value="Hủy"/>
                </td>
                </tr>
            </table>
            



      

    <% } %>

     <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "500";
            oFCKeditor.ReplaceTextarea();
        }
</script>

</asp:Content>
