using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Linq;
namespace CVLK2011.Models
{
    [MetadataType(typeof(Ad_Validation))]
    public partial class Ad
    {
        
    }

    public class Ad_Validation
    {
       
        [Required(ErrorMessage = "*")]
        [StringLength(250, ErrorMessage = "Tiêu đề quá dài.")]
        public string AdTitle { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public String AdContent { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "Vị trí quá dài.")]
        public string Position { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "Trên trang quá dài.")]
        public string OnPage { get; set; }
        //
    }
}