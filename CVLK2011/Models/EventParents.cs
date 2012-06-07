using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class EventParents
    {
        public String EventParentName { get; set; }
        public string EventParentID { get; set; }
        internal object FindParents()
        {
            List<EventParents> eveprts = new List<EventParents>();

            BuilEventParentList(eveprts);

            //var result = from n in names
            //             where n.FullName.Contains(searchText)
            //             orderby n.FullName
            //             select n;

            //return result.Take(maxResults).ToList();
            return eveprts;
        }
        private static void BuilEventParentList(List<EventParents> eveprt)
        {
            DBContainer ctx = new DBContainer();
            IEnumerable<GetAllEventParents_Result> list = ctx.GetAllEventParents().ToList();
            foreach (var item in list)
            {
                eveprt.Add(new EventParents { EventParentName = item.EventParentName, EventParentID = item.EventParentID.ToString() });
            }
        }
    }
}