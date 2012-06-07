using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class PhotosListViewModel
    {
        public IList<GetAllPhotos_Result> PhotosList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentPhotos { get; set; }
        //filter conditions
        public string Filter { get; set; }
        public string photoStatusFilter { get; set; }
        public DateTime photoDateFilter { get; set; }
    }
}