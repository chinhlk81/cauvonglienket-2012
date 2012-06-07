using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Objects.DataClasses;
namespace CVLK2011.Models
{
    public partial class FriendsListViewModel
    {
        public IList<GetAllFriendsByUser_Result> FriendsList { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public string CurrentCategory { get; set; }

        //Added by: Hoang.Nguyen
        //Added date: 2011.03.31
        public IList<GetAllFriendsOfCurrentUserByID_Result> FriendsOfCurrentUserList { get; set; }
        public PagingInfo FriendsOfCurrentUserPagingInfo { get; set; }
        public string FriendsOfCurrentUserCategory { get; set; }

        //Added by: Hoang.Nguyen
        //Added date: 2011.03.31
        public IList<GetAllUsersCanMakeFriendsByCurrentUserID_Result> UsersCanMakeFriendsList { get; set; }
        public PagingInfo UsersCanMakeFriendsPagingInfo { get; set; }
        public string UsersCanMakeFriendsCategory { get; set; }

        //Added by: Hoang.Nguyen
        //Added date: 2011.03.31
        public IList<SearchAllFriendsOfCurrentUserIdByFullName_Result> SearchAllFriendsOfCurrentUserList { get; set; }
        public PagingInfo SearchAllFriendsOfCurrentUserPagingInfo { get; set; }
        public string SearchAllFriendsOfCurrentUserCategory { get; set; }

        public IList<GetAllUsersWantToMakeFriendsWithMe_Result> UsersWantToMakeFriendsWithMeList { get; set; }
        public PagingInfo UsersWantToMakeFriendsWithMePagingInfo { get; set; }
        public string UsersWantToMakeFriendsWithMeCategory { get; set; }
        //Hoang testing
        public string userFullName { get; set; }
        public int iCurrentUserID { get; set; }
        //filter conditions
        public string Filter { get; set; }
    }
}