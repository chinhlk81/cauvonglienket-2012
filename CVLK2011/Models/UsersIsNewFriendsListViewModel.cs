using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class UsersIsNewFriendsListViewModel
    {
        public IList<GetAllUsers_Result> UserList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentUser { get; set; }
    }
}