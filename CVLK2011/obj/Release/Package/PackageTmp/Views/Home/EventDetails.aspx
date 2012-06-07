<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.EventDetailsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết sự kiện
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="title_menu">
    
     Chi tiết sự kiện

    </div>
    <div class="content_menu">

    <table style="width:750px;text-align:left;font-weight:bold;color:#000">
            <tr>
                <td colspan="6" style="color:#3B5998;border-top:1px solid #ccc;background:#EEF1F5">
                   <%=Html.Encode(Model.CurrentEvent.EventTime) %> &nbsp;Ngày&nbsp;
                   
                        <%=Html.Encode(Model.CurrentEvent.EventDate.ToString("dd/MM/yyyy"))%>
                  
                   </td>
            </tr>
            <tr>
                <td rowspan="6" colspan="3" style="padding:10px; vertical-align:top" >
                    <img alt="hình sự kiện" src="<%=Model.CurrentEvent.EventImages %>"  width="240px" height="160px"/></td>
                <td colspan="3" style="color:#f30101">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="color:#f30101">
                   <%=Html.Encode(Model.CurrentEvent.EventName)%>
                 </td>
            </tr>
            <tr>
                <td style="width:130px">
                    Địa điểm</td>
                <td>
                    :</td>
                <td style="color:#3B5998">
                   <%=Html.Encode(Model.CurrentEvent.EventLocation)%></td>
            </tr>
            <tr>
                <td>
                    Đối tượng tham dự</td>
                <td>
                    :</td>
                <td style="color:#f30101">
                    <%=Html.Encode(Model.CurrentEvent.EventAgeJoint)%> </td>
            </tr>
            <tr>
                <td>
                   Thời gian </td>
                <td>
                    :</td>
                <td>
                        <%=Html.Encode(Model.CurrentEvent.EventDate.ToString("dd/MM/yyyy"))%>
                  </td>
            </tr>
             <tr>            
               <td colspan="6">&nbsp;
               <input type="button" id="Join" value="Đăng ký tham gia" class="btn_dangky_home" onclick="Show()"/>
               
               </td> 
         </tr>
            <tr>
            <td>
            
             <div id="dvPopup" style="width:300px;background:#f5fcfe;padding:10px; border:1px solid #ccc;visibility:collapse">
               <%using (Html.BeginForm("Join", "Home", FormMethod.Post))
                  {%>
                <table style="width:300px;text-align:left;">
                <tr>
                <td colspan="2"><%=Html.Hidden("EventName",Model.CurrentEvent.EventName) %></td>
                </tr>
                <tr>
                <td align="right" >
                Họ và tên
                </td>
                <td><%=Html.TextBox("txtName", "", new { Style= "border:1px solid #bddbe4;margin-left:10px" })%>
                </td>
                </tr>
                <tr>
                <td>
                    &nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvName" style="visibility:collapse">Nhập họ tên</div></td>
                </tr>
                <tr>
                <td align="right" >Số điện thoại</td>
                <td><%=Html.TextBox("txtPhone", "", new { Style = "border:1px solid #bddbe4;margin-left:10px" })%>
                </td>
                </tr>
                <tr>
                <td >&nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvPhone" style="visibility:collapse">Nhập số diện thoại</div></td>
                </tr>
                <tr>
                <td align="right">Email</td>
                <td><%=Html.TextBox("txtEmail", "", new { Style = "border:1px solid #bddbe4;margin-left:10px" })%>
                </td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                <td style="color:Red;font-size:80%;padding-left:10px;"><div id="dvEmail" style="visibility:collapse">Nhập địa chi Email</div></td>
                </tr>
                <tr>
                <td></td>
                <td>
               <div> <input type="submit" class="btn_user_update" name="submit" value="Đăng ký" onclick=" return CheckInput()" style="float:left" /><input type="button" class="btn_user_update" name="cancel" value="Hủy" onclick=" Cancel()" style="float:left"/></div>
                </td>
                </tr>
                </table>
                <%} %>

           </div>
           <br />
            </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="6" style="color:#3B5998;border-bottom:1px solid #ccc;" >
                  Giới thiệu:
               </td>
            </tr>
            <tr>
                <td colspan="6" style="padding:10px; vertical-align:top;text-align:justify" >
                   <%=Model.CurrentEvent.EventContent%>
                </td>
            </tr>
             
           
         <tr>
         
         </tr>
           <tr>
               <td colspan="6" style="color:#494747">Bình luận:
               </td> 
            </tr>
            <tr>
            
               <td colspan="6" >
               <div id="commentsHolder"> 
               <%Html.RenderPartial("EventComments"); %>
               </div>
               </td>
                
            </tr>
            
            <%--<tr>
            
               <td colspan="6">
               <br />
               Viết lời bình:</td>
               
            </tr>--%>
           <%-- <tr>
               <td colspan="6">
             
             
                 <% using (Html.BeginForm("CreateComment", "Home", FormMethod.Post, new { enctype = "multipart/form-data" }))
                    { %>
                    
                   <table style="width:400px;text-align:right">
                   
                                    <tr>
                                        <td style="width:200px;text-align:left">
                                           <%=Html.TextAreaFor(model => model.EventComment, new { Style = "width:400px;border:1px solid #B4C6DC;" })%>
                                           <%=Html.ValidationMessageFor(model => model.EventComment)%>   
                                           <div id="dvLogin" style="visibility:collapse;font-size:9px;color:Gray">Vui lòng đăng nhập trước khi bình luận </div>
                                            <div style="text-align:right"><input type="submit" name="btnsubmit" class="btn_dangky_home"  value="Bình luận" onclick="return CheckLogin()" />
                                            
                                            
                                            </div>
                                            </td>
                                    </tr>
                                    <tr>
                                        
                                        <td>
                                          <%=Html.HiddenFor(model=>Model.CurrentEvent.EventID)%>
                                        </td>
                                    </tr>
                                </table>
                <%} %>
           
        </td> 
             </tr>--%>
            
        </table>

     </div>
     <div class="footer_menu">
     <img alt="" src="../../Images/content_bottom.png" border="0"  />
    </div>
   <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
   
    <script type="text/javascript">
        $(function () {
            $('#Join').click(Show);
            $('#submit').click(CheckInput);

        }
            );


        function CheckLogin() {
            $.get("/Home/CheckLogin/", {},
	                    function (data) {
	                        if (data == "True") {

	                            $('#dvLogin').css('visibility', 'collapse');
                                return true;
	                        }
	                        else {
	                            $('#dvLogin').css('visibility', 'visible');
	                            return false;
	                        }
	                    });
        }
        function Show() {
            $('#dvPopup').css('visibility', 'visible');
            $('#Join').css("visibility", "collapse");

        }
        function Cancel() {
            $('#dvPopup').css('visibility', 'collapse');
            $('#Join').css('visibility', 'visible');
        }
        function CheckInput() {
            var valid = true;
            if ($('#txtName').val() == "") {
                $('#dvName').css("visibility", "visible");
                valid = false;
            }
            else {
                $('#dvName').css("visibility", "collapse");

            }

            if ($('#txtPhone').val() == "") {
                $('#dvPhone').css("visibility", "visible");
                valid = false;
            } else {
                $('#dvPhone').css("visibility", "collapse");

            }

            if ($('#txtEmail').val() == null) {
                $('#dvEmail').css('visibility', 'visible');
                valid = false;
            } else {
                var emailSyntax = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
                var emailInput = $('#txtEmail').val();
                if (emailSyntax.test(emailInput)) {
                    $('#dvEmail').css('visibility', 'collapse');

                } else {
                    $('#dvEmail').css('visibility', 'visible');
                    valid = false;
                }
                
                return valid;
            }
        }
    
    </script>
    
   
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    
    </asp:Content>