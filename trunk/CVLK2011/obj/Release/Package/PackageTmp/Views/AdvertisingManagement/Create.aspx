<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Ad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tạo mới-Thay đổi quảng cáo</h2>
    <% using (Html.BeginForm())
       { %>

    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <img alt="" src="" style="width: 340px" /></td>
        </tr>
        <tr>
            <td style="width: 105px">
                Liên kết(link)</td>
            <td>
            <%=Html.TextBoxFor( Model=> Model.Link) %>
                </td>
        </tr>
        <tr>
            <td style="width: 105px">
                Hiển thị</td>
            <td>
                
                <%=Html.CheckBoxFor(Model=>Model.IsVisible) %>
                </td>
        </tr>
        <tr>
            <td style="width: 105px">
                Mộ tả</td>
            <td>
                <%=Html.TextAreaFor(Model=>Model.Description) %></td>
        </tr>
        <tr>
            <td style="width: 105px">
                &nbsp;</td>
            <td>
                <input id="btnAdd" type="button" value="Thêm" />&nbsp;
                <input id="btnEdit" type="button" value="Sửa" />&nbsp;
                <input id="btnDelete" type="button" value="Xóa" /></td>
        </tr>
        </table>
 <%} %>   

</asp:Content>
