<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Album>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="title_top_user"> <a><%=Html.Encode(Model.User.UserFullName) %></a>     / Album/Cập nhật thông tin</div>

    <table style="width:100%;">
    <tr>
            <td colspan="2"><hr /></td>
        </tr>
        <tr>
            <td style="width:70%;" valign="top">
            <%using (Html.BeginForm("EditInfo", "MemberPhoto", FormMethod.Post, new { enctype = "multipart/form-data" }))
              { %>
                <table style="width:100%;">
                    <tr>
                        <td class="message_title_left">
                            Tên Album</td>
                        <td>
                            <%=Html.TextBoxFor(model => Model.AlbumName, new { Style = "width:400px;border:1px solid #B4C6DC" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>  
                    <tr>
                        <td class="message_title_left">
                            Mô tả album
                        </td>
                        <td>                            
                            <%=Html.TextAreaFor(model => Model.Description, new { Style = "width:400px;border:1px solid #B4C6DC" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>                    
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <input id="btnAdd" type="submit" class="btn_user_update" value="Cập nhật" />
                        </td>
                    </tr>
                    </table>
                <%} %>
                </td>              
        </tr>
        </table>

</asp:Content>
