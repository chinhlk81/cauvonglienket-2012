<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CVLK2011.Models.User>>" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gởi hình ảnh  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%Html.RenderPartial("BoxMenu"); %>

    
    <h2 class="manager_title_detail">Gửi hình ảnh </h2>    
   <table><tr><td>
        <% using (Ajax.BeginForm("ShowPhoto", new { id = 1 }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "imageUser"}))
           {%>        
           <b> Chọn thành viên xem ảnh </b>
	            <input type="text" id="selectUser"  onclick="this.value=''"/>  
                <input type="hidden" id="hdUserID" name="hdUserID" /> 
                <input type="submit" value="Xem Hình" id="submitShow" />
        <%}
          %>   
        <div class="ui-widget"> 
        <br />
        <br />   
        <div id="imageUser">
        
        </div> 
        <br /> 
        </div>
        </td>
        <td>
         <% using (Html.BeginForm("SendPhoto", "MembersManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>  
       <div style="text-align:center"><%=ViewData["SendImageMessage"] %></div>
       <table>
       <tr>
       <td rowspan="2">
       <div id="imageHolder">
             <%Html.RenderPartial("ShowImage"); %>
       </div>
       </td>
       <td>
       <table>
       <tr>
       <td><b>Chọn thành viên được nhận:</b></td>
       </tr>
       <tr>
       <td align="left" style="width:280px;border:2px solid #B4C6DC" >
       
             <div id="styleautocomplete">
                   <ul id="ulSelected">
                     <li id="liautocomplete"> <input type="text" id="name-list"  onclick="this.value=''" onkeypress="ResetTextbox(event)" style="border:0px; width:150px; float:none;"  /></li>
                </ul>
                  </div> 
       
                  </td>
       
       </tr>
       </table>
       </td>
                  </tr>
                  <tr valign="top">
                  <td colspan="4">
                  <div style="text-align:right"> <input type="submit" value="Gởi hình" name="SendPhoto" onclick="return CheckImage()" /> </div> 
                  </td>
                  </tr>
                  </table>
                  <%} %>
        </td>
        </tr>
        
        </table>
   
    
   
   
   
   
    <%--<script src="../../../Scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        $(document).ready(function () {
            $("#name-list").focus();
            
        });
       

        function ResetTextbox(e) {
            // look for window.event in case event isn't passed in
            if (window.event) {
                e = window.event;
            }
            var key = e.keyCode || e.which;
            if (key == 13) {
                //alert('i am here key down');
                document.getElementById('name-list').value = "";
            }
        }
        
        function CreateChildNode(id, name) {
            //create li tag
            var li = document.createElement("li");
            li.setAttribute("id", "li" + id);
            var nodetext = document.createTextNode(name);
            //create image tag
            var img = document.createElement("img");
            img.setAttribute("style", "cursor:pointer");
            img.setAttribute("src", '/Images/deleteIcon.gif');
            img.setAttribute("onclick", "RemoveTag(" + id + ")");
            //create hidden input
            var hd = document.createElement("input");
            hd.setAttribute("type", "hidden");
            hd.setAttribute("name", "hd" + id);
            hd.setAttribute("id", "hd" + id);
            hd.setAttribute("value", id);
            //append img,hidden to li tag
            li.appendChild(nodetext);
            li.appendChild(img);
            li.appendChild(hd);
            // reference child
            var refchild = document.getElementById("liautocomplete");
            //append li to ul tag
            document.getElementById("ulSelected").insertBefore(li, refchild);

        }
        $(function () {
            $("#name-list").focusout(ResetValue);
            $("#name-list").click(ResetValue);
        });
        $(function () {
            $("#name-list").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../../MembersManagement/FindNames", type: "POST", dataType: "json",
                        data: { searchText: request.term, maxResults: 100 },
                        success: function (data) {
                            response($.map(data, function (item) {
                                return { label: item.FullName, value: item.FullName, id: item.PersonId }
                            }))
                        }
                    })
                },
                select: function (event, ui) {
                    if (!IsExists(ui.item.id)) {
                        CreateChildNode(ui.item.id, ui.item.label);
                    }
                }

            });

        });

        //check exists
        function IsExists(thisValue) {
            var hdTag = document.getElementById("hd" + thisValue);
            if (hdTag == null)
                return false;
            else
                return true;
        }
        function RemoveTag(thisValue) {
            var ul = document.getElementById("ulSelected");
            var li = document.getElementById("li" + thisValue);
            ul.removeChild(li);
            $("#name-list").focus();
        }
        //reset textbox
        function ResetValue() {
            $("#name-list").val("");
        }
        //select user and show images

        $(function () {

            $("#selectUser").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../../MembersManagement/FindNames", type: "POST", dataType: "json",
                        data: { searchText: request.term, maxResults: 100 },
                        success: function (data) {
                            response($.map(data, function (item) {
                                return { label: item.FullName, value: item.FullName, id: item.PersonId }
                            }))
                        }
                    })
                },
                select: function (event, ui) {
                    document.getElementById("hdUserID").value = ui.item.id;
                    $("#submitShow").click();
                }

            });

        });

    </script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
