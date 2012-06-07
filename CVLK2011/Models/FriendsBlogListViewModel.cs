using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class FriendsBlogListViewModel
    {
        public IList<GetAllBlogOfFriends_Result> FriendBlogList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentBlog { get; set; }
        //filter conditions
        public string Filter { get; set; }
        
    }
}