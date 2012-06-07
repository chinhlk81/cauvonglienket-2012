using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;


namespace CVLK2011.Models
{
    [MetadataType(typeof(OlineSupport_Validation))]
    public partial class OlineSupport
    {
    }
    public class OlineSupport_Validation
    {
        [Required(ErrorMessage = "Nhập điện thoại!")]
        [StringLength(15, ErrorMessage = "Số điện thoại quá dài")]
        public String OSPhone1 { get; set; }
        //
        [StringLength(15, ErrorMessage = "Số điện thoại quá dài")]
        public String OSPhone2 { get; set; }
       //
        [Required(ErrorMessage = "Địa chỉ Email")]
        [RegularExpression(@"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
               @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
               @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$", ErrorMessage = "Địa chỉ Email không hợp lệ")]
        public string OSEmailTo1 { get; set; }
        
        //
        [RegularExpression(@"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
              @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
              @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$", ErrorMessage = "Địa chỉ Email không hợp lệ")]
        public string OSEmailTo2 { get; set; }
        //
        [Required(ErrorMessage = "Địa chỉ Email")]
        [RegularExpression(@"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
             @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
             @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$", ErrorMessage = "Địa chỉ Email không hợp lệ")]
        public string OSEmailFrom { get; set; }
        //
        [Required(ErrorMessage = "Nhập password Email gởi để cấu hình liên hệ ")]
        public String OSPwdEmailFrom { get; set; }
        //
        
        //
        [Required(ErrorMessage = "Nhập nick yahoo")]
        [StringLength(20, ErrorMessage = "Tên quá dài!")]
        public String OSYahoo1 { get; set; }
        //
        [Required(ErrorMessage = "Nhập nick Skype")]
        [StringLength(20, ErrorMessage = "Tên quá dài!")]
        public String OSSkype1 { get; set; }
        //
        [Required(ErrorMessage = "Nhập port")]
        [RegularExpression("([0-9]+)")]
        public int OSPort { get; set; }
        //
        [Required(ErrorMessage = "Nhập host/ vd: smtp.gmail.com")]
        public string OSHost { get; set; }

    }
}