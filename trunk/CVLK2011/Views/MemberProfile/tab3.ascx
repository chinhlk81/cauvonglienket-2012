<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.User>" %>
<%using (Html.BeginForm("tab3", "MemberProfile", FormMethod.Post, new { enctype = "multipart/form-data" }))
 { %>
    <div id="tab-3">
        <table class="table_edit_member"cellpadding=0 cellspacing=0>
            <tr>
            <td style="width:100px;text-align:right">
            
                Địa chỉ</td>
           <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td>
                    <%= Html.HiddenFor(model => model.UserID)%>

                    <%=Html.TextBoxFor(Model=>Model.UserAddLine, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserAddLine) %></td>
            </tr>
            <tr>
           <td style="width:100px;text-align:right">
            
                Tỉnh thành</td>
           <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td>
                   <%=Html.DropDownList("UserAddCity", ViewData["UserAddCity"] as SelectList, new { @class = "text_fill_edit" })%> 
                    <%=Html.ValidationMessageFor(Model=>Model.UserAddCity) %>
					</td>
            </tr>
            <tr>
           <td style="width:100px;text-align:right">
            
                Điện thoại
              
            </td>
            <td style="width:10px;padding-left:5px;">
            
                :</td>
            <td>
                <%=Html.TextBoxFor(Model=>Model.UserPhone, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserPhone) %></td>
            </tr>
            <tr>
            <td align="right">
                <input id="Button15" type="submit" value="Lưu" class="btn_user_update"/></td>
            <td >
            
                &nbsp;</td>
            <td>
                <input id="Button16" type="reset" value="Hủy"  class="btn_user_update"/></td>
        </tr>
    </table>
</div>
<%} %>