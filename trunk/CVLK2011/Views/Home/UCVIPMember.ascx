<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

 <div class="title_menu">
    
    Khu vực VIP member

    </div>

        



    <table style="width: 90%;text-align:left;font-size:12px;color:#000;font-weight:bold">
        <tr>
            <td>
               - Cập nhật 2 video clip/3 tuần của thành viên khác phái</td>
        </tr>
        <tr>
            <td>
               - Free 1 vé show “5 Phút Hẹn Hò” trong tháng VIP đó</td>
        </tr>
        <tr>
            <td>
              - Ưu Tiên thông báo có sự kiện mới qua Email</td>
        </tr>
        <tr>
            <td>
               - Hổ trợ quay Video clip cho thành viên VIP này tại công ty nếu thành viên yêu cầu</td>
        </tr>
          <tr>
            <td>
               - Có thể biết được tất cả thông tin thành viên khác phái (Tối đa 5 thông tin/ 1 tháng VIP)</td>
        </tr>
         </table>
    <br />
    
    <%using (Ajax.BeginForm("VIPMember", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "VIPMember" }))
      {%>
                        <div style="text-align:center"><b><%=Html.Encode(ViewData["MailMessage"])%></b></div>
                        <br />
						<table border="0" cellpadding="0" cellspacing="0" width="450px" >
                        
						  <tbody>
                          <tr>
                          
							    <td align="right" valign="top" width="150">Họ và tên bạn (*):</td>
							    <td width="300">
                                <div>    <%=Html.TextBox("txtName", "", new { style = "width: 250px" })%></div>
                                <div id="dvName" style="Visibility:collapse;color:Red">Vui lòng nhập tên của bạn</div></td>
                                
						  </tr>
						  <tr>
							<td align="right" valign="top">Địa chỉ email (*):</td>
                            <td valign="middle">
                            <div><%=Html.TextBox("txtEmail", "", new { style = "width: 250px" })%>
                            </div>
                            <div id="dvEmail" style="visibility:collapse;color:Red">
                                                                          Vui lòng nhập Email của bạn.
                                                                          Bạn chưa đăng ký thành viên<br />
                                                                          <a href="<%=Url.Action("Register","Home")%>"> Bấm vài đây để đăng ký</a> </div></td>
						  </tr>
						  <tr>
							<td align="right" valign="top">Số điện thoại:</td>
							<td>
                           <div> <%=Html.TextBox("txtPhone", "", new { style = "width: 250px" })%></div>
							<div id="Div1" style="Visibility:collapse;color:Red">Vui lòng nhập sổ điện thoại của bạn</div>
                            </td>

						  </tr>

						  <tr>
							<td align="right">Thông tin :</td>
							<td>
                            <div>  <%=Html.TextArea("txtaContent", "", new { style = "width: 250px" })%></div>
							
                            <div id="dvContent" style="Visibility:collapse;color:Red">Vui lòng nhập nội dung liên lạc</div></td>
						  </tr>

						   <tr>

							<td align="right" valign="middle"></td>
							<td>
							 <input name="submit" id="button" class="btn_dangky_home" value="Đăng ký" type="submit" onclick="return CheckInput()"/>
							 <input name="txt_hid" value="0" type="hidden"/>

							</td>
						  </tr>

						</tbody></table>
				  <%} %>
  