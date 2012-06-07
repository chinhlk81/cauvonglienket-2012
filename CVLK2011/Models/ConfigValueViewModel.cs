using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class ConfigValueViewModel
    {
        public  IList<Province> provinceList { get; set; }
        public IList<Career> careerList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentProvince { get; set; }
        public String ProvinceName { get; set; }
        public String ProvinceDesc { get; set; }
        public String CareerName { get; set; }
        public string CareerDesc { get; set; }
    }
}