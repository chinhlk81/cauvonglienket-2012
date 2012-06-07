<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.GetUserByID_Result>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thông tin thành viên
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <div class="title_top_user"> <a><%=Model.UserFullName %></a>  / Thông tin cá nhân</div>
<%using (Html.BeginForm("Index", "MemberProfile", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
        <table class="table_info_member" cellpadding="0" cellspacing="0">
               <%
    int id = 0;
    if (Session["CurrentUserID"] != null)
        id = Convert.ToInt32(Session["CurrentUserID"].ToString());

    if (id == Convert.ToInt32(Session["GuestuserID"]))
    {
                 %>
            <tr>
                <td class="td_edit_user" colspan="2">
            <h3><img src="../../../Images/icon_info_arrow.gif" alt=""/> &nbsp; Thông tin cơ bản</h3>
                </td>
                <td align="right" class="td_edit_user">
               
             
                  <img src="../../../Images/icon_edit_user.png" alt=""/> 
                <a href="<%=Url.Action("Edit",new {id = id}) %>#tab-1">Chỉnh sửa</a>
               

                 
                 </td>
            </tr>
            <tr>
            <td>
            
                &nbsp;</td>
            <td>
            
                &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
            <td>
            
                Họ Tên</td>
            <td>
            
                :</td>
                <td >
                    <%=Html.Encode(Model.UserFullName)%></td>
            </tr>
            <tr>
            <td>
            
                Ngày Sinh</td>
            <td>
            
                :</td>
                <td >
                
                     <%=Html.Encode(Model.UserBirthday.ToShortDateString())%>
                     </td>
            </tr>
            <tr>
            <td>
            
                Giới tính</td>
            <td>
            
                :</td>
                <td >
                    <%=Html.Encode(Model.UserGender)%></td>
            </tr>
            <tr>
            <td>
            
                Email</td>
            <td>
            
                :</td>
                <td >
                    <%=Html.Encode(Model.UserEmail)%></td>
            </tr>
            <tr>
            <td>
            
                Số CMND</td>
            <td>
            
                :</td>
                <td >
                    <%=Html.Encode(Model.UserIDCard)%></td>
            </tr>
            <tr>
            <td>
            
                &nbsp;</td>
            <td>
            
                &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <%} %>
            <tr>
            <td class="td_edit_user" colspan="2">
            <h3><img src="../../../Images/icon_info_arrow.gif" alt=""/> &nbsp;Thông tin riêng tư</h3>
                </td>
            
                <td align="right" class="td_edit_user">
               
                <%
    int idTab2 = 0;
    if (Session["CurrentUserID"] != null)
        idTab2 = Convert.ToInt32(Session["CurrentUserID"].ToString());
    if (idTab2 == Convert.ToInt32(Session["GuestuserID"]))
    {
                 %>
                  <img src="../../../Images/icon_edit_user.png" alt=""/> 
                <a href="<%=Url.Action("Edit",new {id = idTab2}) %>#tab-2">Chỉnh sửa</a>
                <%}%>
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
            <td>
            
                Cân nặng</td>
            <td>
            
                :</td>
                <td>
                    <%=Html.Encode(Model.UserWeight)%></td>
            </tr>
            <tr>
            <td>
            
                Chiều cao</td>
            <td>
            
                :</td>
                <td>
                    <%=Html.Encode(Model.UserHeight)%></td>
            </tr>
            <tr>
            <td>
            
                Tình trạng hôn nhân</td>
            <td>
            
                :</td>
                <td>
                    <%=Html.Encode(Model.UserMaritalStatus)%></td>
            </tr>
            <tr>
            <td>
            
                tôn giáo</td>
            <td>
            
                :</td>
                <td>
                    <%=Html.Encode(Model.UserReligion)%></td>
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
            <td class="td_edit_user" colspan="2">
            <h3><img src="../../../Images/icon_info_arrow.gif" alt=""/> &nbsp;Thông tin nơi ở - liên lạc</h3>
                </td>
            
                <td align="right" class="td_edit_user">
                
                <%
    int idTab3 = 0;
    if (Session["CurrentUserID"] != null)
        idTab3 = Convert.ToInt32(Session["CurrentUserID"].ToString());
    if (idTab3 == Convert.ToInt32(Session["GuestuserID"]))
    {
                 %>
                  <img src="../../../Images/icon_edit_user.png" alt=""/> 
                <a href="<%=Url.Action("Edit",new {id = idTab3}) %>#tab-3">Chỉnh sửa</a>
                <%}%>
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
            <td>
            
                Địa chỉ</td>
            <td>
            
                :</td>
                <td>
                    <%=Html.Encode(Model.UserAddLine)%></td>
            </tr>
            <tr>
            <td>
            
                Tỉnh thành</td>
            <td>
            
                :</td>
                <td>
                    <%=Html.Encode(Model.UserAddCity)%></td>
            </tr>
            <tr>
            <td >
            
                Điện thoại
              
            </td>
            <td >
            
                :</td>
            <td>
                <%=Html.Encode(Model.UserPhone)%></td>
            </tr>
            <tr>
            <td >
            
                &nbsp;</td>
            <td >
            
                &nbsp;</td>
            <td>
                &nbsp;</td>
            </tr>
            <tr>
             <td class="td_edit_user" colspan="2">
           <h3><img src="../../../Images/icon_info_arrow.gif" alt=""/> &nbsp;Học vấn và nghề nghiệp</h3>
                    </td>
           
                <td align="right" class="td_edit_user">
                
                <%
    int idTab4 = 0;
    if (Session["CurrentUserID"] != null)
        idTab4 = Convert.ToInt32(Session["CurrentUserID"].ToString());
    if (idTab4 == Convert.ToInt32(Session["GuestuserID"]))
    {
                 %>
                  <img src="../../../Images/icon_edit_user.png" alt=""/> 
                <a href="<%=Url.Action("Edit",new {id = idTab4}) %>#tab-4">Chỉnh sửa</a>
                <%}%>
                </td>
            </tr>
            <tr>
            <td >
            
                &nbsp;</td>
            <td >
            
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td >
            
                Trình độ văn hóa</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserLevel)%></td>
            </tr>
            <tr>
            <td >
            
                Nghề nghiệp</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserCareer)%></td>
            </tr>
            <tr>
            <td >
            
                Vị trí công việc</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserJobPosition)%></td>
            </tr>
            <tr>
            <td >
            
                Mức lương</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserWage)%></td>
            </tr>
            <tr>
            <td >
            
                Thời gian làm việc</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserWorkingTime)%></td>
            </tr>
            <tr>
            <td >
            
                    &nbsp;</td>
            <td >
            
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
             <td class="td_edit_user" colspan="2">
                   <h3><img src="../../../Images/icon_info_arrow.gif" alt="" /> &nbsp;Sở thích và yêu cầu riêng</h3></td>
           
                <td align="right" class="td_edit_user">
                   
                    <%
    int idTab5 = 0;
    if (Session["CurrentUserID"] != null)
        idTab5 = Convert.ToInt32(Session["CurrentUserID"].ToString());
    if (idTab5 == Convert.ToInt32(Session["GuestuserID"]))
    {
                         %>
                        <img src="../../../Images/icon_edit_user.png" alt=""/> 
                    <a href="<%=Url.Action("Edit",new {id = idTab5}) %>#tab-5">Chỉnh sửa</a>
                    <%}%>
                    </td>
            </tr>
            <tr>
            <td >
            
                &nbsp;</td>
            <td >
            
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td >
            
                Màu yêu thích</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserFavColor)%></td>
            </tr>
            <tr>
            <td >
            
                Món ăn yêu thích</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserFavFoods)%></td>
            </tr>
            <tr>
            <td >
            
                Loại sách yêu thích</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserReadingBook)%></td>
            </tr>
            <tr>
            <td >
            
                Thú cưng yêu thích</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserFavPet)%></td>
            </tr>
            <tr>
            <td >
            
                Mẫu người yêu thích</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserPeopleLike)%></td>
            </tr>
            <tr>
            <td >
            
                Mẫu người không thích</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserPeopleDislike)%></td>
            </tr>
            <tr>
            <td >
            
                Sở thích riêng</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserHobby)%></td>
            </tr>
            <tr>
            <td >
            
                Yêu cầu riêng</td>
            <td >
            
                    :</td>
                <td>
                   <%=Html.Encode(Model.UserRequirements)%></td>
            </tr>
            <tr>
            <td >
            
                Mong muốn</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserHope)%></td>
            </tr>
            <tr>
            <td >
            
                Đối tượng muốn tìm</td>
            <td >
            
                    :</td>
                <td>
                    <%=Html.Encode(Model.UserOjbLikeDating)%></td>
            </tr>
            <tr>
            <td >
            
                Video Updload</td>
            <td >
            
                    :</td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
       <% } %>
</asp:Content>
