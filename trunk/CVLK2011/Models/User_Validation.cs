using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Linq;
namespace CVLK2011.Models
{
    [MetadataType(typeof(User_Validation))]
    public partial class User
    {
        [Required(ErrorMessage = "*")]
        public String ConfirmPassword { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public String OldPassword { get; set; }
        // Tearm of uses
        [Required(ErrorMessage="Đồng ý sử dụng")]
        public bool TearmOfUse { get; set; }
        //word varification
        public string ConfirmWord { get; set; }
        //is exist user Name
        public bool IsEsitsName{get;set;}
    }

    public class User_Validation
    {
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "Họ và Tên quá dài.")]
        public string UserFullName { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(250, ErrorMessage = "Địa chỉ quá dài.")]
        public string UserAddLine { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string UserAddCity { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "Tài khoản quá dài.")]
        public string UserName { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string Password { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(20, ErrorMessage = "Số điện thoại quá dài.")]
        public string UserPhone { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [RegularExpression(@"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
                @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
                @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$", ErrorMessage = "Email không đúng định dạng (ví dụ: infor@vnecom.com).")]
        public string UserEmail { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(20, ErrorMessage = "Số CMND quá dài.")]
        public string UserIDCard { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public DateTime UserBirthday { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string UserGender { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string UserLevel { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string UserReligion { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string UserMaritalStatus { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string UserCareer { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "Thông tin này quá dài.")]
        public string UserJobPosition { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Tên dịch vụ quá dài!")]
        public string UserFavColor { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserReadingBook { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserFavPet { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserPeopleLike { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserPeopleDislike { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserHobby { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserLookingObj { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserRequirements { get; set; }       
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserHope { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserFavFoods { get; set; }
        //
        [Required(ErrorMessage = "*")]
        [StringLength(500, ErrorMessage = "Thông tin này quá dài")]
        public string UserOjbLikeDating { get; set; }
        //

        [Required(ErrorMessage = "*")]
        public string UserWage { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public string UserWorkingTime { get; set; }
        //
        [Required(ErrorMessage = "*")]
        public int UserEventParentID { get; set; }
        //
        [Required(ErrorMessage = "Nhập thời hạn VIP")]
        public double VIPPeriod { get; set; }
        //
        [Required(ErrorMessage = "Nhập ngày thanh toán")]
        public DateTime UserDatePayment { get; set; }
    }
}