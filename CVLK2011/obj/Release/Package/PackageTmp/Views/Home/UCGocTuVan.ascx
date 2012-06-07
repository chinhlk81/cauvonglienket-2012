<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.ConsultingsListViewModel>" %>
    

<div id="sukiennoibat">

        <div class="index_title">
          Góc tư vấn
        </div>
       <%-- <hr  class="goctuvan_hr"   />--%>
       <br />
        <%if (Model != null)
          { %>
        <%foreach (var item in Model.Products)
          { %>
        <div class="goctuvan_list"> 

            <table style="width:100%;height:25px;">
                <tr>
                    <td class="name_goc_tuvan">
                   <img src="../../Images/arrow_sm_black.gif" />&nbsp;&nbsp;<%=Html.ActionLink(item.ConsultingQuestions, "ConsultingDetails", new { id=item.ConsultingID})%>
                     </td>
                </tr>
               <%-- <tr>
                    <td align="right">
                         <%=Html.ActionLink("chi tiết", "ConsultingDetails", new { id = item.ConsultingID }, new { @class = "detailslink" })%></td>
                </tr>--%>
            </table>

        </div>
        
       
         
         <%}
          } %>
          <hr  class="goctuvan_hr"  />
        </div>

         



