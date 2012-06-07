using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class AlbumCatalogueListViewModel
    {
        public IList<GetAlbumAndPhoto_Result> Albums { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentAlbums { get; set; }
    }
}