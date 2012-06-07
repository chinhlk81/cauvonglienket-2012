using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class MessageDetailsViewModel
    {
        public GetMessageByID_Result CurrentMessage { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentPage { get; set; }
        //public IList<Comment> CommentsList { get; set; }
       // public Comment CurrentBlogComment { get; set; }
        public String MessageReply { get; set; }
        //filter conditions
        public string Filter { get; set; }
    }
}