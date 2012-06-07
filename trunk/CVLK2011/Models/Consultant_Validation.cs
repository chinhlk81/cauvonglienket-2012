using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;


namespace CVLK2011.Models
{
    [MetadataType(typeof(Consultant_Validation))]
    public partial class Consultant
    {
    }
    public class Consultant_Validation
    {
        [Required(ErrorMessage = "Nhập họ tên!")]
        [StringLength(20, ErrorMessage = "Tên quá dài!")]
        public String ConsultantName { get; set; }
        //
        string pattern = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
               @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
               @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
        [Required(ErrorMessage = "Địa chỉ Email")]
        [RegularExpression(@"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
               @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
               @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$", ErrorMessage = "Địa chỉ Email không hợp lệ")]
        public string ConsultantEmail { get; set; }
        
        //
        [Required(ErrorMessage = "Số điện thoại")]
        [StringLength(50, ErrorMessage = "Số điện thoại quá dài")]
        public String ConsultantPhone { get; set; }
        //
        [Required(ErrorMessage = "YahooID")]
        [StringLength(15, ErrorMessage = "ID Quá dài")]
        public String ConsultantYahooID { get; set; }
        //
        [Required(ErrorMessage = "SkypeID")]
        [StringLength(50, ErrorMessage = "ID quá dài")]
        public String ConsultantSkypeID { get; set; }
        //
    }
}