using System;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CVLK2011.Models
{
    [MetadataType(typeof(VIPVideo_Validation))]
    public partial class VIPVideo
    {
        public string VideoLink { get; set; }
    }

    public class VIPVideo_Validation
    {
    }
}