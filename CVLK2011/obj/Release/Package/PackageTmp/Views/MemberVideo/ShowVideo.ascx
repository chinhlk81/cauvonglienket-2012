<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.GetUserByID_Result>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>   
    <%= Html.FlashPlayerEmbed(ResolveClientUrl("~/Content/Flash/Player.swf"), "", 400, 300,
                                    new { flashvars = "file=" + Model.UserVideoUpload.ToString() + "&autostart=false", allowscriptaccess = "always", allowfullscreen = "true" })%>                           


    <!--flash file path: '/Content/Flash/video.flv'-->
