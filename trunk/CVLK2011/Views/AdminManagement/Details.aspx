<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Admin>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <h2 class="manager_title_detail">Chi tiết Quản trị</h2>
     <div style="text-align:right">
    <a href="<% =Url.Action("Create") %>"><img src="../../../Images/admin_add.png" alt="Create "/></a>
    <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Back to list"/></a>
    
    </div>
    <table class="table_detail_admin">
        <tr align="left">
            <td class="size-200" style="width: 196px">
                Tên đăng nhập</td>
             <td>
                <%=Html.Encode(Model.UserName) %>
                </td>
                </tr>
                 <tr>
        <td> Loại</td>
        <td>
        <%=Html.Encode(Utilities.AliasDictionary[Model.Type])%>
        
        </td>
        </tr>
                <tr>
               <td class="size-200" style="width: 196px">
                Mô tả</td>
                <td>
                
                <%=Html.Encode(Model.Description) %></td>
        </tr>
        <tr align="left">
           <td class="size-200" style="width: 196px"></td>
           <td>
                <a href="<%=Url.Action("Edit",new {id=Model.AdminID})%>"><img src="../../Images/admin_edit.png" alt="Edit Admin" /></a>
                <a href="<%=Url.Action("Delete",new {id=Model.AdminID})%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
           </td>
            
    </tr>
    </table>
</asp:Content>
