<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Event>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <h2 class="manager_title_detail">Cập nhật sự kiện</h2>
    <div style="text-align:right">
        <a href="<% =Url.Action("Create","EventManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
        <a href="<% =Url.Action("Index","EventManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
   
    <%using (Html.BeginForm("Edit", "EventManagement", FormMethod.Post, new { enctype = "multipart/form-data" })){%>
        <fieldset> 
        <table class="table_detail_admin">
            <tr >
                <td class="size-120" style="width: 140px">
                    Tên sự kiện
                </td>
                <td>
                    <%:Html.TextBoxFor(model => model.EventName, new { Style = "width:350px" })%>
                    <%:Html.ValidationMessageFor(model => model.EventName)%>
                   Nổi bậc <%=Html.CheckBoxFor(model=>model.IsTypical) %>
                </td>
            </tr>
            <tr>
           <td class="size-120" style="width: 101px">Dịch vụ</td>
           <td>
           <div> 
             <%:Html.DropDownList("eventParents", ViewData["EventParents"] as SelectList)%>
        </div>
        </td>
           </tr>
            <tr>
                <td>
                    Thời gian tổ chức
                </td>
                <td>
                 <div class="demo">
                <%=Html.TextBoxFor(model => model.EventTime, new { Style = "width:215px" })%>  
                
                Ngày:<input type="text" id="datepicker2" style="width:100px" name="eventDay2" value="<%=Model.EventDate.ToShortDateString() %>" /> 
            </div>
                     
            <%=Html.ValidationMessageFor(model => model.EventTime)%>
            <%=Html.ValidationMessageFor(model => model.EventDate)%>
                </td>
            </tr>
            <tr>
                <td>
                    Địa điểm tổ chức
                </td>
                <td>
                    <%:Html.TextBoxFor(model => model.EventLocation, new { Style = "width:350px" })%>
                    <%:Html.ValidationMessageFor(model => model.EventLocation)%>
                </td>
            </tr>
            <tr>
                <td>
                    Độ tuổi tham gia
                </td>
                <td>
                    <%:Html.TextBoxFor(model => model.EventAgeJoint, new { Style = "width:350px" })%>
                    <%:Html.ValidationMessageFor(model => model.EventAgeJoint)%>
                </td>
            </tr>
           

            <tr>
                <td>
                    Mô tả sự kiện
                </td>
                 <td>
                   <%=Html.TextAreaFor(model=>model.Description,new { Style = "width:342px" })%>
                    <%=Html.ValidationMessageFor(model=>Model.EventContent)%>
             </td>
            </tr>
             <tr>
                <td>
                    Ảnh đại diện
                </td>
                <td>
                 <img alt="hình đại diện" src="../../<%=Model.EventImages %>" style="width: 180px; height:140px" />
                 <input name="uploadFile" type="file" />
                </td>               
                
            </tr>
            <tr>
                <td class="size-120" style="width: 101px">Nhạc nền</td>
                <td>
                    <img alt="" src="" style="width: 60px" />
                    <input name="uploadFileMusic" type="file" />
                </td>
            </tr>
            <tr>
                <td>
                    Nội dung sự kiện
                </td>
                <td>
                     <%=Html.TextArea("FckEditor1",Model.EventContent,new { @name="FckEditor1" }) %>
                    <%=Html.ValidationMessageFor(model => model.EventContent)%>
                </td>
            </tr>

            
            <tr>
                <td>
                    Upload ảnh cho sự kiện
                </td>
                <td>
                    <input multiple='multiple' type='file' name='file1' id='file1'/>
                </td>
            </tr>

            <tr>
            <td></td>
            <td>
                <input  type="submit" value="Cập Nhật" />
            </td>
            </tr>
        </table>     
               </fieldset>    
    <% } %> 
    <script src="../../../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.ui.datepicker.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.ui.core.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {            
            $("#datepicker2").datepicker();
        });
	</script>


    <script src="../../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "500px";
            oFCKeditor.ReplaceTextarea();
        }
</script>
</asp:Content>

