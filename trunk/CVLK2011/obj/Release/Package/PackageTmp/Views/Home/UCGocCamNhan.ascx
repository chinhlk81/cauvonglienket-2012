<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.CommentListViewModel>" %>



<div id="sukiennoibat">

        <div class="index_title">
          Cảm nhận thành viên
        </div>
       <%-- <hr  class="sukiennoibat_hr"  />--%>
       <br />
        <table style="width:400px;margin-bottom:10px;float:left">
       <%if (Model != null)
          {
              foreach (var item in Model.CommentEventList)
              {  %>
              <tr>
                <td style="width:90px;vertical-align:top" rowspan="4">
                        <img src="<%=item.UserPicture %>"  alt="" style="width:85px; height:65px" />  
                        
                </td>
                
                <td class="namecamnhan">
                    <b>
                        <a href="" ><%=Html.Encode(item.UserFullName)%></a>
                    </b>
                </td>
            </tr>
            <tr><td style="color:#3B5998" >
                   Sự kiện: <%=Html.Encode(item.EventName)%>
                </td></tr>
            <tr>
                <td style="color:#3B5998" >
                   Cảm nhận:  <%=Html.Encode(item.CommentContent) %>
                </td>
            </tr>
            <tr>
                <td style="height: 17px;color:#808080">
                    <span class="greyl">  <%=Html.Encode(item.Datepost) %></span>
               </td>
            </tr>
           
       
         <%}
          } %>
        </table>
       
   
     

  </div>
