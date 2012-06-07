<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MemberHomeListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace="CVLK2011.Models" %>
<%--<style type="text/css">
    .style1
    {
        width: 69px;
    }
    </style>--%>
   
 <table style="width:400px;border-bottom:1px solid #C6D6EC;margin-bottom:10px;">
 <tr>
 <td colspan="3">
 
    <% using (Ajax.BeginForm("MainWall", "MemberHome", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "wall", OnBegin = "function(){return CheckMainContent()}" }))
           { %>
                    
                    <div style="text-align:left;color:#223C6F;font-weight:bold;font-size:14px;"><%=Html.Encode(Model.UserNameOnWall)%>
                    </div>
                    <hr />
                   <div style="font-weight:bold;margin-bottom:5px;"> Chia sẻ với bạn bè :</div>
                    <div>
                                <%=Html.TextAreaFor(model => model.MainContent, new { Style = "width:410px;height:45px;border:1px solid #C6D6EC;background:#fff" })%>
                                 <%=Html.HiddenFor(model=>model.UserIDOnWall) %>
                                 <%=Html.Hidden("hdcurrentUser", Session["CurrentUserID"].ToString())%>
                           </div>
                           
                               
                        
                       <div style="text-align:right;margin-top:5px">
                        <input type="submit" class="btn_chiase" value="Chia sẻ" />
                        </div>
              

                <br />
                <%} %>

 
 </td>
 
 
 </tr>
 <tr >
 <td style="width:20px;font-weight:bold;color:#444444" align="left" colspan="3">
       <img src="../../Images/vcard.png" alt=""/> 
  
            
              TƯỜNG NHÀ
             <div style="border:1px solid #535D6F;width:100%;margin-top:5px" > </div>
              </td>
    
 </tr>
 <tr>
 <td colspan="3" style="height:30px">
 </td>
 </tr>
       <%if (Model != null)
         {
             if (Model.CommentList != null)
             {
                 foreach (var item in Model.CommentList)
                 {
                    %>
                    <tr >
                      
                       
                            <td style="width:60px;vertical-align:top;padding:5px;float:left">
                                 <img src="../<%=item.UserPicture %>" alt="" height="55px" width="60px"/>
                             
                            </td>
                            <td style="font-weight:bold;vertical-align:top;" colspan="2">
                            <div style="text-align:left" class="username_class">
                                <a href="<%=Url.Action("Index","MemberHome",new { id=item.UserID}) %>"><%=Html.Encode(item.UserFullName)%></a>
                             </div>
                             <div style="text-align:left;color:#1F1F1F;font-size:100%;font-weight:normal"><%=item.CommentContent%></div>
                             <div style="text-align:left;color:#7F7F7F;font-size:85%;font-weight:normal;padding-top:-10px;"> <%=Html.Encode(item.Datepost)%>
                                   
                            </div>
                            <div style="text-align:right"> <%= Ajax.ImageActionLink("../../../Images/deleteIcon.gif", "Xóa", "DeleteComment", new { id = item.CommentID, wallID = Model.UserIDOnWall }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "wall", OnBegin = "function(){return ConfirmDelete(" + item.UserID + ")}" })%></div>
                            </td>
                        </tr>
                        <tr>
                        <td></td>
                        <td colspan="2">
                        <div id="SubwallHolder<%=item.CommentID%>">
                        <%Model.commentid = item.CommentID; %>
                        <%Html.RenderPartial("Subwall");%>
                            </div>
                        </td>
                        </tr>
                    
                <% }%>
                <tr><td colspan="3">
                <div class="pager">        
            <%: Ajax.Pager(Model.PagingCommentInfo.CurrentPage, Model.PagingCommentInfo.TotalItems, "wall", Model.UserIDOnWall, Model.PagingCommentInfo.ItemsPerPage, "PagingWall")%>
            </div></td></tr>  
            <% }
         }%>
        </table>
<script src="../../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
<script src="../../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.js" type="text/javascript"></script>
   
   <script type="text/javascript">
       function CheckMainContent() {
           var content = $("#MainContent").val();
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
               return false;}
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

