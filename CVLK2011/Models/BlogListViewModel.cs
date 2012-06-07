using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class BlogListViewModel
    {
        public IList<GetAllBlogs_Result> BlogList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentBlog {get; set;}
        //friend blog
        public IList<GetAllBlogOfFriends_Result> FriendBlogList { get; set; }
        public Comment CurrentBlogComment { get; set; }
        public string CurrentFrindBlog { get; set; }
        public PagingInfo FriendPagingInfo { get; set; }
        public int OwnerUser { get; set; }
        public int GuestUser { get; set; }
        //filter conditions
        public string blogStatusFilter { get; set; }
        public DateTime blogDateFilter { get; set; }
    }
}