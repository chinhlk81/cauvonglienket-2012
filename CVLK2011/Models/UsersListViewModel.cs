using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CVLK2011.Models
{
    public class UserListViewModel
    {
        public IList<GetAllUsers_Result> UserList { get; set; }
        public IList<User> UsersObjectList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentUser { get; set; }
        //filter conditions
        public string userTypeFilter { get; set; }
        public string userGenderFilter { get; set; }
        public string userStatusFilter { get; set; }
        public string userEventParrent { get; set; }
        public IEnumerable<SelectListItem> UserStatus { get; set; }
        public Boolean Checked { get; set; }
        public Boolean AvatarApproved { get; set; }
        public string box { get; set; }
        public int UserQty { get; set; }
    }
}