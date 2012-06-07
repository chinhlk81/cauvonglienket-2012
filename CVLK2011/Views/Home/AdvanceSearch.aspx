<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AdvanceSearch
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <div class="title_menu">
    
     <img alt="" src="../../Images/timnangcao_title.png" border="0"  />

    </div>
    <div class="content_menu">



      <table style="width:100%;">
            <tr>
                <td>
                    [Icon]Tìm kiếm bạn bè</td>
                <td>
                    &nbsp;</td>
                <td>
                    --------------------------------------------</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Tên</td>
                <td>
                    :</td>
                <td>
                    <input id="Text3" type="text" /></td>
                <td>
                    <select name="cbo_sex" style="width: 80px;">
                    <option selected="selected" value="1">Giới tính</option>
                    <option value="2">Nam</option>
                    <option value="3">Nữ</option>
                    <option value="3">khác</option>
                                              </select></td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td>
                    :</td>
                <td>
                    <input id="Text4" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    nơi ở</td>
                <td>
                    :</td>
                <td>
                    <select name="cbo_province">
                        <option value="1" selected="selected">----------Chọn---------</option>
                        <option value="2">TP.Hồ Chí Minh</option>
                        <option value="3">Hà Nội</option>
                    </select></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <input id="Button4" type="button" value="Tìm" /><input id="Button5" 
                        type="button" value="Nhập lại" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    [icon] Tim theo thông tin riêng</td>
                <td>
                    &nbsp;</td>
                <td>
                    ------------------------------------------</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Tuổi</td>
                <td>
                    :</td>
                <td>
                    <input id="Text14" type="text" /></td>
                <td>
                    <input id="Text18" type="text" /></td>
            </tr>
            <tr>
                <td>
                    Chiều cao</td>
                <td>
                    :</td>
                <td>
                    <input id="Text15" type="text" /></td>
                <td>
                    <input id="Text17" type="text" /></td>
            </tr>
            <tr>
                <td>
                    cân nặng</td>
                <td>
                    :</td>
                <td>
                    <input id="Text16" type="text" /></td>
                <td>
                    <input id="Text19" type="text" /></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <input id="Button8" type="button" value="Tìm" /><input id="Button9" 
                        type="button" value="nhập lại" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    [icon] Tìm theo sở thích</td>
                <td>
                    &nbsp;</td>
                <td>
                    ----------------------------------------</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Màu sắc yêu thích</td>
                <td>
                    :</td>
                <td>
                    <input id="Text5" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Thức ăn yêu thích</td>
                <td>
                    :</td>
                <td>
                    <input id="Text6" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    loại sách thích đọc</td>
                <td>
                    :</td>
                <td>
                    <input id="Text7" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Thú cưng yêu thích</td>
                <td>
                    :</td>
                <td>
                    <input id="Text8" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Mẫu người ưa thích</td>
                <td>
                    :</td>
                <td>
                    <input id="Text20" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Mẫu người không thích</td>
                <td>
                    :</td>
                <td>
                    <input id="Text21" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Sở thích riêng</td>
                <td>
                    :</td>
                <td>
                    <input id="Text9" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    </td>
                <td>
                    </td>
                <td>
                    <input id="Button1" type="button" value="tìm" /><input id="Button3" 
                        type="button" value="nhập lại" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                   [icon] Tìm theo công việc</td>
                <td>
                    &nbsp;</td>
                <td>
                    ------------------------------------</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Nghề nghiệp</td>
                <td>
                    :</td>
                <td>
                    <input id="Text11" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Vị trí công việc</td>
                <td>
                    :</td>
                <td>
                    <input id="Text12" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Thời gian rỗi</td>
                <td>
                    :</td>
                <td>
                    <input id="Text13" type="text" /></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <input id="Button6" type="button" value="Tìm" /><input id="Button7" 
                        type="button" value="nhập lại" /></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

      	</div>
	   
        <div class="footer_menu">
    
     <img alt="" src="../../Images/content_bottom.png" border="0"  />
    </div>


</asp:Content>
