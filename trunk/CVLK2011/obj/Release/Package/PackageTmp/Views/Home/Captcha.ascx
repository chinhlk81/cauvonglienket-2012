<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>

<%=Html.Captcha("myCaptcha")%>
<div>
<%=Html.Encode(ViewData["NoCaptcha"]) %>
</div>
