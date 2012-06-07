using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class AllVideoShare
    {
        public IList<VIPVideo> VideoList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentVideo { get; set; }
        public string PartnerName { get; set; }
    }
}