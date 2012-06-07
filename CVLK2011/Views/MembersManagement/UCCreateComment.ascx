<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.Comment>" %>

                <br />
<div>
 <% using (Html.BeginForm("CreateComment", "MembersManagement", new{ entype="multipart/form-data" }))
    { %>
     
   <table class="table_detail_admin">
                    <tr>
                    <td colspan="2" align="center">
                    <b><%=ViewData["commentMessage"]%></b>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="2">
                    Sự kiện <%=Html.RadioButton("comment", "Event", true, new { onclick = "ShowHideRow('event')" })%>
                    Blog:<%=Html.RadioButton("comment", "Blog", false, new { onclick = "ShowHideRow('blog')" })%>
                    Tổng hợp:<%=Html.RadioButton("comment", "General", false, new { onclick = "ShowHideRow('general')" })%>
                    </td>
                    </tr>
                   <tr  id="trEvent" style="visibility:visible">
                   <td>Sự kiện </td>
                   <td >
                   <%=Html.DropDownList("events", ViewData["Events"] as SelectList)%>
                   </td>
                   </tr>
                   <tr id="trBlog" style="visibility:collapse">
                   <td>Theo Blog</td>
                   <td><%=Html.DropDownList("blogs", ViewData["Blogs"] as SelectList)%></td>
                   </tr>
                    <tr>
                    <td>Nội dung</td>
                        <td >
                         <%= Html.TextArea("FckEditor1", "", new { @name = "FckEditor1", @id = "CommentContent", Style = "visibility:hidden" })%>
        
                           <%--<%=Html.TextArea(model => model.CommentContent, new { Style = "width:400px;border:1px solid #B4C6DC;height:200px" })%>--%>
                           <%=Html.ValidationMessageFor(model => model.CommentContent)%>   
                           <div id="dvcontent" style="text-align:left;color:Gray;font-size:14px;visibility:collapse">Vui lòng nhập nội dung bình luận!</div>
                         </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="left">
                           <input id="Submit" class="btn_user_update" type="submit" value="Gửi" onclick="return checkInputComment()" />
                        </td>
                        
                    </tr>
                </table>
<%} %>
 </div>