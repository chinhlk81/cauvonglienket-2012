<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
        Tạo mới	 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> Quản lý thành viên  </h2> 
<%using (Html.BeginForm())
  { %>
   <div id="register_page">
					        <fieldset>
					            <p>Lưu ý: các thông tin có đánh dấu * là các thông tin bắt buộc.</p>
					            <table border="0" cellpadding="3" cellspacing="0">
						            <tbody>
							            <tr>
								            <td align="right" style="width: 205px">Họ tên bạn (<span>*</span>)</td>
								            <td colspan="2" valign="middle"><div id="err_txt_fullname" style="display: none;">Vui lòng điền họ và tên bạn.</div>
								               <%=Html.TextBoxFor(Model=>Model.UserFullName) %> 
                                               <%=Html.ValidationMessageFor(Model=>Model.UserFullName) %>
								            </td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Địa chỉ email(<span >*</span>)</td>
								            <td colspan="2" valign="middle"><div id="err_txt_email" style=" display : none;">Vui lòng điền địa chỉ email đúng định dạng (ví dụ: infor@vnecom.com).</div>
                                            <%=Html.TextBoxFor(Model => Model.UserEmail, new { Style="width:150px"})%>
                                            <%=Html.ValidationMessageFor(Model=>Model.UserEmail) %>
                                            </td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Địa chỉ (<span >*</span>)</td>
								            <td colspan="2" valign="middle"><div id="err_txt_address" style="display: none;">Vui lòng điền địa chỉ của bạn.</div>
								               <%=Html.TextBoxFor(Model=>Model.UserAddLine) %>
                                                <%=Html.ValidationMessageFor(Model=>Model.UserAddLine) %>
                                                </td>
            								
							            </tr>
							            <tr>
							                <td align="right" style="width: 205px"></td>
								            <td valign="middle">
								                     
                                                <%: Html.DropDownList("UserAddCity", new[] {
                                                    new SelectListItem{Text="Tp.Hồ Chí Minh",Value=bool.TrueString},
                                                    new SelectListItem{Text="Hà Nội",Value=bool.FalseString},
                                                    new SelectListItem{Text="Huế",Value=bool.FalseString},
                                                    new SelectListItem{Text="Đà Nẵng",Value=bool.FalseString}
                                                    }, "--Chọn tỉnh--")%>
                                                    <%=Html.ValidationMessageFor(Model=>Model.UserAddCity) %>
                
                                            </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Số CMND hoặc số an sinh (<span >*</span>)</td>
								            <td colspan="2" valign="middle">
								                <div id="err_txt_id_number_new" style="display: none;">Bạn phải nhập số CMND của mình chính xác (9 chữ số)</div>
								                 <%=Html.TextBoxFor(Model=>Model.UserIDCard) %>
                                                <%=Html.ValidationMessageFor(Model=>Model.UserIDCard) %>
								            </td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Điện thoại liên lạc (<span >*</span>)</td>
								            <td colspan="2" valign="middle"><div id="err_txt_phone" style="display: none;">Hãy nhập số điện thoại để chúng tôi có thể liên lạc với bạn.</div>
								                <%=Html.TextBoxFor(Model=>Model.UserPhone) %>
                                                <%=Html.ValidationMessageFor(Model=>Model.UserPhone) %>
								            </td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Ngày sinh (<span >*</span>)</td>
								            <td colspan="2" valign="middle"><div  id="err_cbo_birthdate_day" style="display: none;">Ngày tháng năm sinh của bạn không chính xác.</div>
								                <select name="cbo_birthdate_day">
                                                  <option value="1" selected="selected">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>
                                                  <option value="13">13</option>
                                                  <option value="14">14</option>
                                                  <option value="15">15</option>
                                                  <option value="16">16</option>
                                                  <option value="17">17</option>
                                                  <option value="18">18</option>
                                                  <option value="19">19</option>
                                                  <option value="20">20</option>
                                                  <option value="21">21</option>
                                                  <option value="22">22</option>
                                                  <option value="23">23</option>
                                                  <option value="24">24</option>
                                                  <option value="25">25</option>
                                                  <option value="26">26</option>
                                                  <option value="27">27</option>
                                                  <option value="28">28</option>
                                                  <option value="29">29</option>
                                                  <option value="30">30</option>
                                                  <option value="31">31</option>
                                                </select>
								              /
                                                <select name="cbo_birthdate_month">
                                                <option value="1" selected="selected">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                </select>
								              /
                                                <select name="cbo_birthdate_year">
                                                <option value="1993" selected="selected">1993</option>
                                                <option value="1992">1992</option>
                                                <option value="1991">1991</option>
                                                <option value="1990">1990</option>
                                                <option value="1989">1989</option>
                                                <option value="1988">1988</option>
                                                <option value="1987">1987</option>
                                                <option value="1986">1986</option>
                                                <option value="1985">1985</option>
                                                <option value="1984">1984</option>
                                                <option value="1983">1983</option>
                                                <option value="1982">1982</option>
                                                <option value="1981">1981</option>
                                                <option value="1980">1980</option>
                                                <option value="1979">1979</option>
                                                <option value="1978">1978</option>
                                                <option value="1977">1977</option>
                                                <option value="1976">1976</option>
                                                <option value="1975">1975</option>
                                                <option value="1974">1974</option>
                                                <option value="1973">1973</option>
                                                <option value="1972">1972</option>
                                                <option value="1971">1971</option>
                                                <option value="1970">1970</option>
                                                <option value="1969">1969</option>
                                                <option value="1968">1968</option>
                                                <option value="1967">1967</option>
                                                <option value="1966">1966</option>
                                                <option value="1965">1965</option>
                                                <option value="1964">1964</option>
                                                <option value="1963">1963</option>
                                                <option value="1962">1962</option>
                                                <option value="1961">1961</option>
                                                <option value="1960">1960</option>
                                                <option value="1959">1959</option>
                                                <option value="1958">1958</option>
                                                <option value="1957">1957</option>
                                                <option value="1956">1956</option>
                                                <option value="1955">1955</option>
                                                <option value="1954">1954</option>
                                                <option value="1953">1953</option>
                                                <option value="1952">1952</option>
                                                <option value="1951">1951</option>
                                                <option value="1950">1950</option>
                                                <option value="1949">1949</option>
                                                <option value="1948">1948</option>
                                                <option value="1947">1947</option>
                                                <option value="1946">1946</option>
                                                <option value="1945">1945</option>
                                                </select>
                                            </td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Giới tính (<span >*</span>)</td>
								            <td valign="middle"> <%: Html.DropDownList("UserGender", new[] {
                                                new SelectListItem{Text="Nam",Value=bool.TrueString},
                                                new SelectListItem{Text="Nữ",Value=bool.FalseString}
                                                },"--Chọn--") %>      
                                                <%=Html.ValidationMessageFor(Model=>Model.UserGender) %>                   
                                           </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Muốn tìm</td>
								            <td valign="middle">
                                             <%: Html.DropDownList("UserLookingObj", new[] {
                                                new SelectListItem{Text="Bạn khác phái",Value="Bạn khác phái"},
                                                new SelectListItem{Text="Bạn cùng phái",Value="Bạn cùng phái"}
                                                }, "--Chọn đối tượng--")%>
                                                <%=Html.ValidationMessageFor(Model=>Model.UserLookingObj) %>
                                           </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Chiều cao</td>
								            <td valign="middle">
                                            <div id="err_txt_height" style="display: none;">Bạn phải điền chiều cao của mình.</div>
                                            <%=Html.TextBoxFor(Model=>Model.UserHeight) %>
                                            <%=Html.ValidationMessageFor(Model=> Model.UserHeight) %>
								              .cm (1m = 100cm) </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Cân nặng</td>
								            <td valign="middle">
                                            <div id="err_txt_weight" style="display: none;">Bạn phải điền cân nặng của mình.</div>
                                            <%=Html.TextBoxFor(Model=>Model.UserWeight) %> 
                                            <%=Html.ValidationMessageFor(Modle=>Model.UserWeight) %>
                                             .kg </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Trình độ văn hóa (<span >*</span>)</td>
								            <td valign="middle">
                                                  <%: Html.DropDownList("UserLevel", new[] {
                                                new SelectListItem{Text="Dưới PTTH",Value=bool.TrueString},
                                                new SelectListItem{Text="PTTH",Value=bool.FalseString},
                                                 new SelectListItem{Text="Trung học chuyên nghiệp/Cao đẳng",Value=bool.FalseString},
                                                new SelectListItem{Text="Đại học",Value=bool.FalseString},
                                                new SelectListItem{Text="Cao học",Value=bool.TrueString},
                                                new SelectListItem{Text="Tiến sĩ",Value=bool.FalseString},
                                                new SelectListItem{Text="Khác",Value=bool.FalseString}
                                               
                                                },"--Chọn--") %>   
                                                <%=Html.ValidationMessageFor(Model=>Model.UserLevel) %>                                                        
                                           </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Tình trạng hôn nhân (<span >*</span>)</td>
								            <td valign="middle">                  
                                               <%: Html.DropDownList("UserMaritalStatus", new[] {
                                                new SelectListItem{Text="Chưa kết hôn",Value=bool.TrueString},
                                                new SelectListItem{Text="Đã kết hôn",Value=bool.FalseString},
                                                 new SelectListItem{Text="Đã ly hôn",Value=bool.FalseString},
                                                new SelectListItem{Text="Góa vợ/Góa Chồng",Value=bool.FalseString}
                                                },"--Chọn--") %> 
                                                <%=Html.ValidationMessageFor(Model=>Model.UserMaritalStatus) %>                                         
                                               </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Tôn giáo</td>
								            <td valign="middle">                  
                                               <%: Html.DropDownList("UserReligion", new[] {
                                                new SelectListItem{Text="Không",Value=bool.TrueString},
                                                new SelectListItem{Text="Phật giáo",Value=bool.FalseString},
                                                 new SelectListItem{Text="Thiên chúa",Value=bool.FalseString},
                                                new SelectListItem{Text="Tin lành",Value=bool.FalseString},
                                                new SelectListItem{Text="Tôn giáo khác",Value=bool.FalseString}
                                                },"--Chọn--") %> 
                                                <%=Html.ValidationMessageFor(Model=>Model.UserReligion) %>   
                                              
                                                            </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Nghề nghiệp</td>
								            <td valign="middle">
								                
                                                <%: Html.DropDownList("UserCareer", new[] {
                                                new SelectListItem{Text="IT - Phần cứng/ Mạng",Value=bool.TrueString},
                                                new SelectListItem{Text="IT - Phần mềm",Value=bool.FalseString},
                                                 new SelectListItem{Text="Kinh doan",Value=bool.FalseString},
                                                new SelectListItem{Text="Dịch vụ",Value=bool.FalseString},
                                                new SelectListItem{Text="Làm việc tự do",Value=bool.FalseString},
                                                new SelectListItem{Text="Nghành nghề khác",Value=bool.FalseString}
                                                },"--Chọn--") %> 
                                                <%=Html.ValidationMessageFor(Model=>Model.UserCareer) %>   
                                              
                                            </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Vị trí công việc (<span >*</span>)</td>
								            <td valign="middle">
                                            <div id="err_txt_position" style="display: none;">Bạn phải điền vị trí công việc hiện tại.</div>
                                            <%=Html.TextBoxFor(Model=>Model.UserJobPosition) %>
                                            <%=Html.ValidationMessageFor(Model=> Model.UserJobPosition)%>
                                            </td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Mức lương hiện tại (<span >*</span>)</td>
								            <td valign="middle">
                                            <div id="err_txt_incoming" style="display: none;">Hãy bổ sung mức lương hiện tại của mình.</div>
                                            <%: Html.DropDownList("UserWage", new[] {
                                                new SelectListItem{Text="Dưới 1 triệu",Value=bool.TrueString},
                                                new SelectListItem{Text="1triệu-2triệu",Value=bool.FalseString},
                                                 new SelectListItem{Text="2 triệu-5 triệu",Value=bool.FalseString},
                                                new SelectListItem{Text="5 triệu-8 triệu",Value=bool.FalseString},
                                                new SelectListItem{Text="8 triệu- 10 triệu",Value=bool.FalseString},
                                                new SelectListItem{Text="10 triệu-15 triệu",Value=bool.FalseString},
                                                new SelectListItem{Text="Trên 15 triệu",Value=bool.FalseString}
                                                },"--Chọn--") %> 
                                                <%=Html.ValidationMessageFor(Model=>Model.UserWage) %>   
								              /tháng</td>
								            <td valign="middle">&nbsp;</td>
							            </tr>
							            <tr>
								            <td align="right" style="width: 205px">Thời gian làm việc (<span >*</span>)</td>
								            <td valign="middle">
                                            <div id="err_txt_time_of_current_position" style="display: none;">Hãy bổ sung thời gian tại vị trí hiện tại.</div>
                                            <%=Html.TextBoxFor(Model=>Model.UserWorkingTime) %>
                                            <%=Html.ValidationMessageFor(Model=>Model.UserWorkingTime) %>
                                            </td>
								            <td valign="middle"><em>(<strong>Cầu Vồng  Liên Kết</strong> sẽ dựa vào thời gian này để có chương trình thích hợp cho bạn)</em></td>
							            </tr>
							            <tr>
								            <td valign="top" align="right" style="width: 205px">Màu sắc bạn thích ?(<span >*</span>)</td>
								            <td valign="top">
                                            <div id="err_txt_fav_color" style="display: none;">Hãy điền các màu sắc bạn yêu thích.</div>
                                            <%=Html.TextAreaFor(Model=> Model.UserFavColor) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserFavColor)%>
                                            </td>
								            <td valign="top">&nbsp;</td>
							            </tr>
							            <tr>
								            <td valign="top" align="right" style="width: 205px">Thức ăn yêu thích của bạn ?(<span >*</span>)</td>
								            <td valign="top">
                                            <div id="err_txt_fav_food" style="display: none;">Hãy điền thức ăn bạn yêu thích.</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserFavFoods) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserFavFoods)%></td>
								            <td valign="top">&nbsp;</td>
							            </tr>
						                <tr>
							                <td valign="top" align="right" style="width: 205px">Loại sách bạn thích đọc ?(<span >*</span>)</td>
							                <td valign="top">
                                             <div id="err_txt_fav_book" style="display: none;">Hãy điền tiêu đề các sách yêu thích của bạn.</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserReadingBook) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserReadingBook)%></td>
							                <td valign="top">&nbsp;</td>
						                </tr>
							            <tr>
								            <td valign="top" align="right" style="width: 205px">Thú cưng yêu thích của bạn ?(<span >*</span>)</td>
								            <td valign="top">
                                            <div id="err_txt_fav_animal" style="display: none;">Hãy điền các thú cưng yêu thích của bạn.</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserFavPet) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserFavPet)%></td>
								            <td valign="top">&nbsp;</td>
							            </tr>
							            <tr>
								            <td valign="top" align="right" style="width: 205px">Mẫu người bạn thích, tại sao?(<span >*</span>)</td>
								            <td valign="top">
                                            <div id="err_txt_why_love" style="display: none;">Hãy cho chúng tôi biết mẫu người bạn thích và tại sao.</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserPeopleLike) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserPeopleLike)%></td>
								            <td rowspan="2" valign="top"><i style="font-size: 14px; color: rgb(51, 51, 51);">(Dựa vào thông tin này, <strong>Cầu Vồng Liên Kết</strong> sẽ sắp xếp cho bạn có cơ hội giao lưu, kết bạn với những thành viên thích hợp)</i></td>
							            </tr>
							            <tr>
							                <td valign="top" align="right" style="width: 205px">Mẫu người bạn ghét, tại sao?(<span >*</span>)</td>
							                <td valign="top">
                                            <div id="err_txt_why_hate" style="display: none;">Hãy cho chúng tôi biết mẫu người bạn không thích và tại sao.</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserPeopleDislike) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserPeopleDislike)%></td>
							            </tr>
							            <tr>
								            <td valign="top" align="right" style="width: 205px">Sở thích riêng của bạn ?(<span >*</span>)</td>
								            <td valign="top">
                                             <div id="err_txt_hobbies" style="display: none;">Hãy điền sở thích cá nhân của bạn</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserHobby) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserHobby)%></td>
								            <td valign="top">&nbsp;</td>
							            </tr>
							            <tr>
								            <td valign="top" align="right" style="width: 205px">Bạn hi vọng điều gì từ chương trình này ?(<span >*</span>)</td>
								            <td valign="top">
                                            <div id="err_txt_accomplish" style="display: none;">Mong muốn của bạn khi tham gia chương trình là gì.</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserHope) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserHope)%></td>
								            <td valign="top"><i style="font-size: 14px; color: rgb(51, 51, 51);">(Căn cứ vào thông tin này, <strong>Cầu Vồng Liên Kết </strong>sẽ sắp xếp chương trình thích hợp cho bạn)</i></td>
							            </tr>
						                <tr>
						                    <td valign="top" align="right" style="width: 205px">Đối tượng bạn thích làm quen?(<span >*</span>)</td>
						                    <td valign="top">
                                            <div id="err_txt_type_person" style="display: none;">Hãy điển mẫu người bạn thích.</div>
                                            <%=Html.TextAreaFor(Model=>Model.UserOjbLikeDating) %>
                                            <%=Html.ValidationMessageFor(Model=>Model.UserOjbLikeDating) %>
                                            </td>
						                    <td valign="top">&nbsp;</td>
						                </tr>
							            <tr>
								            <td valign="top" align="right" style="width: 205px">Yêu cầu riêng cho đối tượng?(<span >*</span>)</td>
								            <td valign="top">
                                            <div id="err_txt_special_recomendation" style="display: none;">Hãy điền các yêu cầu về đối tượng bạn mong muốn.</div>
                                             <%=Html.TextAreaFor(Model=> Model.UserRequirements) %>
                                            <%=Html.ValidationMessageFor(Model => Model.UserRequirements)%></td>
								            <td valign="top"><i style="font-size: 14px; color: rgb(51, 51, 51);">(Thông tin này giúp <strong>Cầu Vồng Liên Kết</strong> tìm 1 nửa cho bạn tốt hơn)</i></td>
							            </tr>
							            <tr>
							                <td align="right" style="width: 205px">Thời gian liên hệ với bạn tốt nhất?</td>
							                <td>  
                                              <%: Html.DropDownList("UserTimeContact", new[] {
                                                new SelectListItem{Text="Bất kỳ lúc nào",Value=bool.TrueString},
                                                new SelectListItem{Text="Buổi sáng",Value=bool.FalseString},
                                                 new SelectListItem{Text="Buổi trưa",Value=bool.FalseString},
                                                new SelectListItem{Text="Buổi chiều",Value=bool.FalseString},
                                                new SelectListItem{Text="Buổi tối",Value=bool.FalseString}
                                                },"--Chọn--") %> 
                                                <%=Html.ValidationMessageFor(Model=>Model.UserTimeContact) %>                            
                                              </td>
							                <td >&nbsp;</td>
						                </tr>
							            <tr>
								            <td style="width: 205px;" valign="middle"></td>
								            <td colspan="2">
								                <input name="button" id="button" value="Thêm" type="submit"/>
                                                <input name="button0" id="Reset2" value="Sửa" type="reset"/>&nbsp;
                                                <input name="button1" id="Reset1" value="Xóa" type="reset"/>
                                            </td>
								           
							    </tr>
						            </tbody>
					            </table>
					        </fieldset>
                            </div>
                            <%} %>
</asp:Content>
