<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetPhotoByID_Result>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Review hình ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Chi tiết hình ảnh</h2>
     <div style="text-align:right">
   <a href="<%=Url.Action("MembersPhoto","MembersManagement")%>"><img src="/../Images/admin_back.png" alt="Trở về" /></a></div>
    
    <table class="table_list_admin">
    <%if(Model!=null){ %>
    <tr class="table_list_admin">
    <td style="width:252px">
    <div>
            <img src="../<%=Model.PhotoPath%>" alt="hình" style="width: 250px" />
    </div>
    </td>
    <td>
    <div>Thuộc Album:<%=Html.Encode(Model.AlbumName) %></div>
    <div style="height:7px"></div>
    <div>Ngày Post:<%=Html.Encode(Model.DateUpload) %></div>
    <div style="height:7px"></div>
    <div>Trạng thái:<%=Html.Encode(Model.StatusText) %></div>
    <div style="height:7px"></div>
    <div>Mô tả:<%=Html.Encode(Model.Description) %></div>
    </td>
    </tr>
    <tr>
            <td></td>
             <td>
             <%if (Model.Status == CVLK2011.Models.Utilities.cstApprove)
              { %> 
                    <a href="<%= Url.Action("UnApprovePhoto",new { id = Model.PhotoID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
            <%}
               else if (Model.Status == CVLK2011.Models.Utilities.cstUnApprove)
              { %>
                     <a href="<%= Url.Action("ApprovePhoto",new { id = Model.PhotoID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
               <%}
              else
              {%>
                   
                     <a href="<%= Url.Action("ApprovePhoto",new { id = Model.PhotoID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                      <a href="<%= Url.Action("UnApprovePhoto",new { id = Model.PhotoID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
             <% }
              %>
               <a href="<%= Url.Action("DeletePhoto",new { id = Model.PhotoID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
                </td>
            </tr>
    <%} %>
    </table>
    <script type="text/javascript">

        function ConfirmDelete() {
            if (confirm("Bạn chắc chắn xóa?") == true) {
                return true;
            }
            else {
                return false;
            }

        }
			     
			    
    </script>
</asp:Content>
