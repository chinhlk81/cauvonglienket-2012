<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MessageDetailsViewModel>" %>
<%@ Import Namespace="CVLK2011.Models" %>
 <div class="title_top_user">Trả lời tin nhắn</div>
    <div >
    <%using (Html.BeginForm("ReplyMessage", "MemberMessage", FormMethod.Post, new { enctype = "multipart/form-data" }))
      { %>
     <table style="width:400px;text-align:left">
                    <tr>
                        <td style="width:40px;text-align:right;">
                            <img alt="" src="/<%=((User)Session["CurrentUserObject"]).UserPicture %>" width="60px" height="50px"  />
                        </td>
                        <td style="width:200px;text-align:left">
                           <%=Html.TextAreaFor(model => model.MessageReply, new { Style = "width:400px;border:1px solid #B4C6DC;" })%>
                           <%=Html.ValidationMessageFor(model=>model.MessageReply) %>   
                         </td>
                    </tr>
                    <tr>
                        <td>
                           <div style="visibility:collapse; height:10px">
                          <%=Html.TextBoxFor(model=>Model.CurrentMessage.MessageID)%>"
                           <%=Html.TextBoxFor(model=>Model.CurrentMessage.FK_UserSendID)%>"
                            <%=Html.TextBoxFor(model=>Model.CurrentMessage.MessageTitle)%>"
                          </div>
                        </td>
                        <td align="right">
                                <input id="Submit2" type="submit" value="Gửi tin" class="btn_user_update"/>
                        </td>
                        
                    </tr>
                </table>
    <%} %>
    </div>

