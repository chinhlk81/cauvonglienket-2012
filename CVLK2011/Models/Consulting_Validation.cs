using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;


namespace CVLK2011.Models
{
    [MetadataType(typeof(Consultingt_Validation))]
    public partial class Consulting
    {
    }
    public class Consultingt_Validation
    {
        [Required(ErrorMessage = "Nhập câu hỏi!")]
        [StringLength(1000, ErrorMessage = "câu hỏi quá dài!")]
        public String ConsultingQuestions { get; set; }
       
        [Required(ErrorMessage = "Nhập câu trả lời")]
        [StringLength(50, ErrorMessage = "Trả lời quá dài")]
        public String ConsultingAnwsers { get; set; }
        //
    }
}