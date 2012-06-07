using System.Collections.Generic;
namespace CVLK2011.Models
{
    public class MenuConfigsListViewModel
    {
        public IList<MenuConfig> MenuConfigsList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentMenuConfigs { get; set; }
        //filter conditions
        public string Filter { get; set; }
    }
}