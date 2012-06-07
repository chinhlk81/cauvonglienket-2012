<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<CVLK2011.Models.Photo>>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<div>
    <%if (Model == null)
    {%>
        <div style="text-align:center">Thành viên không có ảnh  </div>
    <%}
    else
    {%>
              <table width="200px">
           <%int count = 0;
             foreach (var item in Model)
             {
                 count++;
                 if (count == 1)
                 {%>
                    <tr>
                        <td style="width:90px; height:80px;">
                        <% var imagelink = "../" + (item.PhotoPath); %>
                   <%= Ajax.ImageActionLink(imagelink, "", "ShowImage", new { id = item.PhotoID }, "90px", "80px" , new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "imageHolder" })%>
                        </td> 
               
                <%}
                 if (count < 4 && count != 1)
                 {%>
                
                <td style="width:90px; height:80px">
                <% var imagelink = "../" + (item.PhotoPath); %>
                   <%= Ajax.ImageActionLink(imagelink, "", "ShowImage", new { id = item.PhotoID }, "90px", "80px", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "imageHolder" })%>
                   
                    
                    
                </td>                        
            <%}
                 if (count == 3)
                 {
                     count = 0; %>
                         
          
          </tr>
<%}
             }
   %>          
          </table>
          <%} %>
          
    </div>
