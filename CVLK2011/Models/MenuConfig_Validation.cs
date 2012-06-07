using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;


namespace CVLK2011.Models
{
    [MetadataType(typeof(MenuConfig_Validation))]
    public partial class MenuConfig
    {
    }
    public class MenuConfig_Validation
    {
        [Required(ErrorMessage = "Nhập tên Menu!")]
        [StringLength(50, ErrorMessage = "Tên quá dài!")]
        public String MenuConfigName { get; set; }
        //
        
        //
        [Required(ErrorMessage = "Nhập nội dung")]
        [StringLength(2000, ErrorMessage = "Nội dung quá dài")]
        public String Contents { get; set; }
        //
        
    }
}