using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
namespace CVLK2011.Models
{
    [MetadataType(typeof(Blog_Validation))]
    public partial class Blog
    {
       // public String StatusText { get; set; }
    }

    public class Blog_Validation
    {
        [Required(ErrorMessage = "Tiêu để blog")]
        [StringLength(200, ErrorMessage = "Tiêu đề quá dài")]
        public String BlogTitle { get; set; }
        //
        [Required(ErrorMessage = "Nhập nội dung")]
        [StringLength(1000, ErrorMessage = "Nội dung quá dài")]
        public String BlogContent { get; set; }
    }
}