using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class ConsultingsListViewModel
    {
        public IList<GetAllConsultings_Result> Products { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentCategory { get; set; }
        public GetConsultingByID_Result CurrentConsulting { get; set; }
        //filter conditions
        public string Filter { get; set; }
    }
}