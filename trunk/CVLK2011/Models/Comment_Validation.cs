using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{
    [MetadataType(typeof(Comment_Validation))]
    public partial class Comment
    {
       // public string Subcomment { get; set; }
    }

    public class Comment_Validation
    {
        [Required(ErrorMessage="Nội dung comment")]
        [StringLength(500,ErrorMessage="Comment quá dài")]
        public string CommentContent{get;set;}

        // [Required(ErrorMessage="Nội dung comment")]
        //public string Subcomment { get; set; }
    }
}