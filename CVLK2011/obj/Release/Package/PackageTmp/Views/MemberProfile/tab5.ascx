<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.User>" %>
<%using (Html.BeginForm("tab5", "MemberProfile", FormMethod.Post, new { enctype = "multipart/form-data" }))
 { %>
 <div id="tab-5">
        <table class="table_edit_member2">
            <tr>
            <td colspan="3" >
                    &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                liệt kê các màu bạn yêu thích</td>
            </tr>
            <tr>
            <td colspan="3" >
                    <%= Html.HiddenFor(model => model.UserID)%>

                    <%=Html.TextAreaFor(Model => Model.UserFavColor, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserFavColor) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                mỗi thông tin cách nhau dấu &quot;,&quot;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Món ăn yêu thích</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserFavFoods, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserFavFoods) %>
                    </td>
            </tr>
            <tr>
            <td colspan="3" >
            
                mỗi thông tin cách nhau dấu &quot;,&quot;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Nhập thể loại sách, tên sách mà bạn yêu thích hoặc tâm đắc</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserReadingBook, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserReadingBook) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                mỗi thông tin cách nhau dấu &quot;,&quot;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Mẫu người yêu thích</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserPeopleLike, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserPeopleLike) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Mẫu người không thích</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserPeopleDislike, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserPeopleDislike) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Sở thích riêng</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserHobby, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserHobby) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                mỗi thông tin cách nhau dấu &quot;,&quot;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Yêu cầu riêng</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserRequirements, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserRequirements) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Mong muốn</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserHope, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserHope) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Đối tượng muốn tìm</td>
            </tr>
            <tr>
            <td colspan="3" >
            
                    <%=Html.TextAreaFor(Model=>Model.UserOjbLikeDating, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(Model=>Model.UserOjbLikeDating) %></td>
            </tr>
            <tr>
            <td colspan="3" >
            
                Video Updload</td>
            </tr>
            <tr>
            <td align="right">
            
                <input id="Button19" type="submit" value="Lưu" class="btn_user_update" /></td>
            <td >
            
                    &nbsp;</td>
            <td align="left">
                    <input id="Button20" type="reset" value="hủy" class="btn_user_update" /></td>
            </tr>
        </table>
    </div>
 <%} %>