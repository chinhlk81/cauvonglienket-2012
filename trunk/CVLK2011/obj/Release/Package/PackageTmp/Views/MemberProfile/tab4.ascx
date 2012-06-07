<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.User>" %>
<%using (Html.BeginForm("tab4", "MemberProfile", FormMethod.Post, new { enctype = "multipart/form-data" }))
 { %>
<div id="tab-4">
        <table class="table_edit_member"cellpadding=0 cellspacing=0>
            <tr>
            <td style="width:100px;text-align:right">
                Trình độ văn hóa</td>
            <td style="width:10px;padding-left:5px;">
            
                    :</td>
                <td>
                    <%= Html.HiddenFor(model => model.UserID)%>

                    <%: Html.DropDownList("UserLevel", new[] {
                                                new SelectListItem{Text="Dưới PTTH",Value="Dưới PTTH"},
                                                new SelectListItem{Text="PTTH",Value="PTTH"},
                                                 new SelectListItem{Text="Trung học chuyên nghiệp/Cao đẳng",Value="Trung học chuyên nghiệp/Cao đẳng"},
                                                new SelectListItem{Text="Đại học",Value="Đại học"},
                                                new SelectListItem{Text="Cao học",Value="Cao học"},
                                                new SelectListItem{Text="Tiến sĩ",Value="Tiến sĩ"},
                                                new SelectListItem{Text="Khác",Value="Khác"}
                                               
                                                },"--Chọn--") %>   
                                                <%=Html.ValidationMessageFor(Model=>Model.UserLevel) %>
				</td>
            </tr>
            <tr>
           <td style="width:100px;text-align:right">
            
                Nghề nghiệp</td>
             <td style="width:10px;padding-left:5px;">
            
                    :</td>
                <td>
                    <%=Html.TextBoxFor(Model=>Model.UserCareer, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserCareer) %>
                    </td>
            </tr>
            <tr>
            <td style="width:100px;text-align:right">
            
                Vị trí công việc</td>
             <td style="width:10px;padding-left:5px;">
            
                    :</td>
                <td>
                    <%=Html.TextBoxFor(Model=>Model.UserJobPosition, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserJobPosition) %></td>
            </tr>
            <tr>
            <td style="width:100px;text-align:right">
            
                Mức lương</td>
             <td style="width:10px;padding-left:5px;">
            
                    :</td>
                <td>
                    <%=Html.TextBoxFor(Model => Model.UserWage, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserWage) %>
                    </td>
            </tr>
            <tr>
          <td style="width:100px;text-align:right">
            
                Thời gian làm việc</td>
           <td style="width:10px;padding-left:5px;">
            
                    :</td>
                <td>
                    <%=Html.TextBoxFor(Model => Model.UserWorkingTime, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserWorkingTime) %></td>
            </tr>
            <tr>
            <td align="right">
            
                    <input id="Button3" type="submit" value="Lưu" class="btn_user_update"/></td>
            <td >
            
                    &nbsp;</td>
                <td>
                    <input id="Button4" type="reset" value="Hủy" class="btn_user_update" /></td>
            </tr>
        </table>
    </div>
    <%} %>