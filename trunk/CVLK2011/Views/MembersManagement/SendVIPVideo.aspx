<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CVLK2011.Models.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gởi video
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%Html.RenderPartial("BoxMenu"); %>

    <h2 class="manager_title_detail">Gởi Video tới thành viên VIP</h2>
    <div style="text-align:right""><b><%=Html.ActionLink("Quản lý Video", "Index","VideoShareManagement")%></b></div>
    <table>
        <tr>
            <td>
               
                <% using (Ajax.BeginForm("ShowVideo", new { id = 1 }, new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "videoUser" }))
                   {%>    
                   <b>Chọn thành viên xem video:</b>    
	           <input type="text" id="selectUser"  onclick="this.value=''" />  
               <input type="hidden" id="hdUserID" name ="hdUserID"/>
                 <input type="submit" value="Xem Video" id="submitShow" />
                <%} %>
               
                <br />
                <br />
                 <div class="ui-widget">    
                <div id="videoUser">
                </div> 
                <br />
                </div>
            </td>
            <td>
            <table>
           <tr>
           <td>
	               <div style="text-align:center"><%=ViewData["SendVideo"]%></div>
                   <b>Chọn thành viên được nhận: </b>     
           </td>
           </tr>
            <tr>
            <% using (Html.BeginForm("SendVideo", "MembersManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
               { %>
            <td align="left" style="width:280px;border:2px solid #B4C6DC">
                         <div id="styleautocomplete">
                         <ul id="ulSelected">
                        <li id="liautocomplete"> <input type="text" id="name-list"  onclick="this.value=''" onkeypress="ResetTextbox(event)" style="border:0px; width:150px; float:none;"  /></li>
                        </ul>
                        </div> 
                        
            </td>
            </tr>
            <tr><td> 
            <div style="text-align:right">
                        <input type="hidden" id="SendUserID" name="SendUserID" /> 
                        <input type="hidden" id="hdvideo" name="hdVideo" />
                        <input type="submit" value="Gởi" id="SubmitSend"/>
                </div>
                </td>
            <%} %> 
            </tr>
            
            </table>
            
            </td>
            
        </tr>
    </table>
    
     
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
                    document.getElementById("SendUserID").value = ui.item.id;
                    document.getElementById("hdUserID").value = ui.item.id;
                    $("#submitShow").click();
                }

            });

        });

        function checkVideo() {
        
        }
    </script>


    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>

    <script src="../../Scripts/jquery-1.5.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.ui.core.js" type="text/javascript"></script> 
    <script src="../../Scripts/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.ui.button.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.ui.position.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.ui.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        function addtextbox() {
            var textb = document.getElementById("usernames");
            var combo = document.getElementById("combobox2");
            var combo1= document.getElementById("combobox1");
            var textusersend = document.getElementById("usersend");
            var names = $("#combobox2 option:selected").text(); //  combo.toString();       
            try {
                var name = textb.value;
                textb.value = name + "-" + names; //Standard
                textusersend.value = $("#combobox1 option:selected").val();
            }
            catch (error) {
                textb.value = ""; // IE only
            }
        }
    </script> 


	<script type="text/javascript">
	    (function ($) {
	        $.widget("ui.combobox", {
	            _create: function () {
	                var self = this,
					select = this.element.hide(),
					selected = select.children(":selected"),
					value = selected.val() ? selected.text() : "";
	                var input = this.input = $("<input>")
					.insertAfter(select)
					.val(value)
					.autocomplete({
					    delay: 0,
					    minLength: 0,
					    source: function (request, response) {
					        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
					        response(select.children("option").map(function () {
					            var text = $(this).text();
					            if (this.value && (!request.term || matcher.test(text)))
					                return {
					                    label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<strong>$1</strong>"),
					                    value: text,
					                    option: this
					                };
					        }));
					    },
					    select: function (event, ui) {
					        ui.item.option.selected = true;
					        self._trigger("selected", event, {
					            item: ui.item.option
					        });
					    },
					    change: function (event, ui) {
					        if (!ui.item) {
					            var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),
									valid = false;
					            select.children("option").each(function () {
					                if ($(this).text().match(matcher)) {
					                    this.selected = valid = true;
					                    return false;
					                }
					            });
					            if (!valid) {
					                // remove invalid value, as it didn't match anything
					                $(this).val("");
					                select.val("");
					                input.data("autocomplete").term = "";
					                return false;
					            }
					        }
					    }
					})
					.addClass("ui-widget ui-widget-content ui-corner-left");

	                input.data("autocomplete")._renderItem = function (ul, item) {
	                    return $("<li></li>")
						.data("item.autocomplete", item)
						.append("<a>" + item.label + "</a>")
						.appendTo(ul);
	                };

	                this.button = $("<button type='button'>&nbsp;</button>")
					.attr("tabIndex", -1)
					.attr("title", "Show All Items")
					.insertAfter(input)
					.button({
					    icons: {
					        primary: "ui-icon-triangle-1-s"
					    },
					    text: false
					})
					.removeClass("ui-corner-all")
					.addClass("ui-corner-right ui-button-icon")
					.click(function () {
					    // close if already visible
					    if (input.autocomplete("widget").is(":visible")) {
					        input.autocomplete("close");
					        return;
					    }

					    // pass empty string as value to search for, displaying all results
					    input.autocomplete("search", "");
					    input.focus();
					});
	            },

	            destroy: function () {
	                this.input.remove();
	                this.button.remove();
	                this.element.show();
	                $.Widget.prototype.destroy.call(this);
	            }
	        });
	    })(jQuery);

	    $(function () {
	        $("#combobox1").combobox();
	        $("#toggle").click(function () {
	            $("#combobox1").toggle();
	        });
	        $("#combobox2").combobox();
	        $("#toggle").click(function () {
	            $("#combobox2").toggle();
	        });
	    });
	</script> 
</asp:Content>
