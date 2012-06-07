<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<CVLK2011.Models.OlineSupport>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="manager_title">Cập nhật </h2>
   <div style="text-align:right">
        <a href="<% =Url.Action("OSCreate","ConsultantsManagement") %>"><img src="../../../Images/admin_add.png" alt="Tạo mới"/></a>
      <a href="<% =Url.Action("OSIndex","ConsultantsManagement") %>"><img src="../../../Images/admin_back.png" alt="Trở về"/></a>
    </div>
    <% using (Html.BeginForm("OSUpdate", "ConsultantsManagement",FormMethod.Post))
       {%>
        <%: Html.ValidationSummary(true) %>
        <fieldset>
            <table class="table_list_admin">
            <tr class="table_list_admin">
            <td>Điện thoại 1</td>
            <td> <%: Html.TextBoxFor(model => model.OSPhone1) %>
                <%: Html.ValidationMessageFor(model => model.OSPhone1) %></td>
            </tr>
            <tr>
            <td>Điện thoại 2</td>
            <td>
             <%: Html.TextBoxFor(model => model.OSPhone2) %>
                <%: Html.ValidationMessageFor(model => model.OSPhone2) %>
            </td>
            </tr>
            <tr>
            <td>Di động 1</td>
            <td>
            <%: Html.TextBoxFor(model => model.OSCellPhone1) %>
                <%: Html.ValidationMessageFor(model => model.OSCellPhone1) %>
            </td>
            </tr>
            <tr>
            <td>Di động 2</td>
            <td>
             <%: Html.TextBoxFor(model => model.OSCellPhone2) %>
                <%: Html.ValidationMessageFor(model => model.OSCellPhone2) %></td>
            </tr>
             <tr>
           <td>Email gởi</td>
            <td> <%: Html.TextBoxFor(model => model.OSEmailFrom) %>
                <%: Html.ValidationMessageFor(model => model.OSEmailFrom) %></td>
            </tr>
            <tr>
              <td>Mật khẩu</td>
            <td> <%: Html.PasswordFor(model => model.OSPwdEmailFrom) %>
                <%: Html.ValidationMessageFor(model => model.OSPwdEmailFrom) %></td>
            </tr>
            <tr>
            <td>Email đến 1</td>
            <td> <%: Html.TextBoxFor(model => model.OSEmailTo1) %>
                <%: Html.ValidationMessageFor(model => model.OSEmailTo1) %></td>
            </tr>
             <tr>
            <td>Email đến 2</td>
            <td> <%: Html.TextBoxFor(model => model.OSEmailTo2) %>
                <%: Html.ValidationMessageFor(model => model.OSEmailTo2) %></td>
            </tr>
             <tr>
            <td>Yahoo 1</td>
            <td> <%: Html.TextBoxFor(model => model.OSYahoo1) %>
                <%: Html.ValidationMessageFor(model => model.OSYahoo1) %></td>
            </tr>
             <tr>
            <td>Yahoo 2</td>
            <td><%: Html.TextBoxFor(model => model.OSYahoo2) %>
                <%: Html.ValidationMessageFor(model => model.OSYahoo2) %></td>
            </tr>
            <tr>
            <td>Skype 1</td>
            <td><%: Html.TextBoxFor(model => model.OSSkype1) %>
                <%: Html.ValidationMessageFor(model => model.OSSkype1) %></td>
            </tr>
            <tr>
            <td>Skype 2</td>
            <td> <%: Html.TextBoxFor(model => model.OSSkype2) %>
                <%: Html.ValidationMessageFor(model => model.OSSkype2) %></td>
            </tr>
             <tr>
            <td>
               Port </td><td><%= Html.TextBoxFor(model=>model.OSPort) %>
               <%=Html.ValidationMessageFor(model=>model.OSPort) %>
               </td>
        </tr>
         <tr>
            <td>
               Host </td><td><%=Html.TextBoxFor(model=> model.OSHost) %>
               <%=Html.ValidationMessageFor(model=>model.OSHost) %>
               </td>
        </tr>
            <tr>
            <td>Sử dụng</td>
            <td><%=Html.CheckBox("Active",Model.IsActive) %></td>
            </tr>
            <tr>
            <td></td>
            <td> <input type="submit" value="Lưu" /></td>
            </tr>
            </table>
            
               
        </fieldset>

    <% } %>

    

</asp:Content>

