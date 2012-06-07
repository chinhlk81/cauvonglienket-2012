using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class UserSearchResultViewModel
    {
        public IList<UserSearch_Result> SearchResults { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentPage { get; set; }
        public string FilterProvince { get; set; }
        public String FilterGender { get; set; }
        public DateTime FilterFrom { get; set; }
        public DateTime FilterTo { get; set; }
    }
}