<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.Ad>" %>
<%@ Import Namespace="CVLK2011.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quảng cáo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   

    <% using (Html.BeginForm("Create", "AdsManagement", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <h2 class="manager_title">Thêm mới quảng cáo</h2>
            
             <div style="text-align:right"> <a href="<% =Url.Action("Index") %>"><img src="../../../Images/admin_back.png" alt="Trờ về"/></a></div>
            <div style="text-align:center"><b><%=ViewData["AdMsg"]%></b></div>
             <div style="text-align:center"><b style="color:Red"><%=ViewData["AdError"]%></b></div>
             <div class="editor-label">
                <%: Html.Label("Tiêu đề")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.AdTitle) %>
                <%: Html.ValidationMessageFor(model => model.AdTitle) %>
            </div>
              <div class="editor-label">
                <%: Html.Label("Vị trí")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("Position", new[]{ new SelectListItem { Text =Utilities.AliasDictionary[Utilities.cstPositionRightPage], Value =Utilities.cstPositionRightPage },
                                                          new SelectListItem { Text=Utilities.AliasDictionary[Utilities.cstPositionBottomPage],Value=Utilities.cstPositionBottomPage}}, "--Chọn vị trí--")%>
                <%: Html.ValidationMessageFor(model => model.Position) %>
            </div>
             <div class="editor-label">
                <%: Html.Label("Trang hiển thị")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("OnPage", new[]{ new SelectListItem { Text = Utilities.AliasDictionary[Utilities.cstOnHomePage], Value = Utilities.cstOnHomePage },
                                                          new SelectListItem { Text=Utilities.AliasDictionary[Utilities.cstOnDetailPage],Value=Utilities.cstOnDetailPage}}, "--Chọn trang hiện thị--")%>
                <%: Html.ValidationMessageFor(model => model.OnPage) %>
            </div>
             <div class="editor-label">
                <%: Html.Label("Trạng thái")%>
            </div>
            <div class="editor-field">
                <%= Html.DropDownList("status",(SelectList)ViewData["Status"]) %>
                <%: Html.ValidationMessageFor(model => model.AAStatus) %>
            </div>
            <div class="editor-label">
                <%: Html.Label("Hình ảnh")%>
            </div>
            <div class="editor-field">
               <input type="file" id ="file1" name="uploadFile" />
            </div>
            <div class="editor-label">
                <%: Html.Label("Liên kết")%>
            </div>
            <div class="editor-field">
               <%=Html.TextBoxFor(model=>model.AdLink) %>
                <%: Html.ValidationMessageFor(model => model.AdLink)%>
            </div>
             
            <div class="editor-label">
                <%: Html.Label("Ghi chú") %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.AdDesc, new { Style="width:430px"})%>
                
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Nội dung")%>
            </div>
            <div class="editor-field">
                <%= Html.TextArea("FckEditor1", new { @name = "FckEditor1", Style = "visibility:hidden" })%>
                <%: Html.ValidationMessageFor(model => model.AdContent) %>
            </div>
             
            
            <p>
                <input type="submit" value="Lưu" />
                <input type="reset" value="Huỷ" onclick="document.location.href=document.location" />
            </p>
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

