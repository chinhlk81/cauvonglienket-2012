<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.ConsultantsListViewModel>" %>
<style type="text/css">
    a {
        color: green;
        text-decoration: none;
    }
        
    a:hover, a:visited {
        color: maroon;
    }
        
    .hidden {
        display: none;
    }
        
    .boxes {
        width: 200px;
        border: 0px solid gray;
        padding: 0px; margin: 0px 0px 0px 0px;
        background: none;
    }
        
    .boxes ul {
        list-style: none;
        padding: 0px 0px 0px 0px;
    }
        
    .boxes ul li {
        position: relative;
        border-bottom: 0px solid #ebebeb;
        width: 200px;
    }
        
    .boxes ul li a {
        font-size: 1.1em;
        color: #176092;
        line-height: 2em;
    }
        
    .boxes ul li:hover {
        background: none;
    }
        
    img.info {
        margin: 0px;
       text-align:center;
        clear: both;
        width: 100px;
        height:100px;
    }
    .namedetails 
    {
    	font-weight:bold;
    	padding-left:20px;
    	
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('#nav li').hover(function () {
            $(this)
            .find('table')
            .css({
                position: 'absolute',
                right: '200px',
                top: '0px'
            })
            .removeClass('hidden')
            .stop()
            .animate({ opacity: 1 }, 'fast');
        }, function () {
            $(this)
            .find('table')
            .stop()
            .animate({ opacity: 0 }, 'fast');
        });
    });
</script>
<div id="doingutuvan_title">
    <img alt="" src="../../Images/doingutuvan_footer.gif" border="0"  />
</div>
<div class="boxes">             
<%if (Model != null)
{%>
    <ul id="nav">
    <%foreach (var item in Model.ConsultantList)
    { %>
        <li>
            <%=Html.ActionLink(item.ConsultantName, "ConsultantDetails", new { id = item.ConsultantID }, new { @class = "namedetails" })%>
          
            <table class="hidden"  style="background:url(../../Images/tooltip_bg.png) no-repeat top left; color:#fff;width:200px;height:170px;text-align:center;position:relative;left:-185px;">
                               <tr >
                    <td style="width:100px;height:100px;padding-top:5px;" ><img alt="<%=item.ConsultantName%>" src="<%=Html.Encode(item.ConsultantPicture) %>" class="info"/></td>
                </tr>
                <tr>
                  
                </tr>
                <tr>
                  <td>Email: <%=Html.Encode(item.ConsultantEmail) %></td>
                </tr>
                <tr>
                    <td>Skype: <%=Html.Encode(item.ConsultantYahooID) %></td>
                </tr>
                <tr>
                    <td>Yahoo: <%=Html.Encode(item.ConsultantYahooID) %></td>
                </tr>

            </table>
          
        </li>
    <%}%>
    </ul>
<%}%>
</div>
     