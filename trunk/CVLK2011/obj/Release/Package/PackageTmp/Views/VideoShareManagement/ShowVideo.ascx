<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.GetUserByID_Result>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>   
    <%= Html.FlashPlayerEmbed(ResolveClientUrl("~/Content/Flash/Player.swf"), "", 400, 300,
                                    new { flashvars = "file=" + Model.UserVideoUpload.ToString() + "&autostart=false", allowscriptaccess = "always", allowfullscreen = "true" })%>                           


    <% using (Html.BeginForm("ProcessUploadVideo", "VideoShareManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
        {%>
        <input type='file' name='videoUpload' id='video'/>
        <input id="btAdd" type="submit"  value="Cập nhật video" />
        <input type="hidden" name="id" value="<%= Model.UserID%>" />
        <%} %>
    <!--flash file path: '/Content/Flash/video.flv'-->
