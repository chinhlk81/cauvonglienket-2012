<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tìm kiếm nâng cao
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%using (Html.BeginForm("AdvanceSearchResult", "MemberFriends", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
     <div class="title_top_user"> Tìm kiếm nâng cao</div>
    <div class="content_menu">



      <table style="width:400px">
             <tr>
                <td colspan="3" align="left" style="font-weight:bold;font-size:110%;color:#111118">
                    <img src="../../Images/i_search.gif" />&nbsp; Tìm theo thông tin cở bản</td>
            </tr>
            <tr>
                <td>
                    Tên</td>
                <td>
                    <%=Html.TextBoxFor(Model => Model.UserFullName, new { style = "width:200px;border:1px solid #8496BA" })%></td>
               
            </tr>
            <tr>
                <td>
                    Giới tính</td>
                <td>
                     <%: Html.DropDownList("UserGender", new[] {
                                                new SelectListItem{Text="Nam",Value="Male"},
                                                new SelectListItem{Text="Nữ",Value="Female"}
                                                }, "Chọn giới tính", new { style = "width:130px;border:1px solid #8496BA" })%></td>
               
            </tr>
            <tr>
                <td>
                    Email</td>
                <td  colspan="2">
                    <%=Html.TextBoxFor(Model => Model.UserEmail, new { style = "width:200px;border:1px solid #8496BA" })%> 
                    <%--<%=Html.ValidationMessageFor(Model => Model.UserEmail)%>--%>
                    </td>
            </tr>
            <tr>
                <td>
                    nơi ở</td>
                <td colspan="2">
                    <%: Html.DropDownList("UserAddCity", new[] {
                                new SelectListItem{Text="TP.Hồ Chí minh",Value="TP.Hồ Chí minh"},
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
                                }, "thuộc tỉnh thành", new { @class = "text_fill_register2" })%>
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="left" style="font-weight:bold;font-size:110%;color:#111118">
                    <img src="../../Images/i_search.gif" />&nbsp; Tìm theo thông tin riêng</td>
            </tr>
            <tr>
                <td>
                    Tuổi</td>
                <td colspan="2">
                  Từ : &nbsp; <%=Html.TextBox("AgeFrom", null, new { @style = "width: 55px;border:1px solid #8496BA" })%> &nbsp; Đến : &nbsp;<%=Html.TextBox("AgeTo", null, new { @style = "width: 55px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    Chiều cao</td>
                <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.UserHeight, new { @style = "width: 200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    cân nặng</td>
                <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.UserWeight, new { @style = "width: 200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
               <td colspan="3" align="left" style="font-weight:bold;font-size:110%;color:#111118">
                    <img src="../../Images/i_search.gif" />&nbsp; Tìm theo sở thích</td>
            </tr>
            <tr>
                <td>
                    Màu sắc yêu thích</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.UserFavColor, new { style = "width:200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    Thức ăn yêu thích</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.UserFavFoods, new { style = "width:200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    loại sách thích đọc</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.UserReadingBook, new { style = "width:200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    Thú cưng yêu thích</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.UserFavPet, new { style = "width:200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    Mẫu người ưa thích</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.UserPeopleLike, new { style = "width:200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    Mẫu người không thích</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.UserPeopleDislike, new { style = "width:200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td>
                    Sở thích riêng</td>
                <td colspan="2">
                    <%=Html.TextAreaFor(Model => Model.UserHobby, new { style = "width:200px;border:1px solid #8496BA" })%></td>
            </tr>
            <tr>
                <td colspan="3">
                    </td>
            </tr>
            <tr>
                <td colspan="3" align="left" style="font-weight:bold;font-size:110%;color:#111118">
                    <img src="../../Images/i_search.gif" />&nbsp; Tìm theo công việc</td>
            </tr>
            <tr>
                <td>
                    Nghề nghiệp</td>
                <td colspan="2">
                    <%: Html.DropDownList("UserCareer", new[] {
                                new SelectListItem{Text="IT - Phần cứng/ Mạng",Value="IT - Phần cứng/ Mạng"},
                                new SelectListItem{Text="IT - Phần mềm",Value="IT - Phần mềm"},
                                new SelectListItem{Text="Kinh doan",Value="Kinh doan"},
                                new SelectListItem{Text="Dịch vụ",Value="Dịch vụ"},
                                new SelectListItem{Text="Làm việc tự do",Value="Làm việc tự do"},
                                new SelectListItem{Text="Nghành nghề khác",Value="Nghành nghề khác"}
                                }, "Chọn", new { style = "width:200px;border:1px solid #8496BA" })%> 
                    </td>
            </tr>
            <tr>
                <td>
                    Vị trí công việc</td>
                <td colspan="2">
                    <%=Html.TextBoxFor(Model => Model.UserJobPosition, new { style = "width:200px;border:1px solid #8496BA" })%> 
                    </td>
            </tr>
            <tr>
                <td>
                    Thời gian rỗi</td>
                <td colspan="2">
                    <%: Html.DropDownList("UserTimeContact", new[] {
                                    new SelectListItem{Text="Bất kỳ lúc nào",Value="Bất kỳ lúc nào"},
                                    new SelectListItem{Text="Buổi sáng",Value="Buổi sáng"},
                                    new SelectListItem{Text="Buổi trưa",Value="Buổi trưa"},
                                    new SelectListItem{Text="Buổi chiều",Value="Buổi chiều"},
                                    new SelectListItem{Text="Buổi tối",Value="Buổi tối"}
                                    }, "Chọn", new { style = "width:200px;border:1px solid #8496BA" })%> 
                    </td>
               
            </tr>
            <tr>
                <td align="right">
                    <input name = "btnAdvanceSearch" id="Button6" type="submit" value="Tìm bạn" style="width:80px;"/></td>
                <td align="left" colspan="2">
                    <input name = "btnResetSearch" id="Button7" 
                        type="reset" value="nhập lại" style="width:80px;"/></td>
            </tr>
        </table>

      	</div>
	   
        <div class="footer_menu">
    
     &nbsp;</div>
<%} %>
</asp:Content>
