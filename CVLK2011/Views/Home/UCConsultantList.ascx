<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.ConsultantsListViewModel>" %>

<div id="" style="text-align:left">

        <div class="index_title" >
          Danh sách Tư vấn viên
        </div>
       
      
        <%if (Model != null)
          { %>
        <%foreach (var item in Model.ConsultantList)
          { %>
        <div class="goctuvan_list"> 

            <table style="width:90%;line-height:20px;" >
                <tr>
                   <td class="name_goc_tuvan">
                  <img src="../../Images/arrow_sm_black.gif" alt="" />&nbsp;&nbsp; <%=Html.ActionLink(item.ConsultantName, "ConsultantDetails", new { id=item.ConsultantID})%>
                     </td>
                </tr>
               
            </table>

        </div>

       
         
         <%}
          } %>
        </div>





