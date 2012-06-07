<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.ConsultingsListViewModel>" %>

<div id="">

        <div class="index_title">
          Danh sách câu hỏi
        </div>
       
      
        <%if (Model != null)
          { %>
        <%foreach (var item in Model.Products)
          { %>
        <div class="goctuvan_list"> 

            <table style="width:90%;line-height:20px;">
                <tr>
                   <td class="name_goc_tuvan">
                  <img src="../../Images/arrow_sm_black.gif" alt="" />&nbsp;&nbsp; <%=Html.ActionLink(item.ConsultingQuestions, "ConsultingDetails", new { id=item.ConsultingID})%>
                     </td>
                </tr>
               
            </table>

        </div>

       
         
         <%}
          } %>
        </div>





