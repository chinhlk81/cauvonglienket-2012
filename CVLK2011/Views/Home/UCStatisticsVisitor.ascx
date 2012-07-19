<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<table>
<tr style="font-weight:bold">
<td colspan="2">Thống kê</td></tr>
<tr style="font-weight:bold">
<td>Hôm nay:</td><td><%if (Application["HomNay"] != null)
                           { %><%=Application["HomNay"].ToString()%><%} %></td></tr>
<tr style="font-weight:bold">
<td>Hôm qua:</td><td><%if (Application["HomQua"] != null)
                           { %><%=Application["HomQua"].ToString()%><%} %></td></tr>
<tr style="font-weight:bold">
<td>Tuần này:</td><td><%if (Application["TuanNay"] != null)
                           { %><%=Application["TuanNay"].ToString()%><%} %></td></tr>
<tr style="font-weight:bold">
<td>Tuần trước:</td><td><%if (Application["TuanTruoc"] != null)
                           { %><%=Application["TuanTruoc"].ToString()%><%} %></td></tr>
<tr style="font-weight:bold">
<td>Tháng này:</td><td><%if (Application["ThangNay"] != null)
                           { %><%=Application["ThangNay"].ToString()%><%} %></td></tr>
<tr style="font-weight:bold">
<td>Tháng trước:</td><td><%if (Application["ThangTruoc"] != null)
                           { %><%=Application["ThangTruoc"].ToString()%><%} %></td></tr>
<tr style="font-weight:bold">
<td>Tổng cộng:</td><td><%if (Application["TatCa"] != null)
                           { %><%=Application["TatCa"].ToString()%><%} %></td></tr>
<tr style="font-weight:bold">
 <td>Trực tuyến:</td><td><%if (Application["visitors_online"] != null)
                           { %><%=Application["visitors_online"].ToString()%><%} %></td></tr>
</table>
