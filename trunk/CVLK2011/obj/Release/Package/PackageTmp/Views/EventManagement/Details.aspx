<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Event>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết sự kiện
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title_detail">Chi tiết sự kiện</h2>
    <div style="text-align:right">
   <a href="<%=Url.Action("Create","EventManagement")%>"><img src="/../Images/admin_add.png" alt="Tạo mới" /></a>
   <a href="<%=Url.Action("Index","EventManagement")%>"><img src="/../Images/admin_back.png" alt="Trở về" /></a></div>
    <div>
        <table class="table_detail_admin">
            <tr>
                <td>
                    
                    Tên sự kiện 
                    </td>
                    
                    <td><%= Html.Encode(Model.EventName) %></td>
                
                    </tr>
                    <tr>
                    <td>Sự kiện nổi bậc</td>
                    <td>
                     <%= Html.CheckBox("eveTypical", Model.IsTypical)%>
                    </td>
                    </tr>
            <tr>
            <td>Thời gian </td>
            <td><%=Html.Encode(Model.EventTime) %> Ngày <%=Html.Encode(Model.EventDate.ToString("dd/MM/yyyy"))%></td>
            </tr>
            <tr>

            <td>
            Địa điểm </td><td><%=Html.Encode(Model.EventLocation) %>
            </td>
            </tr>
            <tr>
            <td>Độ tuổi tham gia</td><td> <%=Html.Encode(Model.EventAgeJoint) %></td>
            </tr>
            <tr>
                <td>
                    Mô tả </td>
                    <td>
                    <%= Html.Encode(Model.Description) %></td>
               </tr>
               <tr>
                <td style="width: 110px">
                   
                    Ngày post</td>
                    <td>
                    <%= Html.Encode(Model.Datepost.ToString("dd/MM/yyyy"))%> 
                    </td>
                </tr>
                <tr>
                <td>Ảnh đại diện</td>
                <td><img alt="hình đại diện" src="../../<%=Model.EventImages %>" style="width: 180px; height:140px" /></td>
                </tr>
                <tr>
                <td>
                    Nội dung </td><td><%= Model.EventContent %></td>
                
            </tr>
            <tr>
            <td></td>
            <td>
            <a href="<%=Url.Action("Edit", new { id = Model.EventID })%>"><img src="/../Images/admin_edit.png" alt="Sửa" /></a>
            <a href="<%=Url.Action("Delete",new { id = Model.EventID }) %>"><img src="/../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
            </td>
            </tr>
            </table>
    </div>
    
</asp:Content>
