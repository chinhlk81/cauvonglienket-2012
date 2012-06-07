<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetUserByID_Result>" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>   
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!-- Hoang added 2011.05.02-->
<script src="../../../Scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="../../../Scripts/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
<script src="../../../Scripts/jquery.cascadingDropDown.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {

        
        $("#saved").CascadingDropDown("#userType", '/MembersManagement/UpdateUserType', 
        {
            postData: function () {
                return { userID: $('#UserID').val(), userType: $('#userType').val() };
            },
            onLoading: function () {
                $("#saved").css("background-color", "#ff3");
            },

            onLoaded: function () {
                promptText: '-- Lưu thành công--',
                $("#saved").css("background-color", '#ffffff');
                $("#saved").html('Lưu thành công').effect("highlight", {}, 3000);
            }
         });
    });
</script>
    <div id="userDetails">
       <h2 class="manager_title_detail"> Thông tin thành viên</h2> 
       <div style="text-align:right">
         <a href="<%=Url.Action("Index", "MembersManagement")%>"><img src="../../../Images/admin_back.png" alt="Trở về" /></a>
         
         </div> 
         <%if (Model != null)
           { %>
       <table  class="detail_member_top">
            <tr class="detail_member_top">
                <td style="width: 152px" rowspan="2">
                   <table>
                   <tr>
                   <td>
                       <img alt="" src="../<%=Model.UserPicture %>" style="height: 114px; width: 154px" /></td>
                   </tr>
                   </table>
                </td>
                <td style="width:100px">
                <div style="height:20px">Tên</div>
                <div style="height:20px">Tài khoản</div>
                <div style="height:20px">Giới tính </div>
                <div style="height:20px">Ngày sinh</div>
                <div style="height:20px">Điện thoại</div>
                <div style="height:20px">Email</div>
                <div style="height:20px">Địa chỉ</div>
                </td>
                <td rowspan="2">
                    <%=Html.Hidden("UserID", Model.UserID)%>
                    <div style="height:20px"><%=Html.Encode(Model.UserFullName)%></div>
                     <div style="height:20px"><%:Model.UserName%></div>
                     <div style="height:20px"><%:Utilities.AliasDictionary[Model.UserGender]%></div>   
                     <div style="height:20px"><%:Model.UserBirthday.ToShortDateString()%></div>
                    <div style="height:20px"><%:Model.UserPhone%></div>
                    <div style="height:20px"><%:Model.UserEmail%></div>
                    <div style="height:20px"><%:Model.UserAddLine%>-<%:Model.UserAddCity%></div>
                  </td>
                    <td rowspan="2">
                    Trạng thái:
                    <%if (Model.UserStatus == CVLK2011.Models.Utilities.cstDeActivate)
                      {%>
                    <b style="color:#eb0d0d"><%=Html.Encode(Model.StatusText)%></b>
                    <%}
                      else
                      { %>
                     <b style="color:#1b47a2"><%=Html.Encode(Model.StatusText)%></b>
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
                    <td>
                    
                        <%=Html.DropDownList("userType", new[] {
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNone], Value=Utilities.cstUserTypeNone},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeCouples], Value=Utilities.cstUserTypeCouples},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypePerfectCouple], Value=Utilities.cstUserTypePerfectCouple},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeWaitngAppointment], Value=Utilities.cstUserTypeWaitngAppointment},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeWaitingReply], Value=Utilities.cstUserTypeWaitingReply},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeOther], Value=Utilities.cstUserTypeOther},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNoContacted], Value=Utilities.cstUserTypeNoContacted},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeMet], Value=Utilities.cstUserTypeMet},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypePotential], Value=Utilities.cstUserTypePotential},
                            new SelectListItem{Text=Utilities.AliasDictionary[Utilities.cstUserTypeNoSerious], Value=Utilities.cstUserTypeNoSerious},
                            })%>
                            <span id="saved"></span>
                           
                     
                            </td>
                    <%if (Model.UserIsVIP && Model.VIPRemain > 0)
                      { %>
                    <td >
                    <a href="<%=Url.Action("CancelVIP",new { id = Model.UserID,view="Details" })%>" onclick="return ConfirmDelete()">Xóa VIP</a> 
                   </td>
                   <%}
                      else
                      { %>
                    <%--<td align="center" onclick="document.location.href ='<%=Url.Action("EditVIP",new { id = Model.UserID })%>'">
                     Click nâng cấp VIP &nbsp; <%= Html.CheckBox("uIsVIP", Model.UserIsVIP)%>--%>
                     <td>
                     <input type="button" value="Nâng cấp VIP" id="UpgradeVIP"  onclick="ShowUpGrade()"/>
                     <div id="pop" style="visibility:collapse">
                     <%using (Html.BeginForm("UpGradeVIP", "MembersManagement", new { id = Model.UserID }, FormMethod.Post))
                       { %>
                       <div id="dvValidate" style="visibility:collapse"><b style="color:Red">Kiểm tra dữ liệu nhập</b></div>
                    <div> Ngày thanh toán</div>
                    <div>
                    <input type="text" id="datepicker5" style="width:150px" name="PaymentDate"/>
                     <%=Html.ValidationMessageFor(model => model.UserDatePayment)%>
                     </div>
                     <div>
                    Thời hạn(ngày)</div>
                    
                    <div><%=Html.TextBoxFor(model => model.VIPPeriod, new { Style = "width:150px" })%>
                     <%=Html.ValidationMessageFor(model => model.VIPPeriod)%>
                     </div>
                    &nbsp; <input type="submit" value="Lưu" onclick="return CheckInputVIP()" style="width:70px" />
                     <input type="reset" value="Hủy" onclick="HiddenPop()" style="width:70px"/>
                     <%} %>
                     </div>
                   </td>
                   <%} %>
            </tr>
            </table>
       <h3> Thông tin cơ bản</h3> 
       <hr style="border-width:inherit; margin-left:0"/>
            <table  class="table_list_admin">
            <tr>
            <td style="width: 233px">
            
                CMND</td>
                <td colspan="2"><%=Html.Encode(Model.UserIDCard)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Chiều cao </td>
                <td colspan="2"><%=Html.Encode(Model.UserHeight)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            Cân nặng
               </td>
               <td colspan="2"><%=Html.Encode(Model.UserWeight)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Tôn giáo</td>
                <td colspan="2"><%=Html.Encode(Model.UserReligion)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Tình trạng hôn nhân</td>
                <td colspan="2"><%=Html.Encode(Model.UserMaritalStatus)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            Tham gia
            </td>
            <td colspan="2">
            <%=Model.EventParentName%>
            </td>
            </tr>
            <tr>

            <td style="width: 233px">Ngày thanh toán</td>
            <td colspan="2">
            <%if (Model.UserDatePayment.HasValue)
              { %>
                    <%=Html.Encode(Model.UserDatePayment.Value.ToString("dd/MM/yyyy"))%>
            <%}%>
             
            </td>
            </tr>
           <tr>
           <td>Thời gian còn lại</td>
           <td><%=Html.Encode(Model.VIPRemain)%> ngày</td>
           </tr>
            </table>
    <!-- hoc van va nghe nghiep-->
     <h3> Học vấn và nghể nghiệp</h3> 
       <hr style="border-width:inherit; margin-left:0"/>
            <table  class="table_list_admin">
            <tr>
            <td style="width: 233px" class="modal-600">
            
                Trình độ văn hóa</td>
            <td>
            
                <%=Html.Encode(Model.UserLevel)%></td>
            </tr>
            <tr>
            <td style="width: 233px" class="modal-600">
            
                Nghề nghiệp</td>
                <td>
                    <%=Html.Encode(Model.UserCareer)%></td>
            </tr>
            <tr>
            <td style="width: 233px" class="modal-600">
            
                Vị trí công việc</td>
                <td>
                   <%=Html.Encode(Model.UserCareer)%></td>
            </tr>
            <tr>
            <td style="width: 233px" class="modal-600">
            
                Mức lương</td>
            <td><%=Html.Encode(Model.UserWage)%></td>
            </tr>
            <tr>
            <td style="width: 233px" class="modal-600">
            
                Thời gian làm việc</td>
                <td><%=Html.Encode(Model.UserWorkingTime)%></td>
            </tr>
            </table>
     <h3> Sở thích và yêu cầu riêng</h3> 
       <hr style="border-width:inherit; margin-left:0"/>
            <table  class="table_list_admin">
            <tr>
            <td style="width: 233px">
            
                Màu yêu thích</td>
           <td colspan="2">
            
                <%=Html.Encode(Model.UserFavColor)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Món ăn yêu thích</td>
                <td colspan="2">
                    <%=Html.Encode(Model.UserFavFoods)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Loại sách yêu thích</td>
                <td colspan="2">
                    <%=Html.Encode(Model.UserReadingBook)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Mẫu người yêu thích</td>
                <td colspan="2">
                    <%=Html.Encode(Model.UserPeopleLike)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Mẫu người không thích</td>
            <td colspan="2"><%=Html.Encode(Model.UserPeopleDislike)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Thú cưng yêu thích</td>
                <td colspan="2"><%=Html.Encode(Model.UserFavPet)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Sở thích riêng</td>
                <td colspan="2">
                    <%=Html.Encode(Model.UserHobby)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Đối tượng muốn tìm</td>
                <td colspan="2"><%=Html.Encode(Model.UserLookingObj)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
            
                Yêu cầu riêng</td>
                <td colspan="2"><%=Html.Encode(Model.UserRequirements)%></td>
            </tr>
            <tr>
            <td style="width: 233px">
                Mong muốn</td>
               <td colspan="2"><%=Html.Encode(Model.UserHope)%></td>
            </tr>
            
            <tr>
            <td style="width: 233px">Đổi tượng thích hẹn hò</td>
            <td colspan="2"><%=Html.Encode(Model.UserOjbLikeDating)%></td>

            </tr>
            <tr>
            <td style="width: 233px">
            Thời gian liên lạc
            </td>
            <td colspan="2"><%=Html.Encode(Model.UserTimeContact)%></td>
            </tr>
            <%if (Model.UserIsVIP)
              { %>
             <tr>
            <td style="width: 233px">Video</td>
            
            <td style="width:380px">
            <%if (!String.IsNullOrEmpty(Model.UserVideoUpload))
              { %>
              
                <%= Html.FlashPlayerEmbed(ResolveClientUrl("~/Content/Flash/Player.swf"), "", 400, 300,
                                    new { flashvars = "file=" + Model.UserVideoUpload.ToString() + "&autostart=false", allowscriptaccess = "always", allowfullscreen = "true" })%>                           


            
            <div class="ui-widget"> 
                <% using (Ajax.BeginForm("ShowVideoOnUserDetails", new { id = Model.UserID }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "videoUser" }))
                   {%>        
                <input type="submit" value="Xem Video" />
                <%=Html.ActionLink("Quản lý Video", "Index","VideoShareManagement")%>&nbsp;|&nbsp;
                <%=Html.ActionLink("Xóa Video", "DeleteVideoByUser", new { usId = Model.UserID })%>
                 
                <br />
                <br />   
                <div id="videoUser">
                </div> 
                <br />
                </div>
                
            </td>
            <%}} %>
            <% using (Html.BeginForm("ProcessUploadVideo", "MembersManagement", new { id = Model.UserID }, FormMethod.Post, new { enctype = "multipart/form-data" }))
               {%>
            <td style="height:300px">
             <input type="file" name='videoUpload' id='video'/>
             <input id="btAdd" type="submit"  value="Up Video" onclick="return CheckInput()"/>
             <div id="dvEmail" style="visibility:collapse"> Chọn video trước khi tải.</div>
            
            </td>
             <%
                }
                   }
              
               %>
            </tr>
            <tr>

            <%--<td></td>--%>
           <td colspan="3" align="center">
                <a href="<% =Url.Action("Edit",new{id=Model.UserID}) %>"><img src="../../../Images/admin_edit.png" alt="Sửa"/></a>
                    &nbsp;
                 <%if (Session["Type"] != null)
                   {
                       if (Session["Type"].ToString() == "Admin")
                       { %>
                    <a href="<% =Url.Action("DeleteUser",new{id=Model.UserID}) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>
                    &nbsp;
                    
                    <%if (Model.UserStatus == "DeActivate")
                      { %>
                      <a href="<% =Url.Action("ActiveUser",new{id=Model.UserID,view="Details"}) %>"><img src="../../../Images/active.png" alt="Active" onclick="return ConfirmActive()"/></a>
                     
                     <%}
                      else
                      {%>
                     <a href="<% =Url.Action("DeactivateUser",new{id=Model.UserID,view="Details"}) %>"><img src="../../../Images/deactive.png" alt="Deactivate" onclick="return ConfirmDeActive()"/></a>
                     <%}
                       }
                   } %>
                    
           </td>
            </tr>
           
            </table>
    <%} %>
    </div>
     <script type="text/javascript">
         
         function CheckInput() {
             var valid = true;
             if ($('#video').val().toString() == '') {
                 return false;
             }
         }

         function ShowUpGrade() {
             $("#pop").css("visibility", "visible");
             $("#UpgradeVIP").css("visibility", "collapse");
         }
         function HiddenPop() {
             $("#pop").css("visibility", "collapse");
             $("#UpgradeVIP").css("visibility", "visible");
             $("#dvValidate").css("visibility", "collapse");
         }
         function CheckInputVIP() {
             var dt = document.getElementById("datepicker5").value;
             var period = $("#VIPPeriod").val();
             var nub = Number(period);
             if (dt == "" || period == 0 ) {
                 $("#dvValidate").css("visibility", "visible");
                 return false;
             }
             else {
                 $("#dvValidate").css("visibility", "collapse");
                 return true;
             }

            
         }
    </script>		
    <script src="../../../Scripts/jquery.ui.datepicker.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.ui.core.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#datepicker5").datepicker();
        });

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


</asp:Content>
