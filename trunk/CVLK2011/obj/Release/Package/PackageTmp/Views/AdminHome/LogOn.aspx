<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Admin>" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>Cauvonglienket: Login Page</title>


<link rel="stylesheet" href="../../Styles/screen.css" type="text/css"/>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/Admin/jquery.js"></script>
     <% Html.EnableClientValidation(); %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#UserName").focus();
        });
    
    </script>
	
</head>

<body class="login">

<div class="login-box">
<div class="login-border">
<div class="login-style">
	<div class="login-header">
		<div class="logo clear">
			<img src="../../Images/logo-admin.png" alt="" class="picture" width="60px" />
			<span class="textlogo">
				<span class="title">ADMIN LOGIN</span>
				<span class="text">CauVongLienKet.Com</span>
			</span>
		</div>
	</div>
	 <% using (Html.BeginForm("LogOn", "AdminHome", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
		
		<div class="login-inside">
			<div class="login-data">
				<div class="row clear">
					<label for="user">Username:</label>
    					 <%=Html.TextBoxFor(model => model.UserName, new { Style = "width:160px" })%>
                         <%=Html.ValidationMessageFor(model=>model.UserName) %>
    				</div>
 				<div class="row clear">
					<label for="password">Password:</label>
					<%=Html.PasswordFor(model => Model.Password, new { Style = "width:160px" })%>
                    <%=Html.ValidationMessageFor(model=>Model.Password) %>
				</div>
				<input type="submit"  class="button" value="Login" />
			</div>
			<p>&nbsp;</p>
		</div>
		<div class="login-footer clear">
			<span class="remember">
				<input type="checkbox" class="checkbox" checked="checked" id="remember" /> <label for="remember">Remember</label>
			</span>
			<a href="<%=Url.Action("Index","Home") %>" class="button green fr-space">Trở về trang chủ</a>
		</div>
  <%} %>
</div>
</div>
</div>

  

</body>
</html>
