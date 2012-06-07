<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.ConsultantsListViewModel>" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
   Chi tiết tư vấn
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="title_menu" style="text-align:center">
    Thông tin tư vấn viên
    </div>
<div class="content_menu" style="text-align:center">
<%if (Model != null)
  {
      if (Model.CurrentConsultantByID != null)
      {%>
    <table>
        <tr>
                <td><img alt="" src=" <%=Model.CurrentConsultantByID.ConsultantPicture %>" width="100" height="100"/>
                </td>
                <td style="width:70px;" align="left">
                <div style="margin-left:10px"> 
                        Tên:  
                        </div>
                    <div style="margin-left:10px">
                        Hot line: 
                        </div>
                    <div style="margin-left:10px">Yahoo: 
                        </div>
                    <div style="margin-left:10px">Skype: 
                        
                        </div>
                    <div style="margin-left:10px">Email: 
                        </div>
                </td>
                <td style="margin-left:10px" align="left">
                    <div>
                          <%=Html.Encode(Model.CurrentConsultantByID.ConsultantName)%>
                        </div>
                    <div>
                        <%=Html.Encode(Model.CurrentConsultantByID.ConsultantPhone)%>
                        </div>
                        
                    <div><a href="ymsgr:sendIM?<%=Model.CurrentConsultantByID.ConsultantYahooID %>">
                        <img src="http://opi.yahoo.com/online?u=<%=Model.CurrentConsultantByID.ConsultantYahooID %>&m=g&t=1" border="0" alt="Hỗ trợ khách hàng 24/24" align="absmiddle" /></a>
                        </div>
                    <div> 
                        <a href="skype:<%=Model.CurrentConsultantByID.ConsultantSkypeID %>?call">
                        <img src="http://download.skype.com/share/skypebuttons/buttons/call_green_transparent_70x23.png" border="0" width="70" height="23" alt="Skype Me™!" align="absmiddle" /></a>
                        </div>
                    <div><a href="mailto:<%=Model.CurrentConsultantByID.ConsultantEmail %>"> <%=Html.Encode(Model.CurrentConsultantByID.ConsultantEmail)%></a>
                        </div>
                    </td>
            </tr>
        <tr>
                <td colspan ="3">
                <br />
              <div id="fcktoolbar" style="visibility:hidden;height:auto"></div>
             <%=Html.TextArea("FckEditor1", Model.CurrentConsultantByID.ConsultantDesc, new { @readonly = "true", Style = "visibility:hidden;" })%>
                    </td>
            </tr>

    </table>
     <hr  class="style_hr" style="width:90%"  />
   <br />
    <table style="width:90%">
     
    <tr>
    <td >
    <%Html.RenderPartial("UCConsultantList"); %>
    </td>
    </tr>
    
    </table>
<%}
  } %>
</div>   
<div class="footer_menu">
    <img alt="" src="../../Images/content_bottom.png" border="0"  />
    </div>
    
   <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
<script src="../../Content/fckeditor/editor/_source/fckconstants.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckeditorapi.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckjscoreextensions.js" type="text/javascript"></script>
<script src="../../Content/fckeditor/editor/_source/fckscriptloader.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            //var sSkinPath = '<%= Url.Content("../../Content/fckeditor/editor/skins/default/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "700px";
            oFCKeditor.Width = "820px";
            oFCKeditor.ToolbarSet = 'Basic';
            oFCKeditor.Config['SkinPath'] = '';
            oFCKeditor.Config['ToolbarLocation'] = 'Out:fcktoolbar';
            oFCKeditor.ReplaceTextarea();
        }
        function FCKeditor_OnComplete(editorInstance) {
            editorInstance.EditorDocument.body.contentEditable = 'false';
            editorInstance.EditorDocument.designMode = 'off';
            
        }
</script>
	  			
</asp:Content>