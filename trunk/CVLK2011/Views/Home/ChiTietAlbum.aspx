<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CVLK2011.Models.Photo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Chi tiết Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%--<br />
    <div class="wrapper">        
        <ul class="navigationTabs">
            <li><a href="#about" rel="about">Click vào hình để xem album </a>
        <%: Html.ActionLink("Chọn album", "DanhSachAlbum")%>
    </li>            
        </ul>
        <div class="tabsContent">
            <div class="#about">                		
				<div id="myGallery" class="spacegallery">
                <% foreach (var item in Model)
                   { %>
					<img src="<%: item.PhotoPath %>" alt="" />					
                <%} %>
				</div>
            </div>           
        </div>		
    </div>
--%>
   <div id='divWG'>
<%--<table id="tblThumbsLayout" cellpadding="0" cellspacing="6">
<tr>
<td class='tdImg'><a href='../../../Content/Images/photos/5phuthenho_1.jpg' rel='lightbox[gallery]'><img src="../../../Content/Images/thumbs/5phuthenho_1.jpg" alt="5phuthenho_1"/></a><br/>5phuthenho_1 <a class='linkHiRes' href='../../../Content/Images/source/5phuthenho_1.jpg'>hi-res</a>
</td>
<td class='tdImg'><a href='../../../Content/Images/photos/5phuthenho_2.jpg' rel='lightbox[gallery]'><img src="../../../Content/Images/thumbs/5phuthenho_2.jpg" alt="5phuthenho_2"/></a><br/>5phuthenho_2 <a class='linkHiRes' href='../../../Content/Images/source/5phuthenho_2.jpg'>hi-res</a>
</td>
<td class='tdImg'><a href='../../../Content/Images/photos/5phuthenho_3.jpg' rel='lightbox[gallery]'><img src="../../../Content/Images/thumbs/5phuthenho_3.jpg" alt="5phuthenho_3"/></a><br/>5phuthenho_3 <a class='linkHiRes' href='../../../Content/Images/source/5phuthenho_3.jpg'>hi-res</a>
</td>
<td class='tdImg'><a href='../../../Content/Images/photos/addFriend.jpg' rel='lightbox[gallery]'><img src="../../../Content/Images/thumbs/addFriend.jpg" alt="addFriend"/></a><br/>addFriend <a class='linkHiRes' href='../../../Content/source/addFriend.jpg'>hi-res</a>
</td>
</tr>
</table>--%>

 <ul class="navigationTabs">
            <li>
        <%: Html.ActionLink("Chọn album", "DanhSachAlbum")%>
    </li>            
        </ul>
<table id="tblThumbsLayout" cellpadding="0" cellspacing="6">
<%
    if(Model != null)
    {
        int itemp = 0;
        for (int i = 0; i < Model.Count(); i = itemp)
        {
            if (i % 4 == 0)
            {%>
            <tr>
                <%for (int j = 0; j < 4; j++)
                {
                  if (itemp <= Model.Count() - 1)
                    {
                        var itemAt = Model.ElementAt(itemp);
                      
                        string strPhotoName = System.IO.Path.GetFileName(itemAt.PhotoPath);%>

                        <td  class='tdImg'>
                        
                            <a href="<%= itemAt.PhotoOriginal %>" rel='lightbox[gallery]'><img src="<%= itemAt.PhotoPath %>" alt="<%=strPhotoName %>" width="150" height="150"/></a><br />
                        </td>
                    <%}
                    itemp++;
                }%>
            </tr>
        <%}
    }
}%>   
</table>  
</div>
   <br />
   <script src="../../../Content/lightbox/js/prototype.js" type="text/javascript"></script>
<script src="../../../Content/lightbox/js/scriptaculous.js?load=effects" type="text/javascript"></script>
<script src="../../../Content/lightbox/js/lightbox.js" type="text/javascript"></script>
</asp:Content>

