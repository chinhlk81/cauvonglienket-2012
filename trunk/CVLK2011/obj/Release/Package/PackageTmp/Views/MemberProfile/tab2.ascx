<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.User>" %>
 <%using (Html.BeginForm("tab2", "MemberProfile", FormMethod.Post, new { enctype = "multipart/form-data" }))
 { %>
 <div id="tab-2">
        <table class="table_edit_member"cellpadding=0 cellspacing=0>
            <tr>
          <td style="width:100px;text-align:right">
            
                Cân nặng</td>
           <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td>
                    <%= Html.HiddenFor(model => model.UserID)%>

                    <%=Html.TextBoxFor(model => model.UserWeight, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(model => model.UserWeight)%></td>
            </tr>
            <tr>
           <td style="width:100px;text-align:right">
            
                Chiều cao</td>
           <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td>
                    <%=Html.TextBoxFor(model => model.UserHeight, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(model => model.UserHeight)%></td>
            </tr>
            <tr>
           <td style="width:100px;text-align:right">
            
                Tình trạng hôn nhân</td>
            <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td>
                <%: Html.DropDownList("UserMaritalStatus", new[] {
                                                new SelectListItem{Text="Chưa kết hôn",Value="Chưa kết hôn"},
                                                new SelectListItem{Text="Đã kết hôn",Value="Đã kết hôn"},
                                                new SelectListItem{ Text="Đã ly hôn", Value="Đã ly hôn"},
                                                new SelectListItem{ Text="Góa vợ/Góa Chồng",Value= "Góa vợ/Góa Chồng"},
                                                }, "--Chọn--", new { @class = "text_fill_edit" })%> 
                    <%=Html.ValidationMessageFor(model => model.UserMaritalStatus)%>
                </td>
            </tr>
            <tr>
           <td style="width:100px;text-align:right">
            
                Tôn giáo</td>
           <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td>
                    <%: Html.DropDownList("UserReligion", new[] {
                        new SelectListItem{Text="Không",Value="Không"},
                        new SelectListItem{Text="Phật giáo",Value="Phật giáo"},
                        new SelectListItem{Text="Thiên chúa",Value="Thiên chúa"},
                        new SelectListItem{Text="Tin lành",Value="Tin lành"},
                        new SelectListItem{Text="Tôn giáo khác",Value="Tôn giáo khác"}
                        }, "--Chọn--",new { @class = "text_fill_edit" })%> 
                        <%=Html.ValidationMessageFor(Model => Model.UserReligion)%>
                        </td>
            </tr>
            <tr>
            <td align="right">
            
                <input id="Button13" type="submit" value="Lưu" class="btn_user_update" /></td>
            <td>
            
                &nbsp;</td>
                <td>
                    <input id="Button14" type="button" value="Hủy" class="btn_user_update" /></td>
            </tr>
        </table>
    </div>
       <%} %>