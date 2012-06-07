<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MemberHomeListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>

<div>
<table style="width: 100%;" cellpadding=0 cellspacing=0>
                    <tr>
                        <td style="background:#F2F2F2;border-top:1px solid #BFBFBF;color:#000;font-weight:bold;height:23px;">
                            Album của bạn
                           
                        </td>
                        <td style="background:#F2F2F2;border-top:1px solid #BFBFBF;color:#000;font-weight:bold;height:23px;text-align:right;">
                            <a href="<%=Url.Action("Index","MemberPhoto",new{id=Convert.ToInt32(Session["GuestUserID"].ToString())}) %>">xem tất cả</a></td>
                    </tr>
            
                </table>

                <br />


                <table style="width: 100%;margin-bottom:10px;" cellpadding=0 cellspacing=0>
                   <%if (Model != null)
                     {
                         if (Model.AlbumList != null)
                         {
                             foreach (var item in Model.AlbumList)
                             {
                          %>
                          
                            <tr style="padding:10px">
                                <td style="width:100px">
                                   <img src="../../<%=item.PhotoPath %>" width="100px" height="80px" alt=""/>
                                </td>
                                <td style="padding:10px" class="name_title_link">
                                 <a href="<%=Url.Action("Details","MemberPhoto",new{id=item.AlbumID})%>"><%=Html.Encode(item.AlbumName)%></a>
                                 </td>
                                 
                            </tr
                            <tr>
                                <td colspan="2" >
                                  <%=Html.Encode(item.AlbumDate)%>
                                </td>
                            </tr>
                    <%}
                         }
                     } %>
                </table>


</div>
