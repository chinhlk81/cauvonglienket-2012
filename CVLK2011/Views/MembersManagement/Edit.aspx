<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>
<%@ Import Namespace= "CVLK2011.Models" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thay đổi thông thành viên
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
  <h2 class="manager_title_detail">Cập nhật thông tin thành viên</h2>
</div>

    <script type="text/javascript">
            $(
                    function () {
                        $('#submit').click(CheckInputRegister);
                    }
                );

        function CheckInputRegister() {
            var valid = true;
            var email = $("#UserEmail").val();
            var id = $("#UserID").val();
            $.post("/MembersManagement/CheckEditEmail/", { email: email, id:id },
	                    function (data) {
	                        if (data == "True") {
	                            $('#dvEmail').css("visibility", "collapse");
	                            return true;
	                        }
	                        else {
	                            $('#dvEmail').css("visibility", "visible");
	                            return false;
	                        }
	                    });
            return valid;
        }
        function ConfirmActive() {
            if (confirm("Bạn chắc chắn Active?") == true) {
                return true;
            }
            else {
                return false;
            }

        }
        function ConfirmDeActive() {
            if (confirm("Bạn chắc chắn Deactivate?") == true) {
                return true;
            }
            else {
                return false;
            }

        }
    </script>
    
	    <script type="text/javascript">
	        $(document).ready(function () {
	            $("#UserEmail").focusout(CheckEmail);

	        });

	        
	        function CheckEmail() {
	            var id = $("#UserID").val();
	            var email = $("#UserEmail").val();
	            $.post("/MembersManagement/CheckEditEmail/", { email: email, id:id },
	                    function (data) {
	                        if (data == "True") {
	                            $('#dvEmail').css("visibility", "collapse");
	                            return true;
	                        }
	                        else {
	                            $('#dvEmail').css("visibility", "visible");
	                            return false;
	                        }
	                    });
	        }

	    </script>
  <%if (Model != null)
    { %>

    <div class="table_detail_admin" >
			
            <div>
                       <img alt="" src="../<%=Model.UserPicture %>" style="height: 114px; width: 154px" />
                       <a href="<%=Url.Action("UpdateAvatar","MembersManagement",new{id=Model.UserID,view="Edit"}) %>"> <img alt="Xoá" src="../../../Images/deleteIcon.gif"  onclick="return ConfirmUpdateAvatar()" /></a></div>
            <p>
			<b style="color:Red"><%=Html.Encode(ViewData["error"])%></b>
            </p>
            <p>
            <b><%=Html.Encode(ViewData["message"])%></b>
            </p>
            <div style="text-align:right">
            <%if (Session["Type"] != null)
              {
                  if (Session["Type"].ToString() == "Admin")
                  { %>
                  <a href="<% =Url.Action("ChangePassword",new{id=Model.UserID}) %>">Đổi mật khẩu</a>
             <%if (Model.UserStatus == "DeActivate")
               { %>
                      <a href="<% =Url.Action("ActiveUser",new{id=Model.UserID,view="Edit"}) %>"><img src="../../../Images/active.png" alt="Active" onclick="return ConfirmActive()"/></a>
                     
                     <%}
               else
               {%>
                     <a href="<% =Url.Action("DeactivateUser",new{id=Model.UserID,view="Edit"}) %>"><img src="../../../Images/deactive.png" alt="Deactivate" onclick="return ConfirmDeActive()"/></a>
                     <%}
                  }
              }%>
                     <a href="<%=Url.Action("Index", "MembersManagement")%>"><img src="../../../Images/admin_back.png" alt="Trở về" /></a>
                     </div>
                      
            <p style="text-align:right">Lưu ý: các thông tin có đánh dấu <span style="color:Red">*</span> là các thông tin bắt buộc.</p>
			<table class="table_list_admin" cellpadding = "0" cellspacing = "0">
                    <tr>
						<td align="right" >Tài khoản (<span>*</span>)</td>
						<td  valign="middle" >
                        
						<b>	<%=Html.Encode( Model.UserName)%></b>
                           
                        </td>
                        <td>
                         Trạng thái:
                    <%if (Model.UserStatus == CVLK2011.Models.Utilities.cstDeActivate)
                      {%>
                    <b style="color:#eb0d0d"><%=Html.Encode(Utilities.AliasDictionary[Model.UserStatus])%></b>
                    <%}
                      else
                      { %>
                     <b style="color:#1b47a2"><%=Html.Encode(Utilities.AliasDictionary[ Model.UserStatus])%></b>
                     <%} %>
                    <%if (Model.UserStatus == CVLK2011.Models.Utilities.cstNewStatus)
                      { %>
                        <img src="../../../Images/new.jpg" width="25px" height="25px" alt="" />
                    <%} %>
                    </td>
                    <td rowspan="2">
                    
                    <%if (Model.UserIsVIP == true)
                      { %>
                        Thành viên:
                        <b style="color:#eb0d0d">VIP</b>
                        <%}
                      else
                      {
                       %>
                       Cấp độ:    <b style="color:#1b47a2">Bình thường</b>
                       <%} %>
                    </td>
                       </tr>
                           <tr>
                           <td align="right">Thông tin VIP</td>
                           <td colspan="3">
                            <%using (Html.BeginForm("EditVIP", "MembersManagement", new { id = Model.UserID }, FormMethod.Post))
                              { %>
                           
                           
                            <div id="pop" style="visibility:visible">
                           <div>Số ngày còn lại</div>
                           <div><input type="text" value="<%=Model.VIPRemain %>" id="VIPRemain" readonly="readonly" style="width:250px"/></div>
                                <div id="dvValidate" style="visibility:collapse"><b style="color:Red">Kiểm tra dữ liệu nhập</b></div>
                                <div> Ngày thanh toán</div>
                                <div>
                                <%if (Model.UserDatePayment.HasValue)
                                  { %>
                                <input type="text" id="datepicker5" style="width:250px" name="PaymentDate" value="<%=Model.UserDatePayment.Value.ToShortDateString() %>"/>
                                <%}
                                  else
                                  { %>
                                <input type="text" id="datepicker1" style="width:250px" name="PaymentDate" value="<%=Model.UserDatePayment%>"/>
                                <%} %>
                                   
                                    
                                </div>
                                <div>
                                Thời hạn(ngày)</div>
                    
                    <div><%=Html.TextBoxFor(model => model.VIPPeriod, new { Style = "width:250px" })%>
                     
                     </div>
                     <div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input type="submit" value="Lưu" onclick="return CheckInputVIP()" style="width:70px" />
                                <input type="button" value="Xóa VIP" onclick="CancelVIP()" style="width:70px"/>
                     </div>
                     <%}
                    %>
                    

                     </div>
                     </td>
                     
                          
					</tr>
                    
                    <%using (Html.BeginForm("Edit", "MembersManagement",  FormMethod.Post, new { entype = "multipar/form-data" }))
                     { %>
  
                    <tr>
						<td align="right" >Họ tên bạn (<span>*</span>)</td>
						<td colspan="3" valign="middle">
                        <%= Html.HiddenFor(model => model.UserID)%>
							<%=Html.TextBoxFor(model => model.UserFullName, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserFullName)%>
                            
						</td>
					</tr>
					<tr>
						<td align="right" >Địa chỉ email (<span >*</span>)</td>
						<td valign="middle" colspan="2"><div id="err_txt_email" style=" display : none;">Vui lòng điền địa chỉ email đúng định dạng (ví dụ: infor@vnecom.com).</div>
                        <%=Html.TextBoxFor(model => model.UserEmail, new { Style = "width:250px" , focusout = "return CheckEmail()" })%> 
                        <%=Html.ValidationMessageFor(model => model.UserEmail)%>
                        
                        </td>
                        <td valign="middle" align="left">
                        <div id="dvEmail" style="visibility:hidden"> Email đã có người dùng</div>
                        </td>
					</tr>
					<tr>
						<td align="right" >Địa chỉ (<span >*</span>)</td>
						<td colspan="3" valign="middle"><div id="err_txt_address" style="display: none;">Vui lòng điền địa chỉ của bạn.</div>
							<%=Html.TextBoxFor(model => model.UserAddLine, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserAddLine)%>
                            </td>
            								
					</tr>
					<tr>
						<td align="right"></td>
						<td valign="middle" colspan="3">             
                           <%=Html.DropDownList("UserAddCity")%>           
                                <%=Html.ValidationMessageFor(model => model.UserAddCity)%>
                        </td>
					</tr>
					<tr>
						<td align="right" >Số CMND hoặc số an sinh (<span >*</span>)</td>
						<td colspan="3" valign="middle">
							<div id="err_txt_id_number_new" style="display: none;">Bạn phải nhập số CMND của mình chính xác (9 chữ số)</div>
								<%=Html.TextBoxFor(model => model.UserIDCard, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserIDCard)%>
						</td>
					</tr>
					<tr>
						<td align="right" >Điện thoại liên lạc (<span >*</span>)</td>
						<td colspan="3" valign="middle"><div id="err_txt_phone" style="display: none;">Hãy nhập số điện thoại để chúng tôi có thể liên lạc với bạn.</div>
							<%=Html.TextBoxFor(model => model.UserPhone, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserPhone)%>
						</td>
					</tr>
			        <tr>
				        <td align="right" >Ngày sinh: (<span >*</span>)</td>
				        <td colspan="3" valign="middle">
                            <%: Html.DropDownList("UserBirthdayDD", new[] {
                    new SelectListItem{Text="1",Value="1"},
                    new SelectListItem{Text="2",Value="2"},
                    new SelectListItem{Text="3",Value="3"},
                    new SelectListItem{Text="4",Value="4"},
                    new SelectListItem{Text="5",Value="5"},
                    new SelectListItem{Text="6",Value="6"},
                    new SelectListItem{Text="7",Value="7"},
                    new SelectListItem{Text="8",Value="8"},
                    new SelectListItem{Text="9",Value="9"},
                    new SelectListItem{Text="10",Value="10"},
                    new SelectListItem{Text="11",Value="11"},
                    new SelectListItem{Text="12",Value="12"},
                    new SelectListItem{Text="13",Value="13"},
                    new SelectListItem{Text="14",Value="14"},
                    new SelectListItem{Text="15",Value="15"},
                    new SelectListItem{Text="16",Value="16"},
                    new SelectListItem{Text="17",Value="17"},
                    new SelectListItem{Text="18",Value="18"},
                    new SelectListItem{Text="19",Value="19"},
                    new SelectListItem{Text="20",Value="20"},
                    new SelectListItem{Text="21",Value="21"},
                    new SelectListItem{Text="22",Value="22"},
                    new SelectListItem{Text="23",Value="23"},
                    new SelectListItem{Text="24",Value="24"},
                    new SelectListItem{Text="25",Value="25"},
                    new SelectListItem{Text="26",Value="26"},
                    new SelectListItem{Text="27",Value="27"},
                    new SelectListItem{Text="28",Value="28"},
                    new SelectListItem{Text="29",Value="29"},
                    new SelectListItem{Text="30",Value="30"},
                    new SelectListItem{Text="31",Value="31"},
                    }, "--Ngày--")%>
					/
                    <%: Html.DropDownList("UserBirthdayMM", new[] {
                    new SelectListItem{Text="1",Value="1"},
                    new SelectListItem{Text="2",Value="2"},
                    new SelectListItem{Text="3",Value="3"},
                    new SelectListItem{Text="4",Value="4"},
                    new SelectListItem{Text="5",Value="5"},
                    new SelectListItem{Text="6",Value="6"},
                    new SelectListItem{Text="7",Value="7"},
                    new SelectListItem{Text="8",Value="8"},
                    new SelectListItem{Text="9",Value="9"},
                    new SelectListItem{Text="10",Value="10"},
                    new SelectListItem{Text="11",Value="11"},
                    new SelectListItem{Text="12",Value="12"},
                    }, "--Tháng--")%>
					/
                    <%: Html.DropDownList("UserBirthdayYYYY", new[] {
                    new SelectListItem{Text="1993",Value="1993"},
                    new SelectListItem{Text="1992",Value="1992"},
                    new SelectListItem{Text="1991",Value="1991"},
                    new SelectListItem{Text="1990",Value="1990"},
                    new SelectListItem{Text="1989",Value="1989"},
                    new SelectListItem{Text="1988",Value="1988"},
                    new SelectListItem{Text="1987",Value="1987"},
                    new SelectListItem{Text="1986",Value="1986"},
                    new SelectListItem{Text="1985",Value="1985"},
                    new SelectListItem{Text="1984",Value="1984"},
                    new SelectListItem{Text="1983",Value="1983"},
                    new SelectListItem{Text="1982",Value="1982"},
                    new SelectListItem{Text="1981",Value="1981"},
                    new SelectListItem{Text="1980",Value="1980"},
                    new SelectListItem{Text="1979",Value="1979"},
                    new SelectListItem{Text="1978",Value="1978"},
                    new SelectListItem{Text="1977",Value="1977"},
                    new SelectListItem{Text="1976",Value="1976"},
                    new SelectListItem{Text="1975",Value="1975"},
                    new SelectListItem{Text="1974",Value="1974"},
                    new SelectListItem{Text="1973",Value="1973"},
                    new SelectListItem{Text="1972",Value="1972"},
                    new SelectListItem{Text="1971",Value="1971"},
                    new SelectListItem{Text="1970",Value="1970"},
                    new SelectListItem{Text="1969",Value="1969"},
                    new SelectListItem{Text="1968",Value="1968"},
                    new SelectListItem{Text="1967",Value="1967"},
                    new SelectListItem{Text="1966",Value="1966"},
                    new SelectListItem{Text="1965",Value="1965"},
                    new SelectListItem{Text="1964",Value="1964"},
                    new SelectListItem{Text="1963",Value="1963"},
                    new SelectListItem{Text="1962",Value="1962"},
                    new SelectListItem{Text="1961",Value="1961"},
                    new SelectListItem{Text="1960",Value="1960"},
                    new SelectListItem{Text="1959",Value="1959"},
                    new SelectListItem{Text="1958",Value="1958"},
                    new SelectListItem{Text="1957",Value="1957"},
                    new SelectListItem{Text="1956",Value="1956"},
                    new SelectListItem{Text="1955",Value="1955"},
                    new SelectListItem{Text="1954",Value="1954"},
                    new SelectListItem{Text="1953",Value="1953"},
                    new SelectListItem{Text="1952",Value="1952"},
                    new SelectListItem{Text="1951",Value="1951"},
                    new SelectListItem{Text="1950",Value="1950"},
                    new SelectListItem{Text="1949",Value="1949"},
                    new SelectListItem{Text="1948",Value="1948"},
                    new SelectListItem{Text="1947",Value="1947"},
                    new SelectListItem{Text="1946",Value="1946"},
                    new SelectListItem{Text="1945",Value="1945"},
                    }, "--Năm--")%>
                        </td>
					</tr>
					<tr>
						<td align="right" >Giới tính (<span >*</span>)</td>
						<td valign="middle" colspan="3">
                            <%: Html.DropDownList("UserGender", new[] {
                                                new SelectListItem{Text="Nam",Value="Male"},
                                                new SelectListItem{Text="Nữ",Value="Female"}
                                                }, "Chọn giới tính", new { Style = "width:250px" })%> 
                    <%=Html.ValidationMessageFor(model => model.UserGender)%>                   
                        </td>
					</tr>
                    <tr>
                    <td align="right">Tham gia (<span >*</span>)</td>
                    <td valign="middle" colspan="3">
                       <%=Html.DropDownList("eventParents", ViewData["EventParents"] as SelectList, new { Style = "width:250px" })%> 
                       <%=Html.ValidationMessageFor(model => model.UserEventParentID)%>
                    </td>
                    </tr>
                    <tr>
                    <td align="right">Loại</td>
                    <td valign="middle" colspan="3">
                    <%=Html.DropDownList("userType", new[] {
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNone], Value=Utilities.cstUserTypeNone},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUSerTypeReview], Value=Utilities.cstUSerTypeReview},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeCouples], Value=Utilities.cstUserTypeCouples},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypePerfectCouple], Value=Utilities.cstUserTypePerfectCouple},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeWaitngAppointment], Value=Utilities.cstUserTypeWaitngAppointment},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeWaitingReply], Value=Utilities.cstUserTypeWaitingReply},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeOther], Value=Utilities.cstUserTypeOther},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNoContacted], Value=Utilities.cstUserTypeNoContacted},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeMet], Value=Utilities.cstUserTypeMet},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypePotential], Value=Utilities.cstUserTypePotential},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNoSerious], Value=Utilities.cstUserTypeNoSerious},
                            },new { Style = "width:250px" })%> 
                    </td>
                    
                    </tr>
					<tr>
						<td align="right" >Muốn tìm </td>
						<td valign="middle" colspan="3">
                            <%: Html.DropDownList("UserLookingObj", new[] {
                            new SelectListItem{Text="Bạn khác phái",Value="Bạn khác phái"},
                            new SelectListItem{Text="Bạn cùng phái",Value="Bạn cùng phái"}
                            }, "Chọn đối tượng", new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserLookingObj)%>
                        </td>
					</tr>
                    <tr>
						<td align="right"  colspan="4"></td>
					</tr>
					<tr>
						<td align="right" >Chiều cao</td>
						<td valign="middle" colspan="3"><div id="err_txt_height" style="display: none;">Bạn phải điền chiều cao của mình.</div>
                            <%=Html.TextBoxFor(model => model.UserHeight, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserHeight)%>
							    .cm (1m = 100cm)
                            </td>
					</tr>
					<tr>
						<td align="right" >Cân nặng</td>
						<td valign="middle" colspan="3"><div id="err_txt_weight" style="display: none;">Bạn phải điền cân nặng của mình.</div>
                        <%=Html.TextBoxFor(model => model.UserWeight, new { Style = "width:250px" })%> 
                        <%=Html.ValidationMessageFor(model => model.UserWeight)%>
                            .kg </td>
					</tr>
                    <tr>
						<td align="right"  colspan="4"></td>
					</tr>
						<tr>
							<td align="right" >Trình độ văn hóa (<span >*</span>)</td>
							<td valign="middle" colspan="3">
                                <%: Html.DropDownList("UserLevel", new[] {
                                    new SelectListItem{Text="Dưới PTTH",Value="Dưới PTTH"},
                                    new SelectListItem{Text="PTTH",Value="PTTH"},
                                    new SelectListItem{Text="Trung học chuyên nghiệp/Cao đẳng",Value="Trung học chuyên nghiệp/Cao đẳng"},
                                    new SelectListItem{Text="Đại học",Value="Đại học"},
                                    new SelectListItem{Text="Cao học",Value="Cao học"},
                                    new SelectListItem{Text="Tiến sĩ",Value="Tiến sĩ"},
                                    new SelectListItem{Text="Khác",Value="Khác"}
                                    }, "Chọn trình độ", new { Style = "width:250px" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserLevel)%>                                                     
                            </td>
						</tr>
						<tr>
							<td align="right" >Tình trạng hôn nhân (<span >*</span>)</td>
							<td valign="middle" colspan="3">                  
                                <%: Html.DropDownList("UserMaritalStatus", new[] {
                                new SelectListItem{Text="Chưa kết hôn",Value="Chưa kết hôn"},
                                new SelectListItem{Text="Đã kết hôn",Value="Đã kết hôn"},
                                new SelectListItem{ Text="Đã ly hôn", Value="Đã ly hôn"},
                                new SelectListItem{ Text="Góa vợ/Góa Chồng",Value= "Góa vợ/Góa Chồng"},
                                }, "Chọn", new { Style = "width:250px" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserMaritalStatus)%>                                         
                                </td>
						</tr>
						<tr>
							<td align="right" >Tôn giáo</td>
							<td valign="middle" colspan="2">                  
                                <%: Html.DropDownList("UserReligion", new[] {
                                new SelectListItem{Text="Không",Value="Không"},
                                new SelectListItem{Text="Phật giáo",Value="Phật giáo"},
                                new SelectListItem{Text="Thiên chúa",Value="Thiên chúa"},
                                new SelectListItem{Text="Tin lành",Value="Tin lành"},
                                new SelectListItem{Text="Tôn giáo khác",Value="Tôn giáo khác"}
                                }, "Chọn", new { Style = "width:250px" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserReligion)%> 
                                </td>
						</tr>
						<tr>
							<td align="right" >Nghề nghiệp</td>
							<td valign="middle" colspan="2">
								                
                                <%=Html.DropDownList("UserCareer")%>
                                <%=Html.ValidationMessageFor(model => model.UserCareer)%>  
                                              
                            </td>
							<td valign="middle">&nbsp;</td>
						</tr>
						<tr>
							<td align="right" >Vị trí công việc (<span >*</span>)</td>
							<td valign="middle" colspan="3"><div id="err_txt_position" style="display: none;">Bạn phải điền vị trí công việc hiện tại.</div>
                            <%=Html.TextBoxFor(model => model.UserJobPosition, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserJobPosition)%>
                            </td>
						</tr>
						<tr>
							<td align="right" >Mức lương hiện tại (<span >*</span>)</td>
							<td valign="middle" colspan="3">
                            <div id="err_txt_incoming" style="display: none;">Hãy bổ sung mức lương hiện tại của mình.</div>
                            <%=Html.TextBoxFor(model => model.UserWage, new { Style = "width:250px" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserWage)%>  
								/tháng</td>
						</tr>
						<tr>
							<td align="right" >Thời gian làm việc (<span >*</span>)</td>
							<td valign="middle" colspan="3">
                            <div id="err_txt_time_of_current_position" style="display: none;">Hãy bổ sung thời gian tại vị trí hiện tại.</div>
                            <%=Html.TextBoxFor(model => model.UserWorkingTime, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserWorkingTime)%> 
                            </td>
						</tr>
						
                        <tr>
							    <td align="right" >Thời gian liên hệ với bạn tốt nhất?</td>
							    <td colspan="2">  
                                    <%: Html.DropDownList("UserTimeContact", new[] {
                                    new SelectListItem{Text="Bất kỳ lúc nào",Value="Bất kỳ lúc nào"},
                                    new SelectListItem{Text="Buổi sáng",Value="Buổi sáng"},
                                    new SelectListItem{Text="Buổi trưa",Value="Buổi trưa"},
                                    new SelectListItem{Text="Buổi chiều",Value="Buổi chiều"},
                                    new SelectListItem{Text="Buổi tối",Value="Buổi tối"}
                                    }, "Chọn", new { Style = "width:250px" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserTimeContact)%>                           
                                    </td>
							    <td >&nbsp;</td>
						    </tr>
                        <tr>
						    <td align="right"  colspan="4"></td>
					    </tr>
						<tr>
							<td valign="middle" align="right" >Màu sắc bạn thích ? (<span >*</span>)</td>
							<td valign="middle" colspan="3"><div id="err_txt_fav_color" style="display: none;">Hãy điền các màu sắc bạn yêu thích.</div>
                            <%=Html.TextAreaFor(model => model.UserFavColor, new { Style = "width:450px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserFavColor)%>
                            </td>
						</tr>
						<tr>
							<td valign="middle" align="right" >Thức ăn yêu thích của bạn ? (<span >*</span>)</td>
							<td valign="middle" colspan="3"><div id="err_txt_fav_food" style="display: none;">Hãy điền thức ăn bạn yêu thích.</div>
                                <%=Html.TextAreaFor(model => model.UserFavFoods, new { Style = "width:450px" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserFavFoods)%></td>
						</tr>
					<tr>
						<td valign="middle" align="right" >Loại sách bạn thích đọc ? (<span >*</span>)</td>
						<td valign="middle" colspan="3">
                            <div id="err_txt_fav_book" style="display: none;">Hãy điền tiêu đề các sách yêu thích của bạn.</div>
                            <%=Html.TextAreaFor(model => model.UserReadingBook, new { Style = "width:450px" })%> 
                        <%=Html.ValidationMessageFor(model => model.UserReadingBook)%></td>
					</tr>
					<tr>
						<td valign="middle" align="right" >Thú cưng yêu thích của bạn ? (<span >*</span>)</td>
						<td valign="middle" colspan="3">
                        <div id="err_txt_fav_animal" style="display: none;">Hãy điền các thú cưng yêu thích của bạn.</div>
                            <%=Html.TextAreaFor(model => model.UserFavPet, new { Style = "width:450px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserFavPet)%>
                            </td>
					</tr>
					<tr>
						<td valign="middle" align="right" >Mẫu người bạn thích, tại sao? (<span >*</span>)</td>
						<td valign="middle" colspan="3"><div id="err_txt_why_love" style="display: none;">Hãy cho chúng tôi biết mẫu người bạn thích và tại sao.</div>
                            <%=Html.TextAreaFor(model => model.UserPeopleLike, new { Style = "width:450px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserPeopleLike)%></td>
					</tr>
							
					<tr>
						<td valign="middle" align="right" >Mẫu người bạn ghét, tại sao? (<span >*</span>)</td>
						<td valign="middle" colspan="3"><div id="err_txt_why_hate" style="display: none;">Hãy cho chúng tôi biết mẫu người bạn không thích và tại sao.</div>
                            <%=Html.TextAreaFor(model => model.UserPeopleDislike, new { Style = "width:450px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserPeopleDislike)%>
                            </td>
					</tr>
					<tr>
						<td valign="middle" align="right" >Sở thích riêng của bạn  ?(<span >*</span>)</td>
						<td valign="middle" colspan="3"><div id="err_txt_hobbies" style="display: none;">Hãy điền sở thích cá nhân của bạn</div>
                            <%=Html.TextAreaFor(model => model.UserHobby, new { Style = "width:450px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserHobby)%>
                            </td>
					</tr>
					<tr>
						<td  align="right" >Bạn hi vọng điều gì từ chương trình này ? (<span >*</span>)</td>
						<td valign="middle" colspan="3"><div id="err_txt_accomplish" style="display: none;">Mong muốn của bạn khi tham gia chương trình là gì.</div>
                            <%=Html.TextAreaFor(model => model.UserHope, new { Style = "width:450px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserHope)%></td>
					</tr>
							
					<tr>
						<td valign="middle" align="right" >Đối tượng bạn thích làm quen? (<span >*</span>)</td>
						<td valign="middle" colspan="3"><div id="err_txt_type_person" style="display: none;">Hãy điển mẫu người bạn thích.</div>
                            <%=Html.TextAreaFor(model => model.UserOjbLikeDating, new { Style = "width:450px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserOjbLikeDating)%>
                            </td>
					</tr>
					<tr>
						<td valign="top" align="right" >Yêu cầu riêng cho đối tượng? (<span >*</span>)</td>
						<td valign="top" colspan="3"><div id="err_txt_special_recomendation" style="display: none;">Hãy điền các yêu cầu về đối tượng bạn mong muốn.</div>
                            <%=Html.TextAreaFor(model => model.UserRequirements, new { Style = "width:450px"})%> 
                            <%=Html.ValidationMessageFor(model => model.UserRequirements)%></td>
					</tr>
							
                    <tr>
                    <td valign="top" align="right" >Ghi chú</td>
                    <td valign="top" colspan="3">
                    <%=Html.TextAreaFor(model => model.UserDescriptions, new { Style = "width:450px;Height:450px" })%>
                    </td>
                    </tr>
					<tr>
								<td align="center" colspan="4">
								    <input  id="button" class="btn_dangky_home" value="Lưu" type="submit" name="submit" onclick="return CheckInputRegister()"/>
                                    <input name="button1" id="Reset1"  class="btn_dangky_home" value="Hủy" type="reset"/>
                                </td>
							</tr>
						<%} %>
                     <%if (Model.UserIsVIP)
              { %>
                         <tr>
            <td style="width: 233px" align="right">Video</td>
            
            <td>
            <%if (!String.IsNullOrEmpty(Model.UserVideoUpload))
              { %>
              
                <%= Html.FlashPlayerEmbed(ResolveClientUrl("~/Content/Flash/Player.swf"), "", 400, 300,
                                    new { flashvars = "file=" + Model.UserVideoUpload.ToString() + "&autostart=false", allowscriptaccess = "always", allowfullscreen = "true" })%>                           


            
            <div class="ui-widget"> 
                <% using (Ajax.BeginForm("ShowVideoOnUserDetails", new { id = Model.UserID,view="Edit" }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "videoUser" }))
                   {%>        
                <%--<input type="submit" value="Xem Video" />--%>
                <%=Html.ActionLink("Quản lý Video", "Index","VideoShareManagement")%>&nbsp;|&nbsp;
                <%=Html.ActionLink("Xóa Video", "DeleteVideoByUser", new { usId = Model.UserID,view="Edit" })%>
                <%} %>   
                <br />
                <br />   
                <div id="videoUser">
                </div> 
                <br />
                </div>
                
            </td><%} %>
           
            <% using (Html.BeginForm("ProcessUploadVideo", "MembersManagement", new { id = Model.UserID,view="Edit" }, FormMethod.Post, new { enctype = "multipart/form-data" }))
               {%>
            <td style="height:300px" colspan="2">
             <input type="file" name='videoUpload' id='video'/>
             <input id="btAdd" type="submit"  value="Up Video" onclick="return CheckInput()"/>
             <div id="Div2" style="visibility:visible"> Chọn video trước khi tải lên. Chỉ hỗ trợ video định dạng FLV.</div>
                <%=ViewData["UploadMessage"]%>
                <div id="loading" style="visibility:collapse">
                    <div style="vertical-align:text-bottom">
                    <img src="../../../Images/ajax_loader.gif" alt="loading..."/>
                    </div>
                    <div style="vertical-align:text-top">
                    <b style="margin-left:5px">Đang tải video. Vui lòng đợi trong giây lát!</b>
                    </div>
                    </div>
            </td>
             <%
                }
              }%>
            </tr>
			    </table>
			
    </div>
<%
    }%>
<div class="footer_menu">
    <img alt="" src="../../Images/content_bottom.png" border="0"  />
</div>
  <script type="text/javascript">

      function CheckInput() {
          var valid = true;
          if ($('#video').val().toString() == '') {
              return false;
          }  else {
             
             $("#loading").css("visibility","visible");
             }
      }
      function ConfirmUpdateAvatar() {
          if (confirm("Bạn chắc chắn xoá và cập nhật avatar mặc định?") == true) {
              return true;
          }
          else {
              return false;
          }
      }
      function ShowUpGrade() {
          
          $("#pop").css("visibility", "visible");
          $("#UpgradeVIP").css("visibility", "collapse");
      }
      function ShowEditVip() {
          
          $("#pop1").css("visibility", "visible");
          
      }
      function HiddenPop() {
          try {
              
          $("#pop").css("visibility", "collapse");
          $("#UpgradeVIP").css("visibility", "visible");
          $("#dvValidate").css("visibility", "collapse");
          }catch(error) {
          
           $("#pop1").css("visibility", "collapse");
          }
   }
  
       function CancelVIP() {
           var id = $("#UserID").val();
           var view = "Edit";
           if (confirm("Bạn chắc chắn hủy VIP?") == true) {

               $.post("/MembersManagement/CancelVIP/", { id: id, view: view });
               $("#VIPPeriod").val("");
               $("#datepicker5").val("");
               $("#VIPRemain").val("");
               document.location.href = document.location;

           }
       }
   function CheckInputVIP() {
       
       try{
          var dt = document.getElementById("datepicker1").value;
          var period = $("#VIPPeriod").val();
          var nub = Number(period);
          
          
          if (dt == "" || period == 0) {
              $("#dvValidate").css("visibility", "visible");
              return false;
          }
          else {
              $("#dvValidate").css("visibility", "collapse");
              return true;
          }
          }catch(Error)
          {
           var dt = document.getElementById("datepicker5").value;
          var period = $("#VIPPeriod").val();
          var nub = Number(period);
          
          
          if (dt == "" || period == 0) {
              $("#dvValidate").css("visibility", "visible");
              return false;
          }
          else {
              $("#dvValidate").css("visibility", "collapse");
              return true;
          }
          }

      }
    </script>	
     <script src="../../../Scripts/jquery.ui.datepicker.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.ui.core.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#datepicker5").datepicker();
            $("#datepicker1").datepicker();
        });
        </script>
</asp:Content>


