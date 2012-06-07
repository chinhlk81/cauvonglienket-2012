using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class MemberAlbumListViewModel
    {
        public IList<GetMemberAlbum_Result> AlbumLists { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentAlbum { get; set; }
        //filter conditions
        public string Filter { get; set; }
    }
}