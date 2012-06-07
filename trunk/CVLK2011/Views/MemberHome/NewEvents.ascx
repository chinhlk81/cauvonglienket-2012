<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MemberHomeListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<div>
        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="background:#F2F2F2;border-top:1px solid #BFBFBF;color:#000;font-weight:bold;height:23px;">
                            Sự kiện mới
                           
                        </td>
                        <td style="background:#F2F2F2;border-top:1px solid #BFBFBF;color:#000;font-weight:bold;height:23px;text-align:right;">
                           <a href="<%=Url.Action("EventList","Home")%>">xem tất cả</a></td>
                    </tr>
            
                </table>
                <br />
                <%= ViewData["MailMessage"] %>
        <table style="width: 100%;margin-bottom:10px;" cellpadding="0" cellspacing="0">
        <%if (Model != null)
          {
              if (Model.EventList != null)
              {
                  foreach (var item in Model.EventList)
                  {
               %>
                    <tr style="padding:10px">
                    <td style="width:100px">
                    
                    <img src="../../<%=item.EventImages %>" width="100px" height="80px" alt=""/>
                    </td>
                    <td style="padding:10px" class="name_title_link">
                    <a href="<%=Url.Action("EventDetails","Home",new { id=item.EventID })%>"><%=Html.Encode(item.EventName) %></a>
                        <div><%=Html.Encode(item.EventTime) %> 
                           Ngày <%if(item.EventDate.HasValue){ %>
                            <%=Html.Encode(item.EventDate.Value.ToString("dd/MM/yyyy")) %>
                            <%} %>
                         </div>
                     </td>
                    </tr>
                    <tr>
                    <td colspan="2" style="margin-right:10px;text-align:center">
                    <input type="button" style="width:80px" id="Join<%=item.EventID %>" value="Đăng ký" onclick="Show(<%=item.EventID %>)" />
                    </td>
                    </tr>
                    <tr>
                    <td colspan="2">
                <div id="dvPopup<%=item.EventID %>" style="width:280px;background:#f5fcfe;padding:10px; border:1px solid #ccc;visibility:collapse">
               <%using (Ajax.BeginForm("Join", "MemberHome", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "NewEventHolder" }))
                 {%>
                <table style="width:270px;text-align:left;">
                <tr>
                <td colspan="2"><%=Html.Hidden("EventName", item.EventName)%></td>
                </tr>
                <tr>
                <td  align="right" style="width:120px">
                Họ và tên
                </td>
                <td><%=Html.TextBox("txtName" + item.EventID, "", new { Style = "border:1px solid #bddbe4;margin-left:10px;width:150px" })%>
                </td>
                </tr>
                <tr>
                <td  align="right">
                    &nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvName<%=item.EventID %>" style="visibility:collapse">Nhập họ tên</div></td>
                </tr>
                <tr>
                <td style="width:120;" align="right">Điện thoại</td>
                <td><%=Html.TextBox("txtPhone" + item.EventID, "", new { Style = "border:1px solid #bddbe4;margin-left:10px;width:150px" })%>
                </td>
                </tr>
                <tr>
                <td style="width:120" align="right">&nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvPhone<%=item.EventID %>" style="visibility:collapse">Nhập số diện thoại</div></td>
                </tr>
                <tr>
                <td align="right">Email</td>
                <td><%=Html.TextBox("txtEmail" + item.EventID, "", new { Style = "border:1px solid #bddbe4;margin-left:10px;width:150px" })%>
                </td>
                </tr>
                <tr>
                <td align="right">&nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvEmail<%=item.EventID %>" style="visibility:collapse">Nhập địa chi Email</div></td>
                </tr>
                <tr>
                <td></td>
                <td>
                <input type="submit" style="width:50px"  name="submit" value="Gởi" onclick=" return CheckInput(<%=item.EventID %>)" />
                <input type="button" style="width:50px" name="cancel" value="Hủy" onclick=" Cancel(<%=item.EventID %>)" style="float:left"/>
                </td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                </tr>
                </table>
                
                <%} %>

           </div>
           <br />
                    </td>
                    </tr>
        <%}
              }
          } %>
       </table>
      
 </div>
<script src="../../Scripts/jquery.js" type="text/javascript"></script>
   <script type="text/javascript">
      
       function Show(id) {
           $('#dvPopup' + id).css('visibility', 'visible');
           $('#Join' + id).css('visibility', 'collapse');
       }
       function Cancel(id) {
           $('#dvPopup' + id).css('visibility', 'collapse');
           $('#Join' + id).css('visibility', 'visible');
       }
       function CheckInput(id) {
           var valid = true;
           if ($('#txtName' + id).val() == "") {

               $('#dvName' + id).css("visibility", "visible");
               valid = false;
           }
           else {
               $('#dvName' + id).css("visibility", "collapse");

           }

           if ($('#txtPhone' + id).val() == "") {
               $('#dvPhone' + id).css("visibility", "visible");
               valid = false;
           } else {
               $('#dvPhone' + id).css("visibility", "collapse");

           }

           if ($('#txtEmail' + id).val() == null) {
               $('#dvEmail' + id).css('visibility', 'visible');
               valid = false;
           } else {
               var emailSyntax = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
               var emailInput = $('#txtEmail' + id).val();
               if (emailSyntax.test(emailInput)) {
                   $('#dvEmail' + id).css('visibility', 'collapse');

               } else {
                   $('#dvEmail' + id).css('visibility', 'visible');
                   valid = false;
               }

               return valid;
           }
       }
    
    </script>