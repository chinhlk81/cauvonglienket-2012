﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MemberMessageListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Hộp thư đến
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%using (Html.BeginForm("SearchAllMessagesByTitle", "MemberMessage", FormMethod.Post, new { enctype = "multipart/form-data" }))
  { %>
    <table style="width: 100%" class="td_edit_user_title">
        <tr>
            <td style="width:80px">
                Tin nhắn </td>
            <td align="right">
                    <%=Html.TextBox("messageTitle") %>&nbsp;<input id="btnSearchMessage" type="submit" value="Tìm tin nhắn" class="btn_user_update"/>
                </td>
            <td align="right"><img src="../../../Images/zme_icomsg.gif"  border="0" alt=""/><%:Html.ActionLink(" Viết tin nhắn", "Create", "MemberMessage")%>
            </td>
               </tr>
    </table>
<%} %>
<%using (Html.BeginForm("MessageAction", "MemberMessage", new { box = Model.box }, FormMethod.Post))
{ %>
<fieldset>
<table style="width: 100%;">
    <tr>
        <td align="left">
            <input type="submit" name="Read" value="Đã đọc" class="btn_user_update" />
            <input type="submit" name="Delete" value="Xóa" class="btn_user_update" onclick="return ConfirmDeleteMemberSite()"/>
            </td>
        <td align="right">
            <b>Hiển thị </b>
            <%=Html.ActionLink("Tất cả ", "Index", "MemberMessage")%> |
            <a href="<%=Url.Action("Index","MemberMessage",new {box="UnRead"}) %>">Chưa đọc</a>| 
            <a href="<%=Url.Action("Index","MemberMessage",new {box="IsRead"}) %>">Đã đọc</a>|
            <%=Html.ActionLink("Thư đi", "MessagesOutBox", "MemberMessage")%>
        </td>
    </tr>
    <tr align="left">
        <td colspan="3" align="left">
        Tất cả &nbsp; &nbsp; <input type="checkbox"  class="checkall" />  
        <div style="text-align:center"> <%= Html.Encode(ViewData["MessageResult"])%></div>
            <hr />
        </td>
    </tr>
</table>
    <% if (Model != null)
        {
            if (Model.MessageList != null)
            {
                if(Model.MessageList.Count > 0)
                {%>
                    <table style="width:100%;">
                    <%foreach (var item in Model.MessageList)
                        { 
                        %>
                        <tr>
                            <td style="width:50px;">
                            <% if (item.MessageUnRead == true)
                                { %>
                                <img src="../../../Images/unread.jpg" alt="Thư chưa đọc" />
                                <%}
                                else
                                {%>
                                    <img src="../../../Images/read.jpg" alt="Thư đã đọc" />
                                <%} %>
                            </td>
                            <td style="width:40px;">
                                <%=Html.CheckBox("cbox" + item.MessageID, Model.Checked, new { id = item.MessageID, @class = "checkbox_width" })%>
                            </td>
                            <td style="width:55px;">
                                <a href="<%=Url.Action("Index","MemberProfile",new {id=item.FK_UserSendID})%>"><img alt="" src="/<%=item.UserPicture %>" style="width:50px; height:50px;" /></a>
                            </td>
                            <td style="width:150px;" valign="middle">
                                <div style="font-size:11px;"><a href="<%=Url.Action("Index","MemberProfile",new {id=item.FK_UserSendID})%>"><%=Html.Encode(item.UserFullName)%></a></div>
                                <div style="font-size:10px;"><%=Html.Encode(item.MessageDatetime)%></div>
                            </td>
                            <td style="font-size:12px; font-style:oblique;" valign="middle">
                            <% if (item.MessageUnRead == true)
                                { %>
                                <div> <b>  <a href="<%=Url.Action("Details", new { id = item.MessageID })%>"><%=item.MessageTitle %></a></b></div>
                                <%}
                                else
                                { %>
                                    <div> <a href="<%=Url.Action("Details", new { id = item.MessageID })%>"><%=item.MessageTitle%></a></div>
                                <%} %>
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
                                <a href="<%=Url.Action("Delete",new {id=item.MessageID, box=Model.box,currentPage=Model.CurrentMessage }) %>"> <img src="../../../Images/deleteIcon.gif" style="width: 16px; height: 16px" alt="Xóa" onclick="return ConfirmDeleteMemberSite()" /></a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                <%}
                else
                {%>
                    <div><p>Không có tin nhắn nào</p></div>
                <%}
            } 
        }
    }%>
</fieldset>

<div class="pager">        
<%: Html.PageLinks(Model.PagingInfo, x => Url.Action("Index", new { page = x, currentMessage = Model.CurrentMessage }))%>
</div>

<script type="text/javascript">

    $(function () {
        $('.checkall').click(function () {
            $(this).parents('fieldset:eq(0)').find(':checkbox').attr('checked', this.checked);
        });
    });

            
</script>

</asp:Content>
