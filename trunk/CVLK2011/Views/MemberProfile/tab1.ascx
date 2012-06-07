<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CVLK2011.Models.User>" %>
 <%using (Html.BeginForm("tab1", "MemberProfile", FormMethod.Post, new { enctype = "multipart/form-data" }))
 { %>
  <div id="tab-1">
        <table class="table_edit_member" cellpadding=0 cellspacing=0>
            <tr>
            <td style="width:100px;text-align:right">
            
                Họ Tên</td>
            <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td >
                    <%= Html.HiddenFor(model => model.UserID)%>

                    <%=Html.TextBoxFor(model => model.UserFullName, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(model => model.UserFullName)%>
                    </td>
            </tr>
            <tr>
            <td style="width:100px;text-align:right">
            
                Ngày Sinh</td>
            <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td >
                     
                    <%: Html.DropDownList("UserBirthdayDD", new[] {
                    new SelectListItem{Text="1",Value="1"},
                    new SelectListItem{Text="2",Value="2"},
                    new SelectListItem{Text="3",Value="3"},
                    new SelectListItem{Text="4",Value="4"},
                    new SelectListItem{Text="5",Value="5"},
                    new SelectListItem{Text="6",Value="6"},
                    new SelectListItem{Text="7",Value="7"},
                    new SelectListItem{Text="8",Value="8"},
                    new SelectListItem{Text="9",Value="9"},
                    new SelectListItem{Text="10",Value="10"},
                    new SelectListItem{Text="11",Value="11"},
                    new SelectListItem{Text="12",Value="12"},
                    new SelectListItem{Text="13",Value="13"},
                    new SelectListItem{Text="14",Value="14"},
                    new SelectListItem{Text="15",Value="15"},
                    new SelectListItem{Text="16",Value="16"},
                    new SelectListItem{Text="17",Value="17"},
                    new SelectListItem{Text="18",Value="18"},
                    new SelectListItem{Text="19",Value="19"},
                    new SelectListItem{Text="20",Value="20"},
                    new SelectListItem{Text="21",Value="21"},
                    new SelectListItem{Text="22",Value="22"},
                    new SelectListItem{Text="23",Value="23"},
                    new SelectListItem{Text="24",Value="24"},
                    new SelectListItem{Text="25",Value="25"},
                    new SelectListItem{Text="26",Value="26"},
                    new SelectListItem{Text="27",Value="27"},
                    new SelectListItem{Text="28",Value="28"},
                    new SelectListItem{Text="29",Value="29"},
                    new SelectListItem{Text="30",Value="30"},
                    new SelectListItem{Text="31",Value="31"},
                    }, "--Ngày--")%>
					/
                    <%: Html.DropDownList("UserBirthdayMM", new[] {
                    new SelectListItem{Text="1",Value="1"},
                    new SelectListItem{Text="2",Value="2"},
                    new SelectListItem{Text="3",Value="3"},
                    new SelectListItem{Text="4",Value="4"},
                    new SelectListItem{Text="5",Value="5"},
                    new SelectListItem{Text="6",Value="6"},
                    new SelectListItem{Text="7",Value="7"},
                    new SelectListItem{Text="8",Value="8"},
                    new SelectListItem{Text="9",Value="9"},
                    new SelectListItem{Text="10",Value="10"},
                    new SelectListItem{Text="11",Value="11"},
                    new SelectListItem{Text="12",Value="12"},
                    }, "--Tháng--")%>
					/
                    <%: Html.DropDownList("UserBirthdayYYYY", new[] {
                    new SelectListItem{Text="1993",Value="1993"},
                    new SelectListItem{Text="1992",Value="1992"},
                    new SelectListItem{Text="1991",Value="1991"},
                    new SelectListItem{Text="1990",Value="1990"},
                    new SelectListItem{Text="1989",Value="1989"},
                    new SelectListItem{Text="1988",Value="1988"},
                    new SelectListItem{Text="1987",Value="1987"},
                    new SelectListItem{Text="1986",Value="1986"},
                    new SelectListItem{Text="1985",Value="1985"},
                    new SelectListItem{Text="1984",Value="1984"},
                    new SelectListItem{Text="1983",Value="1983"},
                    new SelectListItem{Text="1982",Value="1982"},
                    new SelectListItem{Text="1981",Value="1981"},
                    new SelectListItem{Text="1980",Value="1980"},
                    new SelectListItem{Text="1979",Value="1979"},
                    new SelectListItem{Text="1978",Value="1978"},
                    new SelectListItem{Text="1977",Value="1977"},
                    new SelectListItem{Text="1976",Value="1976"},
                    new SelectListItem{Text="1975",Value="1975"},
                    new SelectListItem{Text="1974",Value="1974"},
                    new SelectListItem{Text="1973",Value="1973"},
                    new SelectListItem{Text="1972",Value="1972"},
                    new SelectListItem{Text="1971",Value="1971"},
                    new SelectListItem{Text="1970",Value="1970"},
                    new SelectListItem{Text="1969",Value="1969"},
                    new SelectListItem{Text="1968",Value="1968"},
                    new SelectListItem{Text="1967",Value="1967"},
                    new SelectListItem{Text="1966",Value="1966"},
                    new SelectListItem{Text="1965",Value="1965"},
                    new SelectListItem{Text="1964",Value="1964"},
                    new SelectListItem{Text="1963",Value="1963"},
                    new SelectListItem{Text="1962",Value="1962"},
                    new SelectListItem{Text="1961",Value="1961"},
                    new SelectListItem{Text="1960",Value="1960"},
                    new SelectListItem{Text="1959",Value="1959"},
                    new SelectListItem{Text="1958",Value="1958"},
                    new SelectListItem{Text="1957",Value="1957"},
                    new SelectListItem{Text="1956",Value="1956"},
                    new SelectListItem{Text="1955",Value="1955"},
                    new SelectListItem{Text="1954",Value="1954"},
                    new SelectListItem{Text="1953",Value="1953"},
                    new SelectListItem{Text="1952",Value="1952"},
                    new SelectListItem{Text="1951",Value="1951"},
                    new SelectListItem{Text="1950",Value="1950"},
                    new SelectListItem{Text="1949",Value="1949"},
                    new SelectListItem{Text="1948",Value="1948"},
                    new SelectListItem{Text="1947",Value="1947"},
                    new SelectListItem{Text="1946",Value="1946"},
                    new SelectListItem{Text="1945",Value="1945"},
                    }, "--Năm--")%>
                    <%=Html.ValidationMessageFor(model => model.UserBirthday)%>
                </td>
            </tr>
            <tr>
             <td style="width:100px;text-align:right">
            
                Giới Tính</td>
             <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td >
                    <%: Html.DropDownList("UserGender", new[] {
                                                new SelectListItem{Text="Nam",Value="Male"},
                                                new SelectListItem{Text="Nữ",Value="Female"}
                                                },"--Chọn--") %> 
                    <%=Html.ValidationMessageFor(model => model.UserGender)%> 
                    </td>
            </tr>
            <tr>
            <td style="width:100px;text-align:right">
            
                Email</td>
            <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td >
                    <%=Html.TextBoxFor(model => model.UserEmail, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(model => model.UserEmail)%></td>
            </tr>
            <tr>
             <td style="width:100px;text-align:right">
            
                Số CMND</td>
            <td style="width:10px;padding-left:5px;">
            
                :</td>
                <td >
                    <%=Html.TextBoxFor(model => model.UserIDCard, new { @class = "text_fill_edit" })%>
                    <%=Html.ValidationMessageFor(model => model.UserIDCard)%></td>
            </tr>
           <tr>
            <%
            int id = 0;
            if(Session["CurrentUserID"]!=null)
                id = Convert.ToInt32(Session["CurrentUserID"].ToString());
            %>
            <td align="right">
                <input id="Submit1" type="submit" value="Lưu" class="btn_user_update" />
                </td>
            <td>
                &nbsp;</td>
            <td >                    
                <input id="Reset1" type="reset" value="Hủy" class="btn_user_update" />
                </td>
        </tr>
    </table>
</div>
<%} %>