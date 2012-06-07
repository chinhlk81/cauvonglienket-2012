<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Event>" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo sự kiện
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <h1 class="manager_title_detail">Tạo mới sự kiện</h1>
     <div style="text-align:right">
    <a href="<%=Url.Action("Index","EventManagement")%>"><img src="../../Images/admin_back.png" alt="Trở về" /></a>
    </div>
    <% using (Html.BeginForm("Create", "EventManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    
    <fieldset>
    <table class="table_detail_admin">
    <tr>
    <td class="size-120" style="width: 101px"> Sự kiện</td>
    <td> <div>
            <%= Html.TextBoxFor(Model => Model.EventName, new { Style = "width:350px" })%>
            <%= Html.ValidationMessageFor(Model => Model.EventName)%>
            Nổi bậc <%=Html.CheckBoxFor(model=>model.IsTypical) %>
        </div> </td>
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
           <td>Địa điểm</td>
           <td><%=Html.TextBoxFor(Model=> Model.EventLocation, new { Style = "width:350px" })%>
           <%=Html.ValidationMessageFor(Model=>Model.EventLocation) %>
           </td>
           </tr>
           <tr>
            <td>Thời gian</td>
            <td>
            <div class="demo">
            <%=Html.TextBoxFor(Model => Model.EventTime, new {Style="width:215px"})%>   Ngày:<input type="text" id="datepicker1" style="width:100px" name="eventDay"/> 
            </div>
                     
            <%=Html.ValidationMessageFor(Model=>Model.EventTime)%>
            <%=Html.ValidationMessageFor(Model=>Model.EventDate) %>
            </td>
           </tr>
           <tr>
           <td>Độ tuổi tham dự</td>
           <td><%=Html.TextBoxFor(Model=>Model.EventAgeJoint, new { Style = "width:350px" })%>
           <%=Html.ValidationMessageFor(Model=>Model.EventAgeJoint) %>
           </td>
           </tr>
        <tr>
        <td class="size-120" style="width: 101px">Hình ảnh</td>
        <td>
            <img alt="" src="" style="width: 60px" />
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
        <td class="size-120" style="width: 101px">Mô tả</td>
        <td>
         <div> <%= Html.TextBoxFor(Model => Model.Description , new { Style = "width:350px" })%>
            <%= Html.ValidationMessageFor(Model => Model.Description)%>
        </div>
        </td>
        </tr>
          <tr>
          <td class="size-120" style="width: 101px">Nội dung</td>
          <td><div>
             <%:  Html.TextArea("FckEditor1", "", new { @name="FckEditor1" })%>
             <% =Html.ValidationMessageFor(Model=>Model.EventContent)%>
         </div> </td>
          </tr> 
            <tr>
            <td class="size-120" style="width: 101px"></td>
            <td><input type="submit" value="Lưu" /></td>
            </tr>
               
        </table>
         </fieldset>       
    <% } %>    
    <script src="../../Content/fckeditor/fckeditor.js" type="text/javascript" ></script>
    <script type="text/javascript">
        window.onload = function () {
            var sBasePath = '<%= Url.Content("../../Content/fckeditor/") %>';
            var oFCKeditor = new FCKeditor('FckEditor1');
            oFCKeditor.BasePath = sBasePath;
            oFCKeditor.Height = "500px";
            oFCKeditor.ReplaceTextarea();
        }
</script>
</asp:Content>
