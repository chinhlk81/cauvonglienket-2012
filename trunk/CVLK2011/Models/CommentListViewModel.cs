using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class CommentListViewModel
    {
        public IList<GetAllComments_Result> CommentList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentComment { get; set; }
        public string Filter { get; set; }
        public DateTime commentDateFilter { get; set; }
        public string commentStatusFilter { get; set; }
        public IList<GetAllCommentsEvent_Result> CommentEventList { get; set; }
        public GetCommentByID_Result CommentByID { get; set; }
        public IList<Comment> CommentTypicalList { get; set; } 
    }
}