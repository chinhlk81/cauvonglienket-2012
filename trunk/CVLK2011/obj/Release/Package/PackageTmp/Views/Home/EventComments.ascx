<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.EventDetailsViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<div>
 
            <%if (Session["CurrentUserID"] != null)
                                  { %>
                                <%=Html.Hidden("hdcurrentUser", Session["CurrentUserID"].ToString())%>
                                            <%} %>     
<%if (Model != null)
  { %>
<%foreach (var item in Model.CommentsList)
  { %>
            <div style="border-bottom:1px solid #ccc;margin-bottom:10px;margin-top:10px;" >
            <table style="width:100%;font-weight:normal;">
                    <tr>
                        <td style="width: 60px;" rowspan="4" valign="top">
                            <img alt="" src="../../<%=item.User.UserPicture %>" style="width:50px; height:50px;" /></td>
                        <td>
                        <a  class="namecamnhan"><%=Html.Encode(item.User.UserFullName) %></a> nói</td>
                         
                    </tr>
                    <tr>
                        <td>
                            <%=Html.Encode(item.CommentContent) %>
                            </td>
                        <td>
                        
            <%if (Session["CurrentUserID"] != null)
              { %>
                        <div style="text-align:right"> <%= Ajax.ImageActionLink("../../../Images/deleteIcon.gif", "Xóa", "DeleteComment", new { id = item.CommentID, eventid = Model.EventID }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "commentsHolder", OnBegin = "function(){return ConfirmDelete(" + item.UserID + ")}" })%></div></td>
                        <%} %>
                    </tr>
                  <%--  <tr>
                        <td><img alt="blank" src="../../../Images/blank.gif" style="width: 100%; height: 5px" /></td>
                    </tr>--%>
                    <tr>
                        <td style="color:#646565;font-size:85%">
                            <%=Html.Encode(item.Datepost) %></td>
                        
                    </tr>
 
                </table>
                </div>
                <%}%>
                 
         <div class="pager">        
            <%:Ajax.Pager(Model.PagingInfo.CurrentPage, Model.PagingInfo.TotalItems, "commentsHolder", Model.EventID, Model.PagingInfo.ItemsPerPage, "EventComments")%>
            </div>
  <%} %>
 </div>
   <div>
             
             
                 <% using (Ajax.BeginForm("CreateComment", "Home", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "commentsHolder", OnBegin = "function(){return ValidateInput()}" }))
                    { %>
                    
                        <table style="width:400px;text-align:right">
                   
                        <tr>
                                <td style="width:200px;text-align:left">
                                <%=Html.TextAreaFor(model => model.EventComment, new { Style = "width:400px;border:1px solid #B4C6DC;" })%>
                                <%=Html.ValidationMessageFor(model => model.EventComment)%>   
                                <div id="dvLogin" style="visibility:collapse;font-size:9px;color:Gray">Vui lòng đăng nhập trước khi bình luận </div>
                                <div style="text-align:right"><input type="submit" name="btnsubmit" class="btn_dangky_home"  value="Bình luận" />
                                <%=Html.HiddenFor(model=>model.EventID) %>
                                
                        </div>
                        </td>
                        </tr>
                        </table>
                <%} %>
           
        </div> 

        <script src="../../Scripts/jquery.js" type="text/javascript"></script>
        <script type="text/javascript">
            function ValidateInput() {
                var content=$("#EventComment").val();
                var user = $("#hdcurrentUser").val();
                if (user == null) {
                    $("#dvLogin").css("visibility", "visible");
                    return false;
                }
                else if (content == "")
                    return false;
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