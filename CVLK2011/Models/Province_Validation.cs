using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;


namespace CVLK2011.Models
{
    [MetadataType(typeof(Province_Validation))]
    public partial class Province
    {
    }
    public class Province_Validation
    {
        [Required(ErrorMessage = "Nhập tỉnh thành!")]
        [StringLength(250, ErrorMessage = "Tỉnh thành quá dài!")]
        public String ProvinceName { get; set; }
        //
    }
}
