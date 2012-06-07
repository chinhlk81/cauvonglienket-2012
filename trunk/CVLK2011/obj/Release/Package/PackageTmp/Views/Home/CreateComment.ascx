<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.EventDetailsViewModel>" %>

                <br />
<div>
 <% using (Html.BeginForm("CreateComment", "Home", new{ entype="multipart/form-data" }))
    { %>
     
   <table style="width:400px;text-align:left">
                    <tr>
                        <td style="width:200px;text-align:left">
                           <%=Html.TextAreaFor(model => model.EventComment, new { Style = "width:400px;border:1px solid #B4C6DC;" })%>
                           <%=Html.ValidationMessageFor(model => model.EventComment)%>   
                           <div style="text-align:center;color:Gray;font-size:9px"><%=Html.Encode(ViewData["InvalidateUser"])%></div>
                         </td>
                    </tr>
                    <tr>
                        <td>
                          <%=Html.HiddenFor(model => model.CurrentEvent.EventID)%>
                        </td>
                        <td align="right">
                           <input id="Submit1" class="btn_user_update" type="submit" value="Gửi" />
                        </td>
                        
                    </tr>
                </table>
<%} %>
 </div>