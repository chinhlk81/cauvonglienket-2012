<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>

       <%if (ViewData["sendPhoto"] != null)
         {
            
             var pho = (ViewData["sendPhoto"] as GetPhotoByID_Result); %>
              <div>   <img src="../<%= pho.PhotoPath %>" width="220" height="220" alt="<%=  pho.Description %>"/> 
                 <input type="hidden" name="idPho" id="idPho" value="<%=pho.PhotoID%>"/>
               </div>  
               <div style="text-align:right">
                <%= Ajax.ImageActionLink("../../Images/deleteIcon.gif","Xóa", "ShowImage", new { id = 0 }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "imageHolder" })%>
                </div>
                <%}else{ %>
          
         <div>Chọn hình bên cạnh</div>
<%} %> 
<script type="text/javascript">
    function CheckImage() {

        if (document.getElementById("idPho").value == "") {
            alert("chưa chọn hình");
            return false;
        }
    }

</script>        