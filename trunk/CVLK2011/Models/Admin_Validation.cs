using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{
    [MetadataType(typeof(Admin_Validation))]
    public partial class Admin
    {
        [Required(ErrorMessage = "Nhập lai Password")]
       // [StringLength(50, ErrorMessage = "Xác nhận mật khẩu")]
        public String ConfirmPassword { get; set; }
        //
        [Required(ErrorMessage = "Nhập mật khẩu cũ")]
        [StringLength(50, ErrorMessage = "ConfirmPassword")]
        public String OldPassword { get; set; }

    }

    public class Admin_Validation
    {
        [Required(ErrorMessage = "Tên đăng nhập!")]
        [StringLength(30, ErrorMessage = "Tên quá dài")]
        public String UserName { get; set; }

        [Required(ErrorMessage = "Mật khẩu")]
        [StringLength(50, ErrorMessage = "Mật khẩu quá dài")]
        public String Password { get; set; }
        //
        [Required(ErrorMessage = "Chọn")]
        public string Type { get; set; }
    }
}