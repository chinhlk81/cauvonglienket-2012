<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.BlogDetailsViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<div>
<%if (Model != null)
  {%>
      <table style="width:100%;">
       <tr>
            <td style="width: 90px;">
                <img src="../../../Images/ico_chat_64.png" width="20px" height="20px" alt="" /> Bình Luận</td>
            <td align="right">
                 <%=Model.CommentCount %> bình luận
                 <%=Html.Hidden("hdcurrentUser", Session["CurrentUserID"].ToString())%>
                 <%=Html.Hidden("UserIDOnWall", Model.OwnerBlog)%>
                 </td>
        </tr>
        <tr>
            <td colspan="2"><hr /></td>
        </tr>
      <%if (Model.CommentsList != null)
      {
          foreach (var item in Model.CommentsList)
          { %>
  
            
                    <tr>
                        <td style="width: 70px;" rowspan="4" valign="top">
                           <a href="<%=Url.Action("Index","MemberProfile",new{id=item.User.UserID}) %>">  <img alt="" src="../../<%=item.User.UserPicture %>" style="width:50px; height:50px;margin-left:10px" /></a></td>
                        <td align="right"> <%= Ajax.ImageActionLink("../../../Images/deleteIcon.gif", "Xóa", "DeleteComment", new { id = item.CommentID, blogid=Model.BlogID }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "commentsHolder", OnBegin = "function(){return ConfirmDelete(" + item.UserID + ")}" })%></td>
                    </tr>
                    <tr>
                        <td>
                            <%=Html.Encode(item.CommentContent)%>
                            </td>
                        
                    </tr>
                    <tr>
                        <td><img alt="blank" src="../../../Images/blank.gif" style="width: 100%; height: 5px" /></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size:90%">
                            <%=Html.Encode(item.Datepost)%></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2"><hr /></td>
                    </tr>
                
                <%}%>
            
        <%}%>
    </table>
    <div class="pager">        
            <%: Ajax.Pager(Model.PagingInfo.CurrentPage,Model.PagingInfo.TotalItems,"commentsHolder",Model.BlogID,Model.PagingInfo.ItemsPerPage,"BlogComments")%>
            </div>
<% } %>
  </div>
   <% using (Ajax.BeginForm("CreateComment", "MemberBlog", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "commentsHolder" }))
           { %>
            <table style="width:400px;text-align:left">
                    <tr>
                        <td style="width:40px;text-align:right;">
                          
                        </td>
                        <td style="width:200px;text-align:left">
                           <%=Html.TextAreaFor(model => model.BlogComment, new { Style = "width:400px;border:1px solid #B4C6DC;" })%>
                           <%=Html.ValidationMessageFor(model => model.BlogComment)%>   
                           <%=ViewData["ValidateComment"] %>
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
        <%}%>

<script src="../../Scripts/jquery.js" type="text/javascript"></script>
   <script type="text/javascript">
       function CheckInput() {
           var content = $('#MainContent').val();
           if (content == "") {
               return false;
           }
       }
       function ConfirmDelete(usid) {
           var onwall = $("#UserIDOnWall").val();
           var currentUser = $("#hdcurrentUser").val();
           if (currentUser == onwall || currentUser == usid) {
               if (confirm("Bạn có chắc xóa bài đăng này?") == true) {
                   return true;
               }
               else {
                   return false;
               }
           }
           else if (onwall != usid || currentUser != usid) {
               alert("Bạn không có quyền xóa bài đăng này!");
               return false;
           }
           else {
               if (confirm("Bạn có chắc xóa bài đăng này?") == true) {
                   return true;
               }
               else {
                   return false;
               }

           }

       }
   </script>