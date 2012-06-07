using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class MessageListViewModel
    {
        public IList<GetAllMessages_Result> MessageList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentMessage { get; set; }
        public string Filter { get; set; }
        public string messageStatusFilter { get; set; }
        public DateTime messageDateFilter { get; set; }
    }
}