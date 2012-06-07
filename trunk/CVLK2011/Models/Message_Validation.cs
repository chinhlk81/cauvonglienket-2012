using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{

    [MetadataType(typeof(Message_Validation))]
    public partial class Message
    {
    }
    public class Message_Validation
    {
        [Required(ErrorMessage = "Tiêu đề!")]
        [StringLength(100, ErrorMessage = "Tiêu đề quá dài")]
        public String MessageTitle { get; set; }
        //
        [Required(ErrorMessage = "Nội dung!")]
        [StringLength(100, ErrorMessage = "Nội dung quá dài")]
        public String MessageContent { get; set; }
        //
        [Required(ErrorMessage = "Người nhận!")]
       // [StringLength(100, ErrorMessage = "Noi dung Qua dai")]
        public int FK_UserReceiptID { get; set; }
    }
}