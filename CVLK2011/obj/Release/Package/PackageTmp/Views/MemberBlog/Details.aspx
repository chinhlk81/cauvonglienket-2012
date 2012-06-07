<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.BlogDetailsViewModel>" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nội dung Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  

    <table style="width:100%;">
        <tr>
         <td style="width:110px">
                <div>
                        <img src="/<%=Model.CurrentBlog.ImageUpload %>" alt="" style="width:100px; height:90px"/>
               </div>
               </td>
            <td colspan="2" style="font-size:14px;float:left;color:#0066CC">
                <b><%=Html.Encode(Model.CurrentBlog.BlogTitle) %></b></td>
        </tr>
        <tr>
            <td style="color:#4F4F4F;font-size:85%">
                <%=Html.Encode(Model.CurrentBlog.Datepost) %>
            </td>
            <td align="right" style="height:30px">
            
            <%if (Convert.ToInt32(Session["CurrentUserID"].ToString()) == Model.CurrentBlog.UserID)
              { %>
               <a href="<%=Url.Action("Edit",new { id =Model.CurrentBlog.BlogID } )%>"><img src="../../../Images/icon_edit_user.png" alt="Sửa" /></a> |<a href="<%=Url.Action("Delete",new { id = Model.CurrentBlog.BlogID }) %>"><img src="../../../Images/deleteIcon.gif" alt="Xóa" onclick="return ConfirmDeleteMemberSite()"/></a>
               <%}
              %>
               </td>
        </tr>
        <tr>
            <td colspan="2">
                <%=Model.CurrentBlog.BlogContent%></td>
                </tr>
        <tr>
            <td colspan="2"><hr /></td>
        </tr>
        
        
        <tr >
            <td colspan="2">
            <div id="commentsHolder" >

            <%  var comment = (ViewData["BlogID"] as BlogDetailsViewModel);
                Model.OwnerBlog = Convert.ToInt32( Model.CurrentBlog.UserID.ToString());%>
            <%Html.RenderPartial("BlogComments"); %>
                  </div> 
             
            </td>
        </tr>
        <tr>
            <td colspan="2" >
            <div id="abc">
                <%=ViewData["ValidateComment"]%>
                <!--%Html.RenderPartial("CreateComment"); %-->
            </div>
            </td>
        </tr>
        
        <tr>
        <td>
       <%-- <% using (Ajax.BeginForm("CreateComment", "MemberBlog", new { currentpage = Model.PagingInfo.CurrentPage }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "commentsHolder" }))
           { %>
            <table style="width:400px;text-align:left">
                    <tr>
                        <td style="width:40px;text-align:right;">
                          
                        </td>
                        <td style="width:200px;text-align:left">
                           <%=Html.TextAreaFor(model => model.BlogComment, new { Style = "width:400px;border:1px solid #B4C6DC;" })%>
                           <%=Html.ValidationMessageFor(model => model.BlogComment)%>   
                         </td>
                    </tr>
                    <tr>
                        <td>
                           <div style="visibility:collapse" >
                          <%=Html.TextBoxFor(model => Model.BlogID)%>"</div>
                        </td>
                        <td align="right">
                           <input id="Submit1" class="btn_user_update" type="submit" value="Gửi" />
                        </td>
                        
                    </tr>
                </table>
        <%}%>--%>
        </td>
        </tr>
    </table>
    <script src="../../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
