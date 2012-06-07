<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.MemberShareVideoViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Xem Video Chia Sẻ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table>
       
        <% if (Model != null)
           {
            foreach (var item in Model.VideoList)
            { %>
                <tr>  
                 <td >
                Được chia sẽ từ:</td>            
            <td >
             <%=Html.Encode(item.User.UserFullName)%>    
            </td>
            <td align="right"><a href="<%=Url.Action("Delete","MemberVideo",new{id=item.VipVideoID})%>"><img src="../../../Images/deleteIcon.gif" style="width: 16px; height: 16px" alt="Xóa" onclick="return ConfirmDeleteMemberSite()" /></a></td>
            </tr>
            <tr>
            <td>
                Ngày gởi:</td>
            <td >
                <%=Html.Encode(item.DateCreate)%>
            </td>
            </tr>
            <tr>
            <td>
                Chia sẽ:</td>
            <td >
                    <%=Html.Encode(item.Description)%>
           </td>  
           </tr>
           
           <tr>
           <%if (!String.IsNullOrEmpty(item.VideoLink))
             { %>
               <%= Html.FlashPlayerEmbed(ResolveClientUrl("~/Content/Flash/Player.swf"), "", 400, 300,
                                    new { flashvars = "file=" + item.VideoLink.ToString() + "&autostart=false", allowscriptaccess = "always", allowfullscreen = "true" })%>                           
                                    <%} %>
        </tr>
         <%}
           }%>
        </table>
        <div class="pager">        
            <%: Html.PageLinks(Model.PagingInfo,
            x => Url.Action("Index", new { category=Model.CurrentVideo, page=x}))%>
        </div>
        <div id="video">
        </div>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
