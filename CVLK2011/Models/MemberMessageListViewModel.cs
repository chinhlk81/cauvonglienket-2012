using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Objects.DataClasses;
namespace CVLK2011.Models
{
    public class MemberMessageListViewModel
    {
        public IList<GetAllMessageInboxByUserID_Result> MessageList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentMessage { get; set; }
        public Boolean Checked { get; set; }
        // create message
        public Message Message { get; set; }
        public IList<User> UsersList { get; set; }
        //filter conditions
        public string Filter { get; set; }
        public string box { get; set; }

    }
}