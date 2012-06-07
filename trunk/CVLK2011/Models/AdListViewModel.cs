using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace CVLK2011.Models
{
    public class AdListViewModel
    {
        public IList<Ad> AdList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentAd { get; set; }
        //filter conditions
        public string Filter { get; set; }
       
    }
}