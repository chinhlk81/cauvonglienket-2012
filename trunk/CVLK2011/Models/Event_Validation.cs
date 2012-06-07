using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{
    [MetadataType(typeof(Event_Validation))]
    public partial class Event
    {

    }

    public class Event_Validation
    {
        [Required(ErrorMessage = "Tiêu đề!")]
        [StringLength(200, ErrorMessage = "Tiêu đề quá dài!")]
        public string EventName { get; set; }

        [Required(ErrorMessage ="Nội dung không được trống")]
        [StringLength(1000, ErrorMessage = "Nội dung phải dưới 1000 kí tự")]
        public string EventContent { get; set; }
        //
        [Required(ErrorMessage = "Địa điểm")]
        [StringLength(500, ErrorMessage = "Địa điểm")]
        public string EventLocation { get; set; }

        //
        [Required(ErrorMessage = "Thời gian")]
        //[StringLength(1000, ErrorMessage = "Description")]
        public string EventTime { get; set; }
        //
        [Required(ErrorMessage = "Độ tuổi")]
        [StringLength(50, ErrorMessage = "Độ tuổi tham dự quá dài")]
        public string EventAgeJoint { get; set; }


    }
}