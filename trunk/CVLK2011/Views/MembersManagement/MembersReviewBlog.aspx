<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetBlogByID_Result>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Review hình ảnh
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <h2 class="manager_title">Xem Blog</h2>
   <div style="text-align:right">
   <a href="<%= Url.Action("MembersBlog","MembersManagement") %>"><img src="../../../Images/admin_back.png" alt="Quay lại"/></a> 
   </div>
    <table class="detail_member_top" >
        <tr>
            <td style="width: 90px">
              <div>  <img alt="" src="<%:Model.ImageUpload %>" style="width: 131px" /></div>
               <div>Đăng bởi:<%:Html.Encode(Model.UserName) %> </div>
               <div>Đăng ngày:<%:Html.Encode(Model.Datepost) %></div>
               <div>Trạng thái:<%:Html.Encode(Model.StatusText) %></div>
              </td>
            <td style="width: 412px">
                <div><%=Model.BlogTitle %></div>
                <hr style="border:1px dotted #ccc" />
                <div><%=Model.BlogContent %></div>
            </td>
           
        </tr>
        <tr>
            <td style="width: 90px">
                &nbsp;</td>
            <td style="width: 412px">
            <%if (Model != null)
              { %>
            <%if (Model.Status == CVLK2011.Models.Utilities.cstApprove)
              { %> 
                     <a href="<%= Url.Action("BlogUnApprove",new { id = Model.BlogID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
            <%}
              else if (Model.Status == CVLK2011.Models.Utilities.cstUnApprove)
              { %>
                    <a href="<%= Url.Action("BlogApprove",new { id = Model.BlogID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
               <%}
              else
              {%>
                   
                     <a href="<%= Url.Action("BlogApprove",new { id = Model.BlogID }) %>"><img src="../../../Images/admin_duyet.png" alt="Duyệt"/></a>
                      <a href="<%= Url.Action("BlogUnApprove",new { id = Model.BlogID }) %>"><img src="../../../Images/admin_khongduyet.png" alt="Không duyệt"/></a>
             <% }
              }%>
                <a href="<%= Url.Action("DeleteBlog",new { id = Model.BlogID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a> 
                </td>
                
            
        </tr>
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
