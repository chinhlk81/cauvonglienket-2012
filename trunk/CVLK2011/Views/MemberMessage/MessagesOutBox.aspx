<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MemberMessageListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Hộp thư đi
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  
    <table style="width: 100%" class="td_edit_user_title">
        <tr>
            <td style="width:80px">
                Tin nhắn</td>
            <td align="right">
                    <input id="Text2" type="text"  style="width: 200px;border:1px solid #B4C6DC"/>&nbsp;<input id="Button4" type="button" value="Tìm tin nhắn" class="btn_user_update"/>
                </td>
            <td align="right"><img src="../../Images/zme_icomsg.gif"  border="0" alt=""/><%:Html.ActionLink(" Viết tin nhắn", "Create", "MemberMessage")%></td>
               </tr>
    </table>
     <%using (Html.BeginForm("DeleteMessageOutBox", "MemberMessage", FormMethod.Post ))
  { %>
   <fieldset>
    <table style="width: 100%;">
            <tr>
                <td align="left">
                    <input type="submit" name="Delete" value="Xóa" class="btn_user_update" onclick="return ConfirmDeleteMemberSite()" /></td>
                <td align="right">
                    <b>Hiển thị &nbsp;</b><%=Html.ActionLink("Hộp thư đến","Index","MemberMessage") %></td>
            </tr>
            <tr>
               <td colspan="3" align="left">
                Tất cả  &nbsp; &nbsp; <input type="checkbox"  class="checkall" />  
                <hr/>
                </td>
                
            </tr>
        </table>
        <table style="width:100%;">
        <% if (Model != null)
           { %>
        <%foreach (var item in Model.MessageList)
          { %>
            <tr>
                <td style="width:50px;">
               <img src="../../../Images/send.jpg" alt="Thư di" />
                </td>
                <td style="width:40px;">  <%=Html.CheckBox("cbox" + item.MessageID, Model.Checked, new { id = item.MessageID, @class = "checkbox_width" })%>
				</td>
                <td style="width:55px;">
                  <a href="<%=Url.Action("Index","MemberHome",new {id=item.FK_UserReceiptID})%>"><img alt="" src="<%=item.UserPicture %>" style="width:50px; height:50px;" /></a>
                </td>
                <td style="width:150px;" valign="middle">
                <div style="font-size:11px;"><a href="<%=Url.Action("Index","MemberHome",new {id=item.FK_UserReceiptID})%>"><%=Html.Encode(item.UserFullName) %></a></div>
                <div style="font-size:8px;"><%=Html.Encode(item.MessageDatetime) %></div>
                    </td>
                <td style="font-size:12px; font-style:oblique;" valign="middle">
                  <div><a href="<%=Url.Action("Details", new { id = item.MessageID })%>"><%=item.MessageTitle%></a></div>
                     
                    <div>
                    <%if (item.MessageContent.Length > 100)
                      { %>
                       
                    <%= Html.Encode(item.MessageContent.Remove(100))%>...
                    <%}
                      else
                      { %>
                       <%= Html.Encode(item.MessageContent)%>
                    <%} %>
                    </div>
                   </td>
                <td style="width:16px;">
                 <a href="<%=Url.Action("Delete",new {id=item.MessageID,box="Outbox",currentPage=Model.CurrentMessage }) %>"> <img src="../../Images/deleteIcon.gif" style="width: 16px; height: 16px" alt="Xóa" onclick="return ConfirmDeleteMemberSite()" /></a></td>
            </tr>
            <%}
           } %>
          
        </table>
         </fieldset>
     <%} %>
         <div class="pager">        
            <%: Html.PageLinks(Model.PagingInfo, x => Url.Action("MessagesOutBox", new { page = x, currentMessage = Model.MessageList }))%>
        </div>
          <script type="text/javascript">

              $(function () {
                  $('.checkall').click(function () {
                      $(this).parents('fieldset:eq(0)').find(':checkbox').attr('checked', this.checked);
                  });
              });

            
</script>
</asp:Content>
