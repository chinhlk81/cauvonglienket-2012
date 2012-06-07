<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.AdListViewModel>" %>

    <div style="width:889px;">
    
        <img src="http://cauvonglienket.com/images/bg-ad.gif" alt="Mua quảng cáo" />
    </div>
<div class="khungqc" style="width:882px">
     <table width="99%">
       <% if (Model.AdList != null)
        {  %>
        <tr>
        <%    
            foreach (var item in  Model.AdList)
            {
               
                {%>
                    <td width="20%">
                        <table>
                            <%--<tr>
                                <td colspan="2" align="center">
                                    <a class="fontqc" href="<%=item.AdLink%>"><%=item.AdTitle %></a>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                <a class="fontqc" href="<%=item.AdLink%>">
                                    <img class="imgqc" src="<%=item.AdImageThumbPath %>" alt="" /></a>
                                </td>
                                <td class="fontqc">
                                <%if (item.AdContent.Length > 100)
                                    {%>
                                    <%=item.AdContent.Substring(0, 100)%>...
                                    <%}
                                    else
                                    { %>
                                    <%=item.AdContent%>
                                    <%} %>
                                </td>
                            </tr>
                        </table>
                    </td>
                            <%}
                        }
                       %>
                        </tr>
                    <%} %>

    </table>
</div>
<div style="width:889px">
    <img class="bottomqc" src="http://cauvonglienket.com/images/bottom-ad.gif" alt="Mua quảng cáo" /></div>