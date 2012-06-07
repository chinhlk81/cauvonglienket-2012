using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class ConsultantsListViewModel
    {
        public IList<GetAllConsultants_Result> ConsultantList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentConsultant { get; set; }
        public GetConsultantByID_Result CurrentConsultantByID { get; set; }
    }
}