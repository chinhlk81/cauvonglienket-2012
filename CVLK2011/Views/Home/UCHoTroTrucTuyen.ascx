<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<CVLK2011.Models.OlineSupport>>" %>

 <div id="doingutuvan_title">
                 <img alt="" src="../../Images/hotrotructuyen_footer.gif" border="0"  />
            </div>

           

                    

                <table class="hotrotructuyen_table">
                <%if(Model!=null){
                      foreach(var item in Model){
                       %>
                    <tr>
                        <td>
                            <img alt="" src="../../Images/icon_phone.gif" border="0"  /> </td>
                        <td>
                            Hotline : </td>
                        <td >
                        &nbsp;<%=Html.Encode(item.OSPhone1)%></td>
                        <td >
                        &nbsp;-&nbsp;<%=Html.Encode(item.OSPhone2)%></td>
                    </tr>
                    <tr>
                        <td>
                             <img src="../../Images/icon_yahoo.gif" alt=""/>  </td>
                        <td>
                             Yahoo : </td>
                        <td>
                          <a href="ymsgr:sendIM?<%=item.OSYahoo1 %>">
 <img src="http://opi.yahoo.com/online?u=<%=item.OSYahoo1 %>&m=g&t=1" border="0" alt="Hỗ trợ khách hàng 24/24" align="absmiddle" /></a>
</td>
                        <td>
                           <a href="ymsgr:sendIM?<%=item.OSYahoo2 %>">
 <img src="http://opi.yahoo.com/online?u=<%=item.OSYahoo2 %>&m=g&t=1" border="0" alt="Hỗ trợ khách hàng 24/24" align="absmiddle" /></a>
</td>
                    </tr>
                    <tr>
                        <td>
                            <img src="../../Images/icon_skype.gif" alt=""/>  </td>
                        <td>
                            Skype : </td>
                        <td>
                            <a href="skype:<%=item.OSSkype1 %>?call">
<img src="http://download.skype.com/share/skypebuttons/buttons/call_green_transparent_70x23.png" border="0" width="70" height="23" alt="Skype Me™!" align="absmiddle" /></a>
</td>
                        <td>
                           <a href="skype:cauvonglienket2?chat">
 <img src="http://download.skype.com/share/skypebuttons/buttons/call_green_transparent_70x23.png" border="0" width="70" height="23" alt="Skype Me™!" align="absmiddle" /></a>
</td>
                    </tr>
                 <%}} %>
                </table>
