<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MemberHomeListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<%@ Import Namespace="CVLK2011.Models" %>
<div>
<%using (Ajax.BeginForm("Subwall", "MemberHome", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "SubwallHolder" + Model.commentid }))
  { %>
                      <table>    
                      <%  if (Model.CommentRelationList != null)
                          {
                              IEnumerable<GetAllCommentRelationByCommentID_Result> relation = Model.CommentRelationList.Where(p => p.CommentParentID == Model.commentid);
                              if (relation.Count() > 0)
                              {%>
                                 <tr><td colspan="3">
                               <%=Ajax.ActionLink("Xem tất cả","ShowAllCommentsRealtion",new {commentid=Model.commentid},new AjaxOptions{ UpdateTargetId = "SubwallHolder" + Model.commentid}) %> 
                                 </td></tr>
                                 <%  foreach (var itemRelation in relation)
                                  {%>
                                <tr>
                                
                                <td colspan="3" >
                                <table width="320px" style="background:#EDEFF4;border-bottom:1px solid #fff;" >
                                    <tr>
                                        <td rowspan="2" style="width:45px;vertical-align:top">
                                            <img src="../../<%=itemRelation.UserPicture %>" alt="" width="45px" height="40px"/>
                                            <%=Html.Hidden("hdcurrentUser", Session["CurrentUserID"].ToString())%>
                                        </td>
                                        <td style="padding-left:5px">
                                        <div style="text-align:left;color:#0066CC">
                                            <%=Html.Encode(itemRelation.UserFullName)%>
                                        </div>
                                        <div style="text-align:left">
                                            <%=Html.Encode(itemRelation.CommentContent)%>
                                        </div>   
                                        <div style="text-align:left;font-size:85%;color:#7F7F7F"> <%=Html.Encode(itemRelation.Datepost)%> </div>
                                        <div style="text-align:right"> <%= Ajax.ImageActionLink("../../../Images/deleteIcon.gif", "Xóa", "DeleteCommentRelation", new { id = itemRelation.CommentID, commentid = Model.commentid, showall = Model.ShowAll }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "SubwallHolder" + Model.commentid, OnBegin = "function(){return ConfirmDelete(" + itemRelation.UserID + ")}" })%></div>
                                        <hr />
                                            </td>
                                    </tr>
                    </table>
                  </td>
                    </tr>
        
                            <%}

                              } %>
                            
                                <tr>
                                    
                                    <td colspan="2">
                                   
                                        <%=Html.TextBox("txtSubComment" + Model.commentid,"", new { Style = "width:312px" })%>
                                        <%=Html.HiddenFor(cmid => Model.commentid)%>
                                        <%=Html.HiddenFor(usid => Model.UserIDOnWall)%>

                                         
                                        
                            <br />
                                    </td>
                                </tr>
                            
                    <%}
                          else
                          {%>
                                                    <tr>
                                    <td  style="width:45px">
                                        
                                        </td>
                                    <td>
                                       
                                        <%=Html.TextBox("txtSubComment" + Model.commentid,"", new { Style = "width:312px" })%>
                                        <%=Html.HiddenFor(cmid => Model.commentid)%>
                                        <%=Html.HiddenFor(usid => Model.UserIDOnWall)%>
                                         <!--return Request.IsAjaxRequest()  ? (ActionResult)PartialView(@"SignUp") : RedirectToAction(@"Home");-->
                                       
                            <br />
                                    </td>
                                </tr>
                            
                     <% }%>
         </table>
                <%}%>
            
                        
         
</div>

    <script src="../../Scripts/jquery.js" type="text/javascript"></script>
<script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
<script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>   
   <script type="text/javascript">
       function CheckInput(cmtid) {
           var content = $("#SubContent"+cmtid).val();
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