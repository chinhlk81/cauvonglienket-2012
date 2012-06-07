<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Đăng ký thành viên
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <h2 class="manager_title_detail">
  Đăng ký thành viên
</h2>

    <script type="text/javascript">
//    $(
//            function () {
//                $('#submit').click(CheckInput);
//            }
//        );
            $(function () 
            { $('#Password').focusout(MinLenght) });

           
           
    function MinLenght() {
        if ($('#Password').val().toString()) {
            if ($('#Password').val().length < 6) {
                $('#minlenght').css("visibility", "visible");
                return false;
            } else {
                $('#minlenght').css("visibility", "collapse");
            }
        }
    }

    function CheckInputRegister() {
        var valid = true;
        if ($('#Password').val().toString()) {
            if ($('#Password').val().length < 6) {
                $('#minlenght').css("visibility", "visible");
                valid = false;
            }
            else {
                $('#minlenght').css("visibility", "collapse");
                
            }
        }
        if ($('#Password').val() != $('#ConfirmPassword').val()) {
            $('#confirm').css("visibility", "visible");
            valid = false;
        }
        else {
            $('#confirm').css("visibility", "collapse");
           
        }

        var name = $("#UserName").val();
        $.post("/Home/CheckName/", { username: name },
	                    function (data) {
	                        if (data == "True") {
	                            $('#dvUserName').css("visibility", "collapse");
	                            return true;
	                        }
	                        else {
	                            $('#dvUserName').css("visibility", "visible");
	                            return false;
	                        }
	                    });
	                    var email = $("#UserEmail").val();
	                    $.post("/Home/CheckEmail/", { email: email },
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
    
    </script>

    
    
	    <script type="text/javascript">
	        $(document).ready(function () {
	            $("#UserName").focusout(CheckName);
	            $("#UserEmail").focusout(CheckEmail);

	            $("#ConfirmPassword").focusout(ConfirmPassword);
	        });

                function CheckName()
                {
                    var name = $("#UserName").val();
	                $.post("/Home/CheckName/", { username: name },
	                    function (data) {
	                        if (data == "True") {
	                            $('#dvUserName').css("visibility", "collapse");
	                            return true;
	                        }
	                        else {
	                            $('#dvUserName').css("visibility", "visible");
	                            return false;
	                        }
	                    });
	                }
	                function CheckEmail()
                    {
	                    var email = $("#UserEmail").val();
	                    $.post("/Home/CheckEmail/", { email: email },
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
	                
	                function ConfirmPassword() {
	                    if ($('#Password').val() != $('#ConfirmPassword').val()) {
	                        $('#confirm').css("visibility", "visible");
	                        valid = false;
	                    } else {
	                        $('#confirm').css("visibility", "collapse");
	                    } 
	                }
	    </script>

<%using (Html.BeginForm("Register", "MembersManagement", FormMethod.Post, new { entype="multipar/form-data"}))
  { %>
  
    <div class="register_page">
		<fieldset>
			 <div style="text-align:right">
        <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
         </div>
			<p style="text-align:right">Lưu ý: các thông tin có đánh dấu <span style="color:Red">*</span> là các thông tin bắt buộc.</p>
            <p>
			<b style="color:Red"><%=Html.Encode(ViewData["error"]) %></b>
            </p>
			<table class="table_list_admin"cellpadding = "0" cellspacing = "0">
			    <tbody>
                    <tr>
						<td align="right" >Tài khoản (<span>*</span>)</td>
						<td  valign="middle" colspan="2">
							<%=Html.TextBoxFor(model => model.UserName, new { Style = "width:250px", focusout = "return CheckName()" })%>
                            <%=Html.ValidationMessageFor(model => model.UserName)%>
                           </td>
                           <td align="left" valign="middle"> <div id="dvUserName" style="visibility:hidden"> Tên đăng nhập đã có người dùng</div></td>
					</tr>
                    <tr>
						<td align="right" >Mật khẩu (<span>*</span>)</td>
						<td  valign="middle" colspan="2">
							<%=Html.PasswordFor(model => model.Password, new { Style = "width:250px", mouseleave = "return MinLenght()" })%> 
                            <%=Html.ValidationMessageFor(model => model.Password)%></td>
                            <td valign="middle" align="left"><div id="minlenght" style="visibility:hidden">Mật khẩu nhỏ nhất là 6 ký tự</div></td>
						
					</tr>
                    <tr>
						<td align="right" >Nhập lại mật khẩu (<span>*</span>)</td>
						<td  valign="middle" colspan="2">
							<%=Html.PasswordFor(model => model.ConfirmPassword, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.ConfirmPassword)%></td>
                            <td valign="middle" align="left">
                                <div id="confirm" style="visibility:hidden"> Xác nhận không khớp</div>
						    </td>
					</tr>
                    <tr>
						<td align="right"  colspan="4"></td>
					</tr>
					<tr>
						<td align="right" >Họ tên bạn (<span>*</span>)</td>
						<td colspan="3" valign="middle">
							<%=Html.TextBoxFor(model => model.UserFullName, new { Style = "width:250px" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserFullName)%>
                            
						</td>
					</tr>
					<tr>
						<td align="right" >Địa chỉ email (<span >*</span>)</td>
						<td valign="middle" colspan="2"><div id="err_txt_email" style=" display : none;">Vui lòng điền địa chỉ email đúng định dạng (ví dụ: infor@vnecom.com).</div>
                        <%=Html.TextBoxFor(model => model.UserEmail, new { Style = "width:250px", focusout = "return CheckEmail()" })%> 
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
						<td align="right"> (<span >*</span>)</td>
						<td valign="middle" colspan="3">  
                        <%=Html.DropDownList("UserAddCity", ViewData["UserAddCity"]as SelectList)%>           
                          <%--  <%: Html.DropDownList("UserAddCity", new[] {
                                new SelectListItem{Text="TP.Hồ Chí Minh",Value="TP.Hồ Chí Minh"},
                                new SelectListItem{Text="Hà Nội",Value="Hà Nội"},
                                new SelectListItem{Text="Khánh Hòa",Value="Khánh Hòa"},
                                new SelectListItem{Text="Bình Định",Value="Bình Định"},
                                new SelectListItem{Text="Phú Yên",Value="Phú Yên"},
                                new SelectListItem{Text="Quảng Ngãi",Value="Quảng Ngãi"},
                                new SelectListItem{Text="Quảng Nam",Value="Quảng Nam"},
                                new SelectListItem{Text="Đà nẵng",Value="Đà nẵng"},
                                new SelectListItem{Text="Huế",Value="Huế"},
                                new SelectListItem{Text="Quảng Trị",Value="Quảng Trị"},
                                new SelectListItem{Text="Quảng Bình",Value="Quảng Bình"},
                                new SelectListItem{Text="Hà Tỉnh",Value="Hà Tỉnh"},
                                new SelectListItem{Text="Nghệ An",Value="Nghệ An"},
                                new SelectListItem{Text="Nam Định",Value="Nam Định"},
                                }, "thuộc tỉnh thành", new { Style = "width:250px" })%> --%>
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
                            }, "--Ngày--", new { Style = "text_fill_register3" })%> 
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
                            }, "--Tháng--", new { Style = "text_fill_register3" })%> 
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
                            }, "--Năm--", new { Style = "text_fill_register3" })%>  
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
                       <%:Html.DropDownList("eventParents", ViewData["EventParents"] as SelectList, new { Style = "width:250px" })%>
                       <%=Html.ValidationMessageFor(model => model.UserEventParentID)%>
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
							<td valign="middle" colspan="3">                  
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
							<td valign="middle" colspan="3">
								                
                                <%= Html.DropDownList("UserCareer",ViewData["UserCareer"] as SelectList)%>
                                <%=Html.ValidationMessageFor(model => model.UserCareer)%>  
                                              
                            </td>
							
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
                            <%--<%: Html.DropDownList("UserWage", new[] {
                                new SelectListItem{Text="Dưới 1 triệu",Value="Dưới 1 triệu"},
                                new SelectListItem{Text="1 triệu - 2 triệu",Value="1 triệu - 2 triệu"},
                                new SelectListItem{Text="2 triệu-5 triệu",Value="2 triệu-5 triệu"},
                                new SelectListItem{Text="5 triệu-8 triệu",Value="5 triệu-8 triệu"},
                                new SelectListItem{Text="8 triệu- 10 triệu",Value="8 triệu- 10 triệu"},
                                new SelectListItem{Text="10 triệu-15 triệu",Value="10 triệu-15 triệu"},
                                new SelectListItem{Text="Trên 15 triệu",Value="Trên 15 triệu"}
                                }, "--Chọn--")%>--%> 
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
							    <td colspan="3">  
                                    <%: Html.DropDownList("UserTimeContact", new[] {
                                    new SelectListItem{Text="Bất kỳ lúc nào",Value="Bất kỳ lúc nào"},
                                    new SelectListItem{Text="Buổi sáng",Value="Buổi sáng"},
                                    new SelectListItem{Text="Buổi trưa",Value="Buổi trưa"},
                                    new SelectListItem{Text="Buổi chiều",Value="Buổi chiều"},
                                    new SelectListItem{Text="Buổi tối",Value="Buổi tối"}
                                    }, "Chọn", new { Style = "width:250px" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserTimeContact)%>                           
                                    </td>
							    
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
                                    <%=Html.TextAreaFor(model => model.UserRequirements, new { Style = "width:450px" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserRequirements)%></td>
							</tr>
							<tr>
                            <td valign="top" align="right">Ghi chú</td>
								<td valign="top" colspan="3" >
                                <%=Html.TextAreaFor(model=>model.UserDescriptions, new { Style = "width:450px" }) %>
                                    </td>
							</tr>
							<tr>
								<td align="center" colspan="4">
								    <input  id="button" class="btn_dangky_home" value="Đăng ký" type="submit" name="submit" onclick="return CheckInputRegister()"/>
                                    <input name="button1" id="Reset1"  class="btn_dangky_home" value="Hủy" type="reset"/>
                                </td>
							</tr>
						</tbody>
			    </table>
			</fieldset>
    </div>
<%} %>
<div class="footer_menu">
    <img alt="" src="../../Images/content_bottom.png" border="0"  />
</div>

</asp:Content>
