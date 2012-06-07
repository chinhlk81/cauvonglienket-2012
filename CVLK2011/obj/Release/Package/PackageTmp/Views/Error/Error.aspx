<%@ Page Language="C#"  Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
</head>
<body>
<div>


     <h2><%= Html.Encode(ViewData["Title"]) %></h2>  
      <p><%= Html.Encode(ViewData["Description"])%></p>  

      </div>
      
      </body>
      </html>