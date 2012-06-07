<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div>
<%using (Html.BeginForm("Join", "Home", FormMethod.Post))
  {%>
<table>
<tr>
<td>
Họ và tên
</td>
<td><%=Html.TextBox("txtName", "", new { Style="width:300px"})%></td>
<td><div id="dvName" style="visibility:hidden">Nhập họ tên</div></td>
</tr>
<tr>
<td>Số điện thoại</td>
<td><%=Html.TextBox("txtPhone", "", new { Style = "width:300px" })%></td>
<td><div id="dvPhone" style="visibility:hidden">Nhập số diện thoại</div></td>
</tr>
<tr>
<td>Email</td>
<td><%=Html.TextBox("txtEmail", "", new { Style = "width:300px" })%></td>
<td><div id="dvEmail" style="visibility:hidden">Nhập địa chi Email</div></td>
</tr>
<tr>
<td></td>
<td colspan="2">

<input type="submit" class="btn_user_update" name="submit" value="Đăng ký" onclick="SendMail()" /></td>
</tr>
</table>
<%} %>


</div>