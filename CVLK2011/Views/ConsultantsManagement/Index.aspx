<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.ConsultantsListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <%using (Html.BeginForm("SearchConsultantsByName", "ConsultantsManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
   { %>
<div class="content-box clear">
			<div class="box-body iconbar">
				<div class="box-wrap">
				<div class="main-icons" id="iconbar">
					<ul class="clear">
		                        
		                        <li><a href="../ConsultantsManagement/Index"><img src="../../images/ico_users_64.png" class="icon" alt="" /><span class="text">Tư vấn viên</span></a></li>
                		        <li><a href="../ConsultantsManagement/OSIndex"><img src="../../images/ico_picture_64.png" class="icon" alt="" /><span class="text">Liên lạc trực tuyến</span></a></li>
					</ul>
				</div>
				</div>
			</div>
			</div>


    <h2 class="manager_title">Quản lý đội ngũ tư vấn</h2>
    <%if (Session["Type"].ToString() == "Admin")
      { %>
    <div style="text-align:right">
        <a href="<% =Url.Action("Create","ConsultantsManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      
    </div>
    <%} %>
    <div>
        <table class="table_list_admin">
            <tr>
            <td style="width:100px">
                       
                      <a href="<% =Url.Action("ActiveConsultants") %>"><img src="../../../Images/active.png" alt="Active" onclick="return ConfirmActive()"/></a>
                     
                     <a href="<% =Url.Action("DeactivateConsultants") %>"><img src="../../../Images/deactive.png" alt="Deactivate" onclick="return ConfirmDeActive()"/></a>

            </td>
                <td colspan="14" style="width:400px;" align="right">
                    <%=Html.TextBox("consultantName")%>
                    <input id="btnSearch" style="width: 27px; height: 25px; background-image: url(../../../Images/i_search.gif)" type="submit" value="" />
                   
                    <%=Html.ActionLink("Tìm kiếm nâng cao", "AdvanceSearchConsultantsForAdminGUI", "ConsultantsManagement")%>
                    </td>
            </tr>
            <tr class="title_list_admin">
                <td>Hình</td>
                <td >
                Họ và tên
                </td>
                
                <td >
                Điện thoại
                </td>
                
                <td >
                Email
                </td>
                
                <td >
                Yahoo ID
                </td>
            
                <td ">
                Skype ID
                </td>
                <td >Trạng thái</td>
            
                <td>Xem</td>
            
             <%if (Session["Type"].ToString() == "Admin")
               { %>
               <td>Chỉ định</td>
                <td >Sửa</td>
            
            
                <td>Xóa</td>
            <%} %>
            
                </tr>
            <tr>
            <% if (Model != null)
               { %>
            <% foreach (var item in Model.ConsultantList)
               { %>
            <td><a href="<% =Url.Action("Details",new{id=item.ConsultantID}) %>"><img alt="hình đại diện" src="<%:item.ConsultantPicture %>" style="width: 60px" /></a>
            </td>
            <td>
              <%=Html.Encode(item.ConsultantName)%>     
           </td>
            <td>
                <%=Html.Encode(item.ConsultantPhone)%>
            </td>
            <td>
                <%=Html.Encode(item.ConsultantEmail)%>
            </td>
            <td>
                <%=Html.Encode(item.ConsultantYahooID)%>
            </td>
            <td>
                <%=Html.Encode(item.ConsultantSkypeID)%>
            </td>
            <td>
                <%=Html.Encode(item.StatusText)%>
            </td>
           
            <td align="center">
                <a href="<% =Url.Action("Details",new{id=item.ConsultantID}) %>"><img src="../../../Images/admin_preview.png" alt="Xem"/></a></td>
            <%if (Session["Type"].ToString() == "Admin")
              { %>
              <td align="center">
             
               <%= Html.CheckBox("FrontPage", item.ConsultantFrontPage, new { onclick = "CheckFrontPage('" + item.ConsultantID + "')" })%>
             
              </td>
            <td align="center">
                <a href="<% =Url.Action("Edit",new{id=item.ConsultantID}) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a></td>
            <td align="center">
                <a href="<% =Url.Action("Delete",new{id=item.ConsultantID}) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a></td>
          <%} %>      
            </tr>
           <%}
               }%> 
        </table>
    <div class="pager">        
        <%: Html.PageLinks(Model.PagingInfo, x => Url.Action("Index", new { page = x, category = Model.CurrentConsultant }))%>
        </div>
    </div>
<%} %>
<script type="text/javascript">

    function ConfirmActive() {
        if (confirm("Bạn chắc chắn hiển thị toàn bộ danh sách?") == true) {
            return true;
        }
        else {
            return false;
        }

    }
    function ConfirmDeActive() {
        if (confirm("Bạn chắc chắn ẩn toàn bộ danh sách?") == true) {
            return true;
        }
        else {
            return false;
        }

    }
function CheckFrontPage(id) {
    $.post("/ConsultantsManagement/CheckFrontPage", { id: id });
     }
</script>
 
</asp:Content>
