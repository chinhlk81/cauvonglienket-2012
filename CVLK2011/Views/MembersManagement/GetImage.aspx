<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace= "CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gởi hình ảnh
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <script src="../../../Scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>

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
                        url: "/MemberMessage/FindNames", type: "POST", dataType: "json",
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
            // $("#name-list").focus();
            // $("#name-list").click();
            // alert(document.getElementById("dv1").innerHTML);
            //}


        }
    </script>
 
    <h2>Gởi ảnh</h2>
    <% using (Html.BeginForm("SendPhoto", "MembersManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>  
       <table><tr><td colspan="2">
        <% var pho = (ViewData["sendPhoto"] as GetPhotoByID_Result); %>
                <img src="../<%= pho.PhotoPath %>" width="300" height="300" alt="<%=  pho.Description %>"/>   
                 <input type="hidden" name="idPho" value="<%=pho.PhotoID%>"/> 
       </td>
       <td>
             <div id="styleautocomplete">
               <ul id="ulSelected">
                 <li id="liautocomplete"> <input type="text" id="name-list"  onclick="this.value=''" onkeypress="ResetTextbox(event)" style="border:0px; width:150px; float:none;"  /></li>
               </ul>
              
            
                  </div>  
                  <input type="submit" value="Gởi hình" />  
                  </td></tr></table>
                  <%} %>
</asp:Content>

