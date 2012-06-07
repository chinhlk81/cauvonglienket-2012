using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class MemberShareVideoViewModel
    {
        public IList<VIPVideo> VideoList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentVideo { get; set; }
        
    }
}