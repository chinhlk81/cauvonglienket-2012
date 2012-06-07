using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class AlbumListViewModel
    {
        public IList<GetAlbumInfo_Result> Products { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentCategory { get; set; }
        //current album
        public GetAlbumInfoById_Result Album { get; set; }
        //photo
        public IList<Photo> PhotosList { get; set; }
        //filter conditions
        public string Filter { get; set; }
        public string albumStatusFilter { get; set; }
        public string albumTypeFilter { get; set; }
        public int albumUserFilter { get; set; }
    }
}