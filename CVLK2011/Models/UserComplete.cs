using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class UserAutoComplete
    {
        public String PersonId { get; set; }
        public String FullName { get; set; }

        internal object FindPeople(string searchText, int maxResults)
        {
            List<UserAutoComplete> names = new List<UserAutoComplete>();

            BuildNameList(names, searchText);

            //var result = from n in names
            //             where n.FullName.Contains(searchText)
            //             orderby n.FullName
            //             select n;
           
            //return result.Take(maxResults).ToList();
            return names;
        }
        private static void BuildNameList(List<UserAutoComplete> names, String search)
        {
            DBContainer ctx = new DBContainer();
            IEnumerable<User> users = ctx.GetUsers().OrderBy(p=>p.UserFullName).ToList();
            foreach (var item in users)
            {
                if (item.UserFullName.ToLower().Contains(search.ToLower()))
                    names.Add(new UserAutoComplete { PersonId = item.UserID.ToString(), FullName = item.UserFullName });
            }
        }


    }
}