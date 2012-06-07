using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{
    [MetadataType(typeof(Photo_Validation))]
    public partial class Photo
    {

    }

    public class Photo_Validation
    {
        [Required(ErrorMessage = "Chọn Album")]
        public int AlbumID { get; set; }
        //
        [Required(ErrorMessage = "Chọn ảnh")]
        public string PhotoPath { get; set; } 
    }
}