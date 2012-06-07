<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.AlbumListViewModel>" %>

    <table>
        <tr>
            <th>Hình trong album</th>            
        </tr>  
        <%int count = 0;     
        foreach (var item in Model.PhotosList) 
        {
            count++;
            if(count == 1 )
            {%>
            <tr>
                <td>
                    <img src="../<%= item.PhotoPath %>" width="80" height="80" alt="<%= item.Description %>"/>                
                    <a href="<% =Url.Action("DeleteImage",new { idphoto = item.PhotoID, idalbum = item.AlbumID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()" /></a>              
                </td> 
               
            <%}
            if (count < 7 && count!=1)
            {%>
                
                <td>
                    <img src="../<%= item.PhotoPath %>" width="80" height="80" alt="<%= item.Description %>"/>  
                    <a href="<% =Url.Action("DeleteImage",new { idphoto=item.PhotoID, idalbum=item.AlbumID }) %>"><img src="../../../Images/admin_xoa.png" alt="Xóa" onclick="return ConfirmDelete()"/></a>              
                    
                </td>                        
            <%}
                if (count == 6)
                {
                    count = 0; %>
                         
            </tr>
            <%}      
        } %>

    </table>
       <script type="text/javascript">

           function ConfirmDelete() {
               if (confirm("Bạn chắc chắn xóa?") == true) {
                   return true;
               }
               else {
                   return false;
               }

           }
			     
			    
    </script> 


