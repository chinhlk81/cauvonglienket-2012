<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.BlogDetailsViewModel>" %>
<div>
 <% using (Html.BeginForm("CreateComment", "MemberBlog", FormMethod.Post, new { enctype = "multipart/form-data" }))
    { %>
    
   <table style="width:400px;text-align:left">
                    <tr>
                        <td style="width:40px;text-align:right;">
                          
                        </td>
                        <td style="width:200px;text-align:left">
                           <%=Html.TextAreaFor(model => model.BlogComment, new { Style = "width:400px;border:1px solid #B4C6DC;" })%>
                           <%=Html.ValidationMessageFor(model=>model.BlogComment) %>   
                         </td>
                    </tr>
                    <tr>
                        <td>
                           <div style="visibility:collapse" >
                          <%=Html.TextBoxFor(model=>Model.CurrentBlog.BlogID)%>"</div>
                        </td>
                        <td align="right">
                           <input id="Submit1" class="btn_user_update" type="submit" value="Gửi" />
                        </td>
                        
                    </tr>
                </table>
<%} %>
 </div>