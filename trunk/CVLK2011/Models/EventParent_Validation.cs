using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{
    [MetadataType(typeof(EventParent_Validation))]
    public partial class EventParent
    {

    }

    public class EventParent_Validation
    {
        [Required(ErrorMessage = "Tên dịch vụ!")]
        [StringLength(100, ErrorMessage = "Tên dịch vụ quá dài!")]
        public string EventParentName { get; set; }

        [Required(ErrorMessage = "Nội dung tóm tắt")]
        [StringLength(500, ErrorMessage = "Tóm tắt không quá 500 ký tự!")]
        public String EventParentTitle { get; set; }
    }
}