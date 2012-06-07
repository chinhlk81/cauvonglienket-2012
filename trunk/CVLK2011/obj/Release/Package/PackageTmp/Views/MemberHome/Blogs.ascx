<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.MemberHomeListViewModel>" %>
<%@ Import Namespace= "CVLK2011.HtmlHelpers" %>
<div>
            <table style="width: 100%;" cellpadding=0 cellspacing=0>
                    <tr>
                        <td style="background:#F2F2F2;border-top:1px solid #BFBFBF;color:#000;font-weight:bold;height:23px;">
                            Blog của bạn
                           
                        </td>
                        <td style="background:#F2F2F2;border-top:1px solid #BFBFBF;color:#000;font-weight:bold;height:23px;text-align:right;">
                          <a href="<%=Url.Action("Index","MemberBlog",new {id =Convert.ToInt32(Session["GuestUserID"])}) %>">Xem tất cả</a>
                          </td>
                    </tr>
            
                </table>
                    <br />


                <table style="width: 100%;margin-bottom:10px;" cellpadding=0 cellspacing=0>
                <%if (Model != null)
                  {
                      if (Model.BlogList != null)
                      {
                          foreach (var item in Model.BlogList)
                          {
                       %>
                       
                            <tr style="padding:10px">
                                <td style="width:100px">
                                   <img src="../../<%=item.ImageUpload %>" width="100px" height="80px" alt="" />
                                </td>
                                <td style="padding:10px" class="name_title_link">
                                 <a href="<%=Url.Action("Details","MemberBlog",new {id = item.BlogID}) %>"><%=Html.Encode(item.BlogTitle) %></a>
                                 </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                  <%=Html.Encode(item.Datepost) %>
                                </td>
                            </tr>
                    <%}
                      }
                  } %>
                </table>
                <%if (Convert.ToInt32(Session["CurrentUserID"]) == Convert.ToInt32(Session["GuestUserID"]))
                  { %>
                <table style="width:100%;">
                    <tr>
                        <td  style="vertical-align:top" align="right" class="name_title_link">
                            <img src="../../Images/icon_blog.gif" alt=""/> &nbsp; <%=Html.ActionLink("Viết Blog", "Create", "MemberBlog")%> </td>
                        <td align="right">
                            </td>
                    </tr>
                    </table>
                    <%} %>
                
 </div>