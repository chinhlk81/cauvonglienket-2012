using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class EventsListViewModel
    {
        public IList<Event> Products { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentCategory { get; set; }
        //filter conditions
        public string Filter { get; set; }
    }
}