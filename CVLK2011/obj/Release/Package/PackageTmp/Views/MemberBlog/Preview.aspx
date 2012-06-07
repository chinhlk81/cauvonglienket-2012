<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Blog>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Preview Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   


   

    <table style="width:100%;">
        <tr>
            <td colspan="2" style="font-size:14px;">
                <b><%=Html.Encode(Model.BlogTitle) %></b></td>
        </tr>
        <tr>
            <td style="width: 178px">
                <%=Html.Encode(Model.Datepost) %>
            </td>
            <td>
               <a href="<%=Url.Action("Edit",new { id = Model.BlogID } )%>"><img src="../../Images/admin_edit.png" alt="Sửa" /></a> |<a href="<%=Url.Action("Delete",new { id = Model.BlogID }) %>"><img src="../../Images/admin_xoa.png" alt="Xóa" /></a></td>
        </tr>
        <tr>
            <td colspan="2">
                <%=Model.BlogContent %></td>
                </tr>
        <tr>
            <td colspan="2"><hr /></td>
        </tr>
        <tr>
            <td style="width: 178px">
                [icon] <a href="">Bình Luận</a></td>
            <td align="right">
                2 lượt xem | 0 bình luận</td>
        </tr>
        <tr>
            <td colspan="2"><hr /></td>
        </tr>
        <tr>
            <td colspan="2">
                <table style="width:100%;">
                    <tr>
                        <td style="width: 50px;" rowspan="4" valign="top">
                            <img alt="" src="../../../Images/friends.jpg" style="width:50px; height:50px;" /></td>
                        <td>
                        <a href="">Nguyễn Quang Hoàng</a> nói</td>
                    </tr>
                    <tr>
                        <td>
                            Thiệt là một trận đấu có nhiều điều để nói.<br />
                            <font color="#800080">tình huống đánh cùi chỏ của Wayne Rooney</font></a> được 
                    cho là nghiêm trọng hơn trong trận đấu với Wigan tại Ngoại hạng Anh cuối tuần 
                    trước. Một tờ báo thân Chelsea đã liên kết hai sự việc trên trong một bài viết 
                    mang tên: &quot;Chiếc thẻ vàng của Balotelli quả là sự nhạo báng đối với vụ thoát tội 
                    của Rooney&quot;.
                            </td>
                        
                    </tr>
                    <tr>
                        <td><img alt="blank" src="../../../Images/blank.gif" style="width: 100%; height: 5px" /></td>
                    </tr>
                    <tr>
                        <td>
                            vào lúc 02:18 chiều 04/03/2011 </td>
                        
                    </tr>
                    <tr>
                        <td colspan="2"><hr /></td>
                    </tr>
                </table>
                <table style="width:100%;">
                    <tr>
                        <td style="width: 50px;" rowspan="4" valign="top">
                            <img alt="" src="../../../Images/friends.jpg" style="width:50px; height:50px;" /></td>
                        <td>
                        <a href="">Nguyễn Cường</a> nói</td>
                    </tr>
                    <tr>
                        <td>
                           <p class="Normal">
                    Hôm qua trọng tài Mark Clattenburg điều khiển trận đấu của Man City và Aston 
                    Villa ở vòng 5 Cup FA (tỷ số 3-0 nghiêng về đội chủ sân City of Manchester). 
                    Trong một tình huống tranh chấp khoảng đầu hiệp hai, cầu thủ Mario Balotelli đã 
                    thúc cùi chỏ vào mặt Chris Herd của đội khách và ngay lập tức phải nhận thẻ vàng 
                    từ Clattenburg.
                </p>
                            </td>
                        
                    </tr>
                    <tr>
                        <td><img alt="blank" src="../../../Images/blank.gif" style="width: 100%; height: 5px" /></td>
                    </tr>
                    <tr>
                        <td>
                            vào lúc 02:18 chiều 05/03/2011 </td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table style="width: 100%;">
                    <tr>
                        <td style="width:50px;">
                            <img alt="" src="../../../Images/friends.jpg" style="width:50px; height:50px;" />
                        </td>
                        <td>
                            &nbsp;
                            <textarea id="TextArea1" cols="100" name="S1" rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td align="right">
                            <input id="Button1" type="button" value="Bình luận" style="width:100px;"/></td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

   

    </form>

   

</asp:Content>
