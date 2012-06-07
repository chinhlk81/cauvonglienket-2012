<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MemberSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Message>" %>
<%@ Import Namespace="CVLK2011.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Viết tin nhắn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
 <%--<script src="../../Scripts/JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/JS/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>--%>
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
                document.getElementById('name-list').value="";
            }
        }


        function CreateChildNode(id, name) {
            //create li tag
            var li = document.createElement("li");
            li.setAttribute("id", "li"+id);
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
            var refchild=document.getElementById("liautocomplete");
            //append li to ul tag
            document.getElementById("ulSelected").insertBefore(li, refchild);
            //alert(document.getElementById("ulSelected").innerHTML);

        }
        $(function () {
            $("#name-list").focusout(ResetValue);
            $("#name-list").click(ResetValue);
        });
        $(function () {

            $("#name-list").autocomplete(
            
            {
            
                source: function (request, response) {
                    $.ajax({
                        url: "../../MemberMessage/FindNames", type: "POST", dataType: "json",
                        data: { searchText: request.term, maxResults: 100 },
                        success: function (data) {
                            response($.map(data, function (item) {
                                //alert(item.FullName);
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
 
<%if (Session["CurrentUserID"] != null)
  { %>
 <div class="title_top_user"> <a href="<%=Url.Action("Index","MemberHome",new {id=Convert.ToInt32(Session["CurrentUserID"].ToString())})%>"><%=Html.Encode(((User)Session["CurrentUserObject"]).UserFullName)%></a>&nbsp;/ Soạn tin nhắn</div>
   
   <div> 
        <% using (Html.BeginForm("Create", "MemberMessage", FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>  
       <div style="text-align:center"> <%= Html.Encode(ViewData["MessageResult"])%></div>
        <table style="width:100%;">
        
            <tr>
                <td class="message_title_left">
                    Người nhận  
                </td >
                <td align="left" style="width:280px;border:1px solid #B4C6DC" >
                <div id="styleautocomplete" >
               <ul id="ulSelected" >
                 <li id="liautocomplete"    > <input type="text" id="name-list"  onclick="this.value=''" onkeypress="ResetTextbox(event)" style="border:0px; width:150px; float:none;"  /></li>
               </ul>
                  </div>
               </td>
                
            </tr>
            <tr>
                <td class="message_title_left">
                   Chủ đề 
                </td>
                <td align="left">
                   <%=Html.TextBoxFor(model => model.MessageTitle, new { Style = "width:400px;border:1px solid #B4C6DC" })%>
                    <%=Html.ValidationMessageFor(model => model.MessageTitle)%>
                    </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td class="message_title_left">
                    Nội dung </td>
                <td  align="left">
                    <%=Html.TextAreaFor(model => model.MessageContent, new { style = "width:406px;border:1px solid #B4C6DC" })%>
                     <%=Html.ValidationMessageFor(model => model.MessageContent)%></td>
                <td>
                    </td>
            </tr>
            <tr>
                <td style="width: 81px">
                    </td>
                <td align="left"> 
                    <input id="Submit1" type="submit" class="btn_user_update" value="Gửi tin" onclick="return CheckInput()" />
                    <input id="Button1" type="reset" class="btn_user_update" value="Hủy" /></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    <%} %>
    </div>
    <%} %>
    <br />
       
    
    
   
</asp:Content>
