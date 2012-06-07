using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;


namespace CVLK2011.Models
{
    [MetadataType(typeof(Career_Validation))]
    public partial class Career
    {
    }
    public class Career_Validation
    {
        [Required(ErrorMessage = "Nhập ngành nghề!")]
        [StringLength(250, ErrorMessage = "Ngành nghề quá dài!")]
        public String CareerName { get; set; }
        //
    }
}
