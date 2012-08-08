<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<table style="width:20%; border-collapse:collapse; table-layout:auto; vertical-align:top; margin-bottom:15px; border:1px solid #CCCCCC;">
<thead><tr><th style="color:#FFFFFF; background-color:#666666; border:1px solid #CCCCCC; border-collapse:collapse; text-align:center; table-layout:auto; vertical-align:middle; padding:5px" colspan="2">Thống kê</th></tr></thead>
<tbody><tr style="color:#666666; background-color:#F7F7F7;">
 <td style="vertical-align:top; border-collapse:collapse; border-left:1px solid #CCCCCC; border-right:1px solid #CCCCCC; padding:5px">Trực tuyến:</td>
 <td style="vertical-align:top; border-collapse:collapse; border-left:1px solid #CCCCCC; border-right:1px solid #CCCCCC; padding:5px"><%if (Application["visitors_online"] != null)
                           { %><%=Application["visitors_online"].ToString()%><%} %></td></tr>
<tr style="color:#666666; background-color:#E8E8E8;">
<td style="vertical-align:top; border-collapse:collapse; border-left:1px solid #CCCCCC; border-right:1px solid #CCCCCC; padding:5px">Tổng lượt truy cập:</td>
<td style="vertical-align:top; border-collapse:collapse; border-left:1px solid #CCCCCC; border-right:1px solid #CCCCCC; padding:5px"><%if (Application["TatCa"] != null)
                           { %><%=Application["TatCa"].ToString()%><%} %></td></tr>
</tbody>
</table>
