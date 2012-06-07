using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{
    [MetadataType(typeof(Album_Validation))]
    public partial class Album
    {

    }

    public class Album_Validation
    {
        [Required(ErrorMessage = "Tên Album!")]
        [StringLength(30, ErrorMessage = "Tên Album quá dài!")]
        public string AlbumName { get; set; }
    }
}