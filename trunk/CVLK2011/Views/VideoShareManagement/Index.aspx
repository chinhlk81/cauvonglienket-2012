<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.AllVideoShare>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản lý chia sẻ video
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2 class="manager_title">Quản lý Video chia sẻ</h2>
    <table class="table_list_admin">
        <tr  class="title_list_admin">
            <td >
                Video của thành viên</td>
            <td>Gởi tới thành viên</td>
            <td>
                Ngày gởi</td>
            <td>
                Mô tả</td>
            <td>
                Xem</td>            
            <td >
                Xóa</td>
        </tr>
        <% if (Model != null)
           {
               foreach (var item in Model.VideoList)
               {
                   DBContainer ctx = new DBContainer();
                   GetUserByID_Result us = ctx.GetUserByID(item.VideoPartnerID).SingleOrDefault();
                   if (us != null)
                   {
                   %>
              
        <tr>                      
            <td >
             <%=Html.Encode(item.User.UserFullName)%>    
            </td>
            <td >
          
             <%=Html.Encode(us.UserFullName)%>    
            </td>
            <td >
                <%=Html.Encode(item.DateCreate)%>
            </td>
            <td >
                    <%=Html.Encode(item.Description)%>
           </td>          
           <td align="center">
                <!--a href="<%=Url.Action("Details",new { id = item.UserID })%>"><img src="../../Images/admin_preview.png" alt="Xem" /></a-->
                <%= Ajax.ImageActionLink("../../Images/admin_preview.png", "Xem", "Details", new { id = item.UserID }, new AjaxOptions { UpdateTargetId = "video" })%>
           </td>           
           <td align="center">
                 <a href="<%=Url.Action("Delete",new { id = item.VipVideoID })%>"><img src="../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()" /></a>
           </td>
        </tr>
         <%}
               }
           }%>
        </table>
        <div class="pager">        
            <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new { category=Model.CurrentVideo, page=x}))%>
        </div>
        <div id="video">
        </div>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>

</asp:Content>
