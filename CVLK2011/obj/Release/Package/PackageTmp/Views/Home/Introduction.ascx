<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MenuConfig>" %>

<div class="title_menu">
    
     Giới Thiệu

    </div>
    <div class="content_menu">
    <%if (Model != null)
      { %>
        <%=Model.Contents%>
        <%} %>
   </div><!--End #mainContent-->