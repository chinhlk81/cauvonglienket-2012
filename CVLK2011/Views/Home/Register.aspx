<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Đăng ký thành viên
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/login.js" type="text/javascript"></script>
    <div class="title_menu">
  Đăng ký thành viên
</div>
    <script type="text/javascript">
    $(
            function () {
                $('#submit').click(CheckInput);
            }
        );
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

    function CheckInput() {

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
        var Agree = document.getElementById('Agree').checked;
        if (!Agree) {
            $('#conAgree').css("visibility", "visible");
            valid = false;
        }
        else {
            $('#conAgree').css("visibility", "collapse");
        }
        if ($('#txtCaptcha').val() == "") {
            $('#dvNoMacht').css('visibility', 'visible');
            valid = false;
        }
        else {
            $('#dvNoMacht').css('visibility', 'collapse');
        }

        var name = $("#UserName").val();
        $.post("/Home/CheckName/", { username: name },
	                    function (data) {
	                        if (data == "True") {
	                            $('#dvUserName').css("visibility", "collapse");

	                        }
	                        else {
	                            $('#dvUserName').css("visibility", "visible");
	                            valid = false;
	                        }
	                    });
        var email = $("#UserEmail").val();
        $.post("/Home/CheckEmail/", { email: email },
	                    function (data) {
	                        if (data == "True") {
	                            $('#dvEmail').css("visibility", "collapse");

	                        }
	                        else {
	                            $('#dvEmail').css("visibility", "visible");
	                            valid = false;
	                        }
	                    });
	    if (valid == true) { $('#progress').css('visibility', 'visible'); }
        return valid;
    }      
    
    </script>

	<script type="text/javascript">
	        $(document).ready(function () {
	            $("#UserName").focusout(CheckName);
	            $("#UserEmail").focusout(CheckEmail);

	            $("#ConfirmPassword").focusout(ConfirmPassword);
	            $('#Captch').change(ResetTextBox);
	        });

	        function ResetTextBox() {
	            alert('i am here restet textbox');
	            document.getElementById(':Html');
	            
            }
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
	                function VerifyCaptcha() {
	                    var captcha = $('#txtCaptcha').val();
	                    var mycaptcha = $('#myCaptcha').val();
	                    $.post('/Home/VerifyCaptcha/', { myCaptcha: mycaptcha, txtCaptcha: captcha }, function (data) {
	                        if (data == 'True') {
	                            $('#dvNoMacht').css('visibility', 'collapse');

	                        }
	                        else {
	                            $('#dvNoMacht').css('visibility', 'visible');
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
<div >
<div class="text_success" style="display:none"><img src="../../Images/loadder/loader_green.gif"  alt="ziceAdmin" /><span>Please wait/ vui lòng chờ hệ thống xử lý</span></div>
<!--%using (Html.BeginForm("Register", "Home", FormMethod.Post, new { entype="multipar/form-data"}))
  { %-->
  <% using (Ajax.BeginForm("Register", "Home", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "CaptchaHolder", LoadingElementId = "aaa" }, new { @name = "frgt" }))
     {%>
    <div class="register_page">
		<fieldset>
			<legend>Mới tham gia lần đầu ?</legend>
			<p>
			Nếu bạn là thành viên mới của 
            website, việc đơn giản là bạn hãy điền các thông tin được yêu cầu bên 
            dưới nhằm giúp chúng tôi hiểu rõ hơn về bạn. Thông tin của bạn càng đầy 
            đủ, chúng tôi càng dễ dàng tìm được những người bạn hợp với bạn hơn. Vì 
            vậy hãy cố gắng điền thật đầy đủ <br/><br/><strong>Cầu Vồng Liên Kết</strong> không cung cấp thông tin của bạn cho người khác nếu chưa được sự đồng ý của bạn.
            </p>
			<p>Lưu ý: các thông tin có đánh dấu <span style="color:Red">*</span> là các thông tin bắt buộc.</p>
            <br />
			<table class="table_register_member"cellpadding = "0" cellspacing = "0">
			    <tbody>
                    <tr>
						<td align="right"  colspan="4"></td>
					</tr>
                    <tr>
						<td align="right" >Tài khoản (<span>*</span>)</td>
						<td  valign="middle" colspan="2">
							<%=Html.TextBoxFor(model => model.UserName, new { @class = "text_fill_register", focusout = "return CheckName()" })%>
                            <%=Html.ValidationMessageFor(model => model.UserName)%>
                           </td>
                           <td align="left" valign="middle"> <div id="dvUserName" style="visibility:hidden"> Tên đăng nhập đã có người dùng</div></td>
					</tr>
                    <tr>
						<td align="right" >Mật khẩu (<span>*</span>)</td>
						<td  valign="middle" colspan="2">
							<%=Html.PasswordFor(model => model.Password, new { @class = "text_fill_register", mouseleave = "return MinLenght()" })%> 
                            <%=Html.ValidationMessageFor(model => model.Password)%></td>
                            <td valign="middle" align="left"><div id="minlenght" style="visibility:hidden">Mật khẩu nhỏ nhất là 6 ký tự</div></td>
						
					</tr>
                    <tr>
						<td align="right" >Nhập lại mật khẩu (<span>*</span>)</td>
						<td  valign="middle" colspan="2">
							<%=Html.PasswordFor(model => model.ConfirmPassword, new { @class = "text_fill_register" })%> 
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
							<%=Html.TextBoxFor(model => model.UserFullName, new { @class = "text_fill_register" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserFullName)%>
                            
						</td>
					</tr>
					<tr>
						<td align="right" >Địa chỉ email (<span >*</span>)</td>
						<td valign="middle" colspan="2"><div id="err_txt_email" style=" display : none;">Vui lòng điền địa chỉ email đúng định dạng (ví dụ: infor@vnecom.com).</div>
                        <%=Html.TextBoxFor(model => model.UserEmail, new { @class = "text_fill_register", focusout = "return CheckEmail()" })%> 
                        <%=Html.ValidationMessageFor(model => model.UserEmail)%>
                        
                        </td>
                        <td valign="middle" align="left">
                        <div id="dvEmail" style="visibility:hidden"> Email đã có người dùng</div>
                        </td>
					</tr>
					<tr>
						<td align="right" >Địa chỉ (<span >*</span>)</td>
						<td colspan="3" valign="middle"><div id="err_txt_address" style="display: none;">Vui lòng điền địa chỉ của bạn.</div>
							<%=Html.TextBoxFor(model => model.UserAddLine, new { @class = "text_fill_register" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserAddLine)%>
                            </td>
            								
					</tr>
					<tr>
						<td align="right"></td>
						<td valign="middle" colspan="3">             
                            <%=Html.DropDownList("UserAddCity", ViewData["UserAddCity"]as SelectList,new { @class = "text_fill_register2" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserAddCity)%>
                        </td>
					</tr>
					<tr>
						<td align="right" >Số CMND hoặc số an sinh (<span >*</span>)</td>
						<td colspan="3" valign="middle">
							<div id="err_txt_id_number_new" style="display: none;">Bạn phải nhập số CMND của mình chính xác (9 chữ số)</div>
								<%=Html.TextBoxFor(model => model.UserIDCard, new { @class = "text_fill_register" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserIDCard)%>
						</td>
					</tr>
					<tr>
						<td align="right" >Điện thoại liên lạc (<span >*</span>)</td>
						<td colspan="3" valign="middle"><div id="err_txt_phone" style="display: none;">Hãy nhập số điện thoại để chúng tôi có thể liên lạc với bạn.</div>
							<%=Html.TextBoxFor(model => model.UserPhone, new { @class = "text_fill_register" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserPhone)%>
						</td>
					</tr>
			        <tr>
				        <td align="right" >Ngày sinh: (<span >*</span>)</td>
				        <td colspan="3" valign="middle">
                            <%: Html.DropDownList("UserBirthday", new[] {
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
                            }, "--Ngày--", new { @class = "text_fill_register3" })%> 
					        /
                            <%: Html.DropDownList("UserBirthday", new[] {
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
                            }, "--Tháng--", new { @class = "text_fill_register3" })%> 
					        /
                            <%: Html.DropDownList("UserBirthday", new[] {
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
                            }, "--Năm--", new { @class = "text_fill_register3" })%>  
                        </td>
					</tr>
					<tr>
						<td align="right" >Giới tính (<span >*</span>)</td>
						<td valign="middle" colspan="3">
                            <%: Html.DropDownList("UserGender", new[] {
                                                new SelectListItem{Text="Nam",Value="Male"},
                                                new SelectListItem{Text="Nữ",Value="Female"}
                                                }, "Chọn giới tính", new { @class = "text_fill_register2" })%>  
                    <%=Html.ValidationMessageFor(model => model.UserGender)%>                   
                        </td>
					</tr>
                    <tr>
                    <td align="right">Tham gia (<span >*</span>)</td>
                    <td valign="middle" colspan="3">
                       <%:Html.DropDownList("eventParents", ViewData["EventParents"] as SelectList, new { @class = "text_fill_register2" })%>
                       <%=Html.ValidationMessageFor(model=>model.UserEventParentID) %>
                    </td>
                    </tr>
					<tr>
						<td align="right" >Muốn tìm </td>
						<td valign="middle" colspan="3">
                            <%: Html.DropDownList("UserLookingObj", new[] {
                            new SelectListItem{Text="Bạn khác phái",Value="Bạn khác phái"},
                            new SelectListItem{Text="Bạn cùng phái",Value="Bạn cùng phái"}
                            }, "Chọn đối tượng", new { @class = "text_fill_register2" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserLookingObj)%>
                        </td>
					</tr>
                    <tr>
						<td align="right"  colspan="4"></td>
					</tr>
					<tr>
						<td align="right" >Chiều cao</td>
						<td valign="middle" colspan="3"><div id="err_txt_height" style="display: none;">Bạn phải điền chiều cao của mình.</div>
                            <%=Html.TextBoxFor(model => model.UserHeight, new { @class = "text_fill_register2" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserHeight)%>
							    .cm (1m = 100cm)
                            </td>
					</tr>
					<tr>
						<td align="right" >Cân nặng</td>
						<td valign="middle" colspan="3"><div id="err_txt_weight" style="display: none;">Bạn phải điền cân nặng của mình.</div>
                        <%=Html.TextBoxFor(model => model.UserWeight, new { @class = "text_fill_register2" })%> 
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
                                    }, "Chọn trình độ", new { @class = "text_fill_register2" })%> 
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
                                }, "Chọn", new { @class = "text_fill_register2" })%>  
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
                                }, "Chọn", new { @class = "text_fill_register2" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserReligion)%> 
                                </td>
						</tr>
						<tr>
							<td align="right" >Nghề nghiệp</td>
							<td valign="middle" colspan="2">
								                
                                <%= Html.DropDownList("UserCareer",ViewData["UserCareer"] as SelectList, new { @class = "text_fill_register2" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserCareer)%>  
                                              
                            </td>
							<td valign="middle">&nbsp;</td>
						</tr>
						<tr>
							<td align="right" >Vị trí công việc (<span >*</span>)</td>
							<td valign="middle" colspan="3"><div id="err_txt_position" style="display: none;">Bạn phải điền vị trí công việc hiện tại.</div>
                            <%=Html.TextBoxFor(model => model.UserJobPosition, new { @class = "text_fill_register" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserJobPosition)%>
                            </td>
						</tr>
						<tr>
							<td align="right" >Mức lương hiện tại (<span >*</span>)</td>
							<td valign="middle" colspan="3">
                            <div id="err_txt_incoming" style="display: none;">Hãy bổ sung mức lương hiện tại của mình.</div>
                            <%=Html.TextBoxFor(model => model.UserWage, new { @class = "text_fill_register" })%> 
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
                            <%=Html.TextBoxFor(model => model.UserWorkingTime, new { @class = "text_fill_register" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserWorkingTime)%> 
                            </td>
						</tr>
						<tr>
							<td align="center" valign="top" colspan="4" 
                                style="font-size:12px;font-style:italic;color:#666666">
                                (<strong>Cầu Vồng  Liên Kết</strong> sẽ dựa vào thời gian này để có chương trình thích hợp cho bạn)</td>
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
                                    }, "Chọn", new { @class = "text_fill_register2" })%> 
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
                            <%=Html.TextAreaFor(model => model.UserFavColor, new { @class = "text_fill_register" })%> 
                            <%=Html.ValidationMessageFor(model => model.UserFavColor)%>
                            </td>
						</tr>
						<tr>
							<td valign="middle" align="right" >Thức ăn yêu thích của bạn ? (<span >*</span>)</td>
							<td valign="middle" colspan="3"><div id="err_txt_fav_food" style="display: none;">Hãy điền thức ăn bạn yêu thích.</div>
                                <%=Html.TextAreaFor(model => model.UserFavFoods, new { @class = "text_fill_register" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserFavFoods)%></td>
						</tr>
						    <tr>
							    <td valign="middle" align="right" >Loại sách bạn thích đọc ? (<span >*</span>)</td>
							    <td valign="middle" colspan="3">
                                    <div id="err_txt_fav_book" style="display: none;">Hãy điền tiêu đề các sách yêu thích của bạn.</div>
                                    <%=Html.TextAreaFor(model => model.UserReadingBook, new { @class = "text_fill_register" })%> 
                                <%=Html.ValidationMessageFor(model => model.UserReadingBook)%></td>
						    </tr>
							<tr>
								<td valign="middle" align="right" >Thú cưng yêu thích của bạn ? (<span >*</span>)</td>
								<td valign="middle" colspan="3">
                                <div id="err_txt_fav_animal" style="display: none;">Hãy điền các thú cưng yêu thích của bạn.</div>
                                    <%=Html.TextAreaFor(model => model.UserFavPet, new { @class = "text_fill_register" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserFavPet)%>
                                    </td>
							</tr>
							<tr>
								<td valign="middle" align="right" >Mẫu người bạn thích, tại sao? (<span >*</span>)</td>
								<td valign="middle" colspan="3"><div id="err_txt_why_love" style="display: none;">Hãy cho chúng tôi biết mẫu người bạn thích và tại sao.</div>
                                    <%=Html.TextAreaFor(model => model.UserPeopleLike, new { @class = "text_fill_register" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserPeopleLike)%></td>
							</tr>
							<tr>
								<td valign="top" align="center" colspan="4" 
                                    style="font-size:12px;font-style:italic;color:#666666">(Dựa vào thông tin này, <strong>Cầu Vồng Liên Kết</strong> sẽ sắp xếp cho bạn có cơ hội giao lưu, kết bạn với những thành viên thích hợp)</td>
							</tr>
							<tr>
							    <td valign="middle" align="right" >Mẫu người bạn ghét, tại sao? (<span >*</span>)</td>
							    <td valign="middle" colspan="3"><div id="err_txt_why_hate" style="display: none;">Hãy cho chúng tôi biết mẫu người bạn không thích và tại sao.</div>
                                    <%=Html.TextAreaFor(model => model.UserPeopleDislike, new { @class = "text_fill_register" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserPeopleDislike)%>
                                    </td>
							</tr>
							<tr>
								<td valign="middle" align="right" >Sở thích riêng của bạn  ?(<span >*</span>)</td>
								<td valign="middle" colspan="3"><div id="err_txt_hobbies" style="display: none;">Hãy điền sở thích cá nhân của bạn</div>
                                    <%=Html.TextAreaFor(model => model.UserHobby, new { @class = "text_fill_register" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserHobby)%>
                                    </td>
							</tr>
							<tr>
								<td  align="right" >Bạn hi vọng điều gì từ chương trình này ? (<span >*</span>)</td>
								<td valign="middle" colspan="3"><div id="err_txt_accomplish" style="display: none;">Mong muốn của bạn khi tham gia chương trình là gì.</div>
                                    <%=Html.TextAreaFor(model => model.UserHope, new { @class = "text_fill_register" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserHope)%></td>
							</tr>
							<tr>
								<td valign="top" align="center" colspan="4" 
                                    style="font-size:12px;font-style:italic;color:#666666">(Căn cứ vào thông tin này, <strong>Cầu Vồng Liên Kết </strong>sẽ sắp xếp chương trình thích hợp cho bạn)</td>
							</tr>
						    <tr>
						        <td valign="middle" align="right" >Đối tượng bạn thích làm quen? (<span >*</span>)</td>
						        <td valign="middle" colspan="3"><div id="err_txt_type_person" style="display: none;">Hãy điển mẫu người bạn thích.</div>
                                    <%=Html.TextAreaFor(model => model.UserOjbLikeDating, new { @class = "text_fill_register" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserOjbLikeDating)%>
                                    </td>
						    </tr>
							<tr>
								<td valign="top" align="right" >Yêu cầu riêng cho đối tượng? (<span >*</span>)</td>
								<td valign="top" colspan="3"><div id="err_txt_special_recomendation" style="display: none;">Hãy điền các yêu cầu về đối tượng bạn mong muốn.</div>
                                    <%=Html.TextAreaFor(model => model.UserRequirements, new { @class = "text_fill_register" })%> 
                                    <%=Html.ValidationMessageFor(model => model.UserRequirements)%></td>
							</tr>
							<tr>
								<td valign="top" align="center" colspan="4" 
                                    style="font-size:12px;font-style:italic;color:#666666">Quy định sử dụng</td>
							</tr>
                            <tr>
                            <td colspan="4" align="center" style="width:600px">
                            
                            <%=Html.Action("TermsOfUse")%>
                            </td>
                            </tr>
                            <tr>
                                <td align="right">Tôi đồng ý &nbsp;</td>
                                <td align="left" colspan="2"> <input type="checkbox" id="Agree" />
                                </td>
                                <td align="left">
                                    <div id="conAgree" style="visibility:hidden;color:Red">Bạn chưa đồng ý sử dụng dịch vụ</div>
                                </td>
                            </tr>
                            <tr>
                            <td></td>
                                <td align="right" style="width:200px">
                                       <div id="CaptchaHolder" style="width:200px;height:60px">
                                        <%Html.RenderPartial("Captcha"); %>
                                       </div>
                                      </td>
                                <td align="left">
                                        <%= Ajax.ImageActionLink("../../Images/refreshCaptcha.jpg", "Tạo chuỗi mới", "Captcha", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "CaptchaHolder" })%>
                                </td>
                                <td align="left">
                                </td>
                             </tr>
                             <tr>
                              <td align="right" valign="top">Mã xác nhận</td>
                             <td align="left" colspan="2"><div> <%=Html.TextBox("txtCaptcha", "", new { @class = "text_fill_register"})%></div>
                            <div id="dvNoMacht" style="visibility:collapse;margin-left:10px;vertical-align:text-top;color:Red">Vui lòng nhập mã xác nhận </div>
                            <%--<div id="loading" style="display:none">
                            <div style="vertical-align:text-bottom">
                            <img src="../../Images/ajax_loader.gif" alt="loading..."/>
                            </div>
                            <div style="vertical-align:text-top">
                            <b style="margin-left:5px">Đang đăng ký hệ thống. Vui lòng đợi trong giây lát!</b>
                            </div>
                            </div>--%>
                            </td>
                                <td align="left">
                                   
                                 </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div id="progress" class="nNote nInformation hideit" style="visibility:collapse">
                                        <p><strong>HỆ THỐNG: </strong>Đang xử lý thông tin, vui lòng đợi trong giây lát.</p>
                                    </div>
                                </td>
                            </tr>
							<tr>
								<td align="center" colspan="4">
								    <input  id="but_login" class="btn_dangky_home" value="Đăng ký" type="submit" name="submit" onclick="return CheckInput()"/>
                                    <input name="button1" id="Reset1"  class="btn_dangky_home" value="Hủy" type="reset"/>
                                </td>
							</tr>
						</tbody>
			    </table>
			</fieldset>
    </div>
<%} %>
</div>
<div class="footer_menu">
    <img alt="" src="../../Images/content_bottom.png" border="0"  />
</div>

</asp:Content>
