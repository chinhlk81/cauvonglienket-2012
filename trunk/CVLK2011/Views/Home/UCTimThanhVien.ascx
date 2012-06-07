<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

 
<div id="tim-thanh-vien">
    <% using (Html.BeginForm("SearchUser","Home",FormMethod.Post))
       { %>
       
                        <div id="timthanhvien_title">
                                              
                        </div>
                        <div id="timthanhvien_main">
                        
                                    
                        
                            <table style="width:250px;line-height:36px;font-size:12px;color:#fff">
                                <tr>
                                    <td>
                                        Tôi tìm</td>
                                    <td>
                                    <%=Html.RadioButton("UserGender", "Male", true)%>
                                    Bạn nam</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                     <%=Html.RadioButton("UserGender", "Female")%> Bạn nữ</td>
                                </tr>
                                <tr>
                                    <td>
                                   </td>
                                    <td>
                                      Từ  <%:Html.DropDownList("YearFrom", (SelectList)ViewData["YearFrom"])%> đến
                                       <%:Html.DropDownList("YearTo", (SelectList)ViewData["YearTo"])%>  tuổi
                                   </td>
                                </tr>
                                <tr>
                                    <td>
                                        Tỉnh thành</td>
                                    <td >
                                    &nbsp;
                                 <%=Html.DropDownList("Province", new[] {
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
                                }, "--Chon--")%>
                  
                                </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                      <input type="submit" value="" style="background:url(../../Images/hengapmat_btn.gif) no-repeat top left;width:150px;height:36px;border:0px;cursor:pointer;
" />
                                    </td>
                                </tr>
                                
                            </table>
                        
                             <%} %>        
                        
                        </div>
</div>
                        
                       
                       
                   