using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class EventParentsListViewModel
    {
        public IList<GetAllEventParents_Result> EventParentsList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentEventParents { get; set; }
        //event parents 
        public GetEventParentByID_Result EventParent { get; set; }
    }
}