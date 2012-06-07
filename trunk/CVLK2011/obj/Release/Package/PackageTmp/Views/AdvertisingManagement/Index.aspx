<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý quảng cáo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


 <div class="content-box">
			<div class="box-body">
				<div class="box-header clear">
					<div class="title_admin">Quản lý quảng cáo</div>
                   
				</div>
				<div class="box-wrap clear">

                    
                     <div style="text-align:right"> <%:Html.ActionLink("Tạo mới", "Create", "AdvertisingManagement")%></div>
    <div>
    <table style="width: 100%;">
        <tr align="left">
            <td>
                Hình ảnh</td>
            <td>
                Liên kết</td>
            <td>
                Hiển thị</td>
            <td>
                Mô tả</td>
        </tr>
        <tr align="left">
            <td>
                Ngày hôm qua</td>
            <td>
                abc.com.vn</td>
            <td>
                true</td>
            <td >
                VIP</td>
                 <td >
               
              <%:Html.ActionLink("Xem","Details","AdvertisingManagement") %></td>
            <td >
               
              <%:Html.ActionLink("Chỉnh sửa","Create","AdvertisingManagement") %></td>
            <td >
               
                <%:Html.ActionLink("Xóa","Create","AdvertisingManagement") %></td>
        </tr>
              
        </table>
    </div>
				</div> <!-- end of box-wrap -->
			</div> <!-- end of box-body -->
			</div>



    
   
</asp:Content>
