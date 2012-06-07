using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class BlogDetailsViewModel
    {
        public GetBlogByID_Result CurrentBlog { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentPage { get; set; }
        public IList<Comment> CommentsList { get; set; }
        public String CurrentBlogComment { get; set; }
        public String BlogComment { get; set; }
        public int CommentCount { get; set; }
        //filter conditions
        public string Filter { get; set; }
        public int BlogID { get; set; }
        public int OwnerBlog { get; set; }
    }
}