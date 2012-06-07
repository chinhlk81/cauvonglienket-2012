<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<CVLK2011.Models.User>>" %>
<div>
    <div>Danh sách người nhận</div>
    <div><%=Html.ListBox("lstRecipients",(SelectList)ViewData["RecipientsList"]%></div>
</div>


