using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class EventDetailsViewModel
    {
        public Event CurrentEvent { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentPage { get; set; }
        public IList<Comment> CommentsList { get; set; }
        public String EventComment { get; set; }
        //filter conditions
        public string Filter { get; set; }
        public int EventID { get; set; }
    }
}