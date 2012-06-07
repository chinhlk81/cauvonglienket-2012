<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MessageDetailsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết tin nhắn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td><h2><b><%=Html.Encode(Model.CurrentMessage.MessageTitle) %></b></h2></td>
              <td align="right"><img src="../../../Images/zme_icomsg.gif"  border="0" alt=""/><%:Html.ActionLink(" Viết tin nhắn", "Create", "MemberMessage")%></td>


        </tr>
    </table>
    <div class="td_edit_user_title">
        <table style="width:100%;">
            <tr>
                <td style="width:150px;">
                    <%=Html.ActionLink("Quay lại hộp tin","Index","MemberMessage") %></td>
                <td>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div>
        <img alt="blank" src="../../../Images/blank.gif" style="width: 100%; height: 10px" />
   </div> 
   <%if (Model != null)
      {
          if (Model.CurrentMessage != null)
          { %>
    <table style="width:100%;">
   
    <%if (Model.CurrentMessage.MessageType == "Admin")
      { %>
    <tr valign="top">
                    <td style="width:60px;" rowspan="2">
                      <img alt="Ban quản trị" src="../../../Images/Users/admin.jpg" style="width: 50px; height:50px" />
                   </td>
                    <td>
                        <div style="font-size:14px;">Ban quản trị</div> <a style="color:#777777" > <%=Html.Encode(Model.CurrentMessage.MessageDatetime)%></a>
                        </td>
                </tr>
<%}
      else
      { %>
                <tr valign="top">
                    <td style="width:60px;" rowspan="2">
                      <a href="<%=Url.Action("MessageSender",new {id= Model.CurrentMessage.FK_UserSendID }) %>"><img alt="<%=Model.CurrentMessage.UserNameSend %>" src="../<%=Model.CurrentMessage.UserPictureSend %>" style="width: 50px; height:50px" /></a>
                   </td>
                    <td>
                        <b><a href="<%=Url.Action("MessageSender",new {id= Model.CurrentMessage.FK_UserSendID })%>"> <%=Html.Encode(Model.CurrentMessage.FullNameSend)%></a></b> <a style="color:#777777" > <%=Html.Encode(Model.CurrentMessage.MessageDatetime)%></a>
                        </td>
                </tr>
                <%} %>
                <tr valign="top">

                    <td>
                      <%=Html.Encode(Model.CurrentMessage.MessageContent)%></td>
                      <td><a href="<%=Url.Action("Delete",new {id=Model.CurrentMessage.MessageID}) %>"> <img src="../../../Images/deleteIcon.gif" style="width: 16px; height: 16px" alt="Xóa" onclick="return ConfirmDeleteMemberSite()"/></a></td>
                </tr>
                <tr>
                    <td colspan="2"><hr /></td>
               </tr>
               
                </table>
            <table>
                 <tr> 
               <td>
               <%if (Model.CurrentMessage.MessageType != "Admin")
                 {%>
               <% Html.RenderPartial("ReplyMessage"); %>
               <%} %>
               </td>
               </tr>
                </table>
                          <%}
      } %>
    
</asp:Content>
