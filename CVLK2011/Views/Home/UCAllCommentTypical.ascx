<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.CommentListViewModel>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<%@ Import Namespace="CVLK2011.HtmlHelpers" %>

<div id="sukiennoibat">

        <div class="index_title">
          Cảm nhận thành viên
        </div>
       <%-- <hr  class="sukiennoibat_hr"  />--%>
       <br />
        <table style="width:550px;margin-bottom:10px;float:left">
       <%if (Model != null)
          {
              foreach (var item in Model.CommentTypicalList)
              {
                  if (item.UserID == Utilities.IDefaultUser)
                  { %>
              <tr>
                <td style="width:40px;vertical-align:top" rowspan="4" align="left">
                        <img src="../../../Images/Users/admin.jpg"  alt="" style="width:85px; height:65px" />  
                        
                </td>
                
                <td class="namecamnhan" align="left">
                    <b>
                        <a href="" >Ban quản trị</a>
                    </b>
                </td>
            </tr>
            <tr><td style="color:#3B5998" >
            <%if (item.EventID == Utilities.IDefaultEvent)
              { %>
              Tổng hợp từ ban quản trị
              <%}
              else
              { %>
                   Sự kiện: <%=Html.Encode(item.Event.EventName)%>
                   <%} %>
                </td></tr>
                <%}
                  else
                  { %>
                   <tr>
                <td style="width:40px;vertical-align:top" rowspan="4" align="left">
                        <img src="<%=item.User.UserPicture %>"  alt="" style="width:85px; height:65px" />  
                        
                </td>
                
                <td class="namecamnhan" align="left" style="width:400px">
                    <b>
                        <a href="" ><%=Html.Encode(item.User.UserFullName)%></a>
                    </b>
                </td>
            </tr>
            <tr><td style="color:#3B5998;width:400px" >
                   Sự kiện: <%=Html.Encode(item.Event.EventName)%>
                </td></tr>
                  <%} %>
            <tr>
                <td style="color:#3B5998;width:400px" >
                   Cảm nhận: 
                    <%if (item.CommentContent.Length > 100)
                      { %>
                       <a href="<%=Url.Action("CommentDetails","Home",new{id=item.CommentID})%>"><%= item.CommentContent.Remove(100)%>...</a>
                    
                    <%}
                      else
                      { %>
                    <a href="<%=Url.Action("CommentDetails","Home",new{id=item.CommentID})%>"> <%=item.CommentContent%></a>
                    <%} %> 
                </td>
            </tr>
            <tr>
                <td style="height: 17px;color:#808080;width:400px" >
                    <span class="greyl">  <%=Html.Encode(item.Datepost) %></span>
               </td>
            </tr>
           
       
         <%}%>
            
         <% } %>
          
        </table>
       <div class="pager">        
            <%=Ajax.Pager(Model.PagingInfo.CurrentPage, Model.PagingInfo.TotalItems, "abc", 0, Model.PagingInfo.ItemsPerPage, "UCAllCommentTypical")%>
            </div>
   
     

  </div>
