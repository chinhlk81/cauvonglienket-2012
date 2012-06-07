<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MenuConfig>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Liên hệ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="title_menu">
    
    Liên hệ

    </div>
    <div class="content_menu">
            
            <div  style="text-align:left">
                  <%=Model.Contents %>
          </div>
          <div><br /></div>
				<%using (Html.BeginForm("LienHe", "Home", FormMethod.Post, new { enctype = "multipart/form-data" }))
      {%>
                        <div><%=Html.Encode(ViewData["MailSuccess"])%><%=Html.Encode(ViewData["mailFail"])%></div>
						<table border="0" cellpadding="0" cellspacing="0" width="450px" >
                        
						  <tbody>
                          <tr>
                          
							    <td align="right" valign="middle" width="150">Họ và tên bạn (*):</td>
							    <td width="300">
                                <div>    <%=Html.TextBox("txtName", "", new { style = "width: 250px" })%></div>
                                </td>
                                
						  </tr>
                          <tr>
                          
							    <td align="right" valign="middle" width="150">&nbsp;</td>
							    <td width="300">
                                    <div id="dvName" style="Visibility:collapse;color:Red">Vui lòng nhập tên của bạn</div></td>
                                
						  </tr>
						  <tr>
							<td align="right" valign="middle">Địa chỉ email (*):</td>
                            <td valign="middle">
                            <div><%=Html.TextBox("txtEmail", "", new { style = "width: 250px" })%>
                            </div>
                            </td>
						  </tr>
						  <tr>
							<td align="right" valign="middle">&nbsp;</td>
                            <td valign="middle">
                                <div id="dvEmail" style="Visibility:collapse;color:Red">Vui lòng nhập Email của bạn</div></td>
						  </tr>
						  <tr>
							<td align="right" valign="middle">Số điện thoại:</td>
							<td>
                           <div> <%=Html.TextBox("txtPhone", "", new { style = "width: 250px" })%></div>
							
                            </td>

						  </tr>

						  <tr>
							<td align="right" valign="middle">&nbsp;</td>
							<td>
                                <div id="Div1" style="Visibility:collapse;color:Red">Vui lòng nhập sổ điện thoại của bạn</div></td>

						  </tr>

						  <tr>
							<td align="right">Thông tin (*) :</td>
							<td>
                            <div>  <%=Html.TextArea("txtaContent", "", new { style = "width: 250px" })%></div>
							
                            </td>
						  </tr>

						  <tr>
							<td align="right">&nbsp;</td>
							<td>
                                <div id="dvContent" style="Visibility:collapse;color:Red">Vui lòng nhập nội dung liên lạc</div></td>
						  </tr>

						   <tr>

							<td align="right" valign="middle"></td>
							<td>
							 <input name="submit" id="button" class="btn_dangky_home" value="Gửi đi" type="submit" onclick="return CheckInput()"/>
							 <input name="txt_hid" value="0" type="hidden"/>

							</td>
						  </tr>

						</tbody></table>
				  <%} %>
                    
    <script type="text/javascript">
            $( function ()
             {
                $('#submit').click(CheckInput);
             }
            );
            $(function () 
            {
                $("#txtName").focusout(CheckName);
            });
            $(function()
            { 
                $("#txtEmail").focusout(CheckEmail);
             });
            $(function()
            {
              $('#txtaContent').focusout(CheckContent);
            });

      function CheckName() {
                if ($('#txtName').val() == "") {
                    $('#dvName').css("visibility", "visible");
	                            return false;
	                        }
	                        else {
	                            $('#dvName').css("visibility", "hidden");
	                            return true;
	                        }
	                    }


	                    function CheckContent() {
                    if ($('#txtaContent').val() == "") {
                        $('#dvContent').css("visibility", "visible");
                        return false;
                    } else {
                        $('#dvContent').css("visibility", "hidden");
                        return true;
                    }
                }

                function CheckEmail() {
                    if ($('#txtEmail').val() == null) {
                        $('#dvEmail').css('visibility', 'visible');
                        return false;
                    } else {
                        var emailSyntax = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
                        var emailInput = $('#txtEmail').val();
                        if (emailSyntax.test(emailInput)) {
                            $('#dvEmail').css('visibility', 'hidden');
                            return true;
                        } else {
                            $('#dvEmail').css('visibility', 'visible');
                            return false;
                        }
                    } 
                }
                        function CheckInput() {
                            var valid = true;
                            if ($('#txtName').val() == "") {
                                $('#dvName').css("visibility", "visible");
                                valid= false;
                            }
                            else {
                                $('#dvName').css("visibility", "hidden");
                                
                            }

                            if ($('#txtaContent').val() == "") {
                                $('#dvContent').css("visibility", "visible");
                                valid = false;
                            } else {
                                $('#dvContent').css("visibility", "hidden");
                               
                            }

                            if ($('#txtEmail').val() == null) {
                                $('#dvEmail').css('visibility', 'visible');
                                valid = false;
                            } else {
                                var emailSyntax = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
                                var emailInput = $('#txtEmail').val();
                                if (emailSyntax.test(emailInput)) {
                                    $('#dvEmail').css('visibility', 'hidden');
                                   
                                } else {
                                    $('#dvEmail').css('visibility', 'visible');
                                    valid = false;
                                }

                                return valid;
                    } 
                }
                   
    </script>		


           	</div>
	   
     

</asp:Content>
