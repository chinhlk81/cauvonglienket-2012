<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.EventsListViewModel>" %>

 
<div id="sukiennoibat">

        <div class="index_title">
           Sự kiện nổi bật
        </div>
       

        <div class="sukiennoibat_list">        
           
      <%if (Model != null)
          { %>
        <%foreach (var item in Model.Products)
          { %>
        <hr  class="sukiennoibat_hr"  />
        
        <div class="sukiennoibat_list">        
            <table style="width:100%;">
                <tr>
                    <td rowspan="5" style="width:290px">
                        <img alt="" src="<%=item.EventImages %>" width="240px" height="160px";/></td>
                    <td style="width:90px">
                        Chủ đề</td>
                    <td style="color:#ff0012;width:420px;" colspan="2">
                    <a href="<%=Url.Action("EventDetails",new { id = item.EventID }) %>"> <%=Html.Encode(item.EventName)%></a>
                        </td>
                </tr>
                <tr>
                    <td>
                        Địa điểm</td>
                    <td colspan="2">
                       <%=Html.Encode(item.EventLocation) %></td>
                </tr>
                <tr>
                    <td >
                        Thời gian</td>
                    <td style="color:#2a3c98" colspan="2">
                       <%=Html.Encode(item.EventTime) %> Ngày
                             <%=Html.Encode(item.EventDate.ToString("dd/MM/yyyy"))%>
                       </td>
                </tr>
                <tr>
                    <td>
                        Độ tuổi</td>
                    <td colspan="2">
                        <%=Html.Encode(item.EventAgeJoint) %></td>
                </tr>
                <tr>
                <td>Nội dung </td>
                <td style="height: 11px" colspan="2">
                 <%if (item.EventContent.Length > 200)
                      { %>
                       
                    <%= item.EventContent.Remove(200)%>...
                    <%}
                      else
                      { %>
                       <%=item.EventContent%>
                    <%} %> 
               </td>
                </tr>
                <tr>
                    <td colspan="2" style="height:40px;vertical-align:bottom" >
                        </td>
                    <td>
                      <input type="button" class="btn_dangky_home" id="Join<%=item.EventID %>" value="Đăng ký tham gia" onclick="Show(<%=item.EventID %>)" /> </td>
                    <td>
                        </td>
                    <td style="width:80px;text-align:right;font-size:12px">
                        <%: Html.ActionLink("Chi tiết", "EventDetails", new { id = item.EventID })%>
                      </td>
                </tr>
                <tr>
                    <td colspan="3" style="vertical-align:bottom;text-align:center" >
                        <div id="dvPopup<%=item.EventID %>" style="width:300px;background:#f5fcfe;padding:10px; border:1px solid #ccc;visibility:collapse">
               <%using (Html.BeginForm("Join", "Home", FormMethod.Post))
                  {%>
                <table style="width:300px;text-align:left;">
                <tr>
                <td colspan="2"><%=Html.Hidden("EventName",item.EventName) %></td>
                </tr>
                <tr>
                <td  align="right">
                Họ và tên
                </td>
                <td><%=Html.TextBox("txtName" + item.EventID, "", new { Style = "border:1px solid #bddbe4;margin-left:10px" })%>
                </td>
                </tr>
                <tr>
                <td  align="right">
                    &nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvName<%=item.EventID %>" style="visibility:collapse">Nhập họ tên</div></td>
                </tr>
                <tr>
                <td style="width:120;" align="right">Số điện thoại</td>
                <td><%=Html.TextBox("txtPhone" + item.EventID, "", new { Style = "border:1px solid #bddbe4;margin-left:10px;" })%>
                </td>
                </tr>
                <tr>
                <td style="width:120" align="right">&nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvPhone<%=item.EventID %>" style="visibility:collapse">Nhập số diện thoại</div></td>
                </tr>
                <tr>
                <td align="right">Email</td>
                <td><%=Html.TextBox("txtEmail" + item.EventID, "", new { Style = "border:1px solid #bddbe4;margin-left:10px" })%>
                </td>
                </tr>
                <tr>
                <td align="right">&nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvEmail<%=item.EventID %>" style="visibility:collapse">Nhập địa chi Email</div></td>
                </tr>
                <tr>
                <td></td>
                <td>
               <div> <input type="submit" class="btn_user_update" name="submit" value="Đăng ký" onclick=" return CheckInput(<%=item.EventID %>)" style="float:left" />
                <input type="button" class="btn_user_update" name="cancel" value="Hủy" onclick=" Cancel(<%=item.EventID %>)" style="float:left"/></div>
                </td>
                </tr>
                </table>
                <%} %>

           </div>
           </td>
                    <td>
                        &nbsp;</td>
                    <td style="width:80px;text-align:right;font-size:12px">
                        &nbsp;</td>
                </tr>
                <tr><td>
                  
           </td></tr>
            </table>
            
            
            
        
        </div>
        
        <%}
          } %>
        <hr  class="sukiennoibat_hr"  />
      
    </div>

    </div>

    <script type="text/javascript">
        function Cancel(id) {
            $('#dvPopup' + id).css('visibility', 'collapse');
            $('#Join' + id).css('visibility', 'visible');
        }
        function Show(id) {
            $('#dvPopup' + id).css('visibility', 'visible');
            $('#Join' + id).css('visibility', 'collapse');
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