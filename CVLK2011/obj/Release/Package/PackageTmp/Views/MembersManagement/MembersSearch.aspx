<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tìm kiếm thành viên
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="content-box clear">
			<div class="box-body iconbar">
				<div class="box-wrap">
				<div class="main-icons" id="iconbar">
					<ul class="clear">
		                        
		                        <li><a href="../MembersManagement/Index"><img src="../../images/ico_users_64.png" class="icon" alt=""/><span class="text">Thành Viên</span></a></li>
                                
                		        <li><a href="../MembersManagement/MembersPhoto"><img src="../../images/ico_photomember.png" class="icon" alt="" /><span class="text">Hình Ảnh</span></a></li>
                                <li><a href="../MembersManagement/SendPhoto"><img src="../../images/ico_picture_64.png" class="icon" alt="" /><span class="text">Gởi hình ảnh</span></a></li>
                                <li><a href="../MembersManagement/SendVIPVideo"><img src="../../images/ico_video_64.png" class="icon" alt="" /><span class="text">VIP Video</span></a></li>
		                        <li><a href="../MembersManagement/MembersBlog"><img src="../../images/ico_page_64.png" class="icon" alt="" /><span class="text">Blog</span></a></li>
                		        <li><a href="../MembersManagement/MembersComments"><img src="../../images/ico_chat_64.png" class="icon" alt="" /><span class="text">Comment</span></a></li>
                                <li><a href="../MembersManagement/MembersMessage"><img src="../../images/ico_folder_64.png" class="icon" alt="" /><span class="text">Massage</span></a></li>
                                <li><a href="../MembersManagement/MembersSearch"><img src="../../images/ico_manage-users_48.png" class="icon" alt="" /><span class="text">Tìm Kiếm Nâng Cao</span></a></li>
		                        
		                        
					</ul>
				</div>
				</div>
			</div>
			</div>

   



     <div class="content-box">
			<div class="box-body">
				<div class="box-header clear">
					<h2>MembersSearch</h2>
				</div>
				<div class="box-wrap clear">
					them sua xoa
				</div> <!-- end of box-wrap -->
			</div> <!-- end of box-body -->
			</div>

</asp:Content>
