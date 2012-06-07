using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
namespace CVLK2011.Controllers.Member
{
    public class MemberFriendsController : BaseController
    {
        //
        // GET: /MemberFriends/
        DBContainer ctx = new DBContainer();
        public int PageSize = 40;

        public ActionResult Index(int id, string category, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");

                IEnumerable<GetAllFriendsOfCurrentUserByID_Result> lstFriends = ctx.GetAllFriendsOfCurrentUserByID(id).ToList();
                Session["GuestUserID"] = id;
                //paging
                var viewModel = new FriendsListViewModel();
                viewModel.FriendsOfCurrentUserList = lstFriends.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.FriendsOfCurrentUserPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstFriends.Count() };
                viewModel.FriendsOfCurrentUserCategory = category;
                ViewData["TotalFriends"] = lstFriends.Count();
                ViewData["TotalAmountWantMakeFriendsWithMe"] = CountUsersWantMakeFriendsWithMe(id);
                ViewData["TotalAmountIWantMakeFriends"] = CountUserIWantToMakeFriends(id);
                return View(viewModel);
            }
            catch { 
                ModelState.AddModelError("", "Load Index Failure, see inner exception");
            }
            return RedirectToAction("Index", "Home");
        }
        [HttpPost]//[AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult SearchFriendsInList(string FullName, string category, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");

                int iCurrentUserID = 0;
                if (Int32.TryParse(Session["CurrentUserID"].ToString(), out iCurrentUserID))
                {
                    var viewModel = new FriendsListViewModel();
                    IEnumerable<GetAllFriendsOfCurrentUserByID_Result> lstFriends = ctx.SearchAllFriendsOfCurrentUserIdByFullName(iCurrentUserID, FullName).ToList();

                    
                    viewModel.FriendsOfCurrentUserList = lstFriends.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                    viewModel.FriendsOfCurrentUserPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstFriends.Count() };
                    viewModel.FriendsOfCurrentUserCategory = category;

                    ViewData["TotalFriends"] = lstFriends.Count();
                    ViewData["TotalAmountWantMakeFriendsWithMe"] = CountUsersWantMakeFriendsWithMe(iCurrentUserID);
                    ViewData["TotalAmountIWantMakeFriends"] = CountUserIWantToMakeFriends(iCurrentUserID);
                    if (lstFriends.Count() == 0)
                        ViewData["NoneFriendsMessage"] = "Không có bạn nào phù hợp với kết quả " + FullName.ToUpper();

                    return View("Index", viewModel);
                }
                else
                    return RedirectToAction("Index", "Home");
            }
            catch
            {
                ModelState.AddModelError("", "Search Failure, see inner exception");
                return RedirectToAction("Index", "Home");
            }
            
        }
        public ActionResult NewFriends(string category, int page = 1)
        {
            try
            {
                int iCurrentUserID = 0;
                if (Int32.TryParse(Session["CurrentUserID"].ToString(), out iCurrentUserID))
                {
                    IEnumerable<GetAllUsersCanMakeFriendsByCurrentUserID_Result> lst = ctx.GetAllUsersCanMakeFriendsByCurrentUserID(iCurrentUserID).ToList();
                    //paging
                    var viewModel = new FriendsListViewModel();
                    viewModel.UsersCanMakeFriendsList = lst.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                    viewModel.UsersCanMakeFriendsPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lst.Count() };
                    viewModel.UsersCanMakeFriendsCategory = category;

                    return View(viewModel);
                }
                else
                    return RedirectToAction("Index", "Home");
            }
            catch
            {
                ModelState.AddModelError("", "Search Failure, see inner exception");
                return RedirectToAction("Index", "Home");
                //return View();
            }
        }
        [HttpPost]//[AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult SearchNewFriendsInList(string userFullName, string category, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");

                int iCurrentUserID = 0;
                if (Int32.TryParse(Session["CurrentUserID"].ToString(), out iCurrentUserID))
                {
                    IEnumerable<GetAllUsersCanMakeFriendsByCurrentUserID_Result> lstFriends = ctx.SearchAllNewFriendsByCurrentUserIdAndFullName(iCurrentUserID, userFullName).ToList();
                    //paging
                    var viewModel = new FriendsListViewModel();
                    viewModel.UsersCanMakeFriendsList = lstFriends.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                    viewModel.UsersCanMakeFriendsPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstFriends.Count() };
                    viewModel.UsersCanMakeFriendsCategory = category;

                    ViewData["TotalNewFriends"] = lstFriends.Count();
                    if (lstFriends.Count() == 0)
                        ViewData["NoneFriendsMessage"] = "Không có bạn nào phù hợp với kết quả " + userFullName.ToUpper();

                    return View("NewFriends", viewModel);
                }
                else
                    return RedirectToAction("Index", "Home");
            }
            catch
            {
                ModelState.AddModelError("", "Search Failure, see inner exception");
                return RedirectToAction("Index", "Home");
            }
        }
        public ActionResult MakeFriend(int iFriendID)
        {
            //cần kiểm tra đã gửi yêu cầu kết bạn chưa?   
            Friend objFriendInfo = new Friend();
            int iCurrentUserID = 0;
            if (Int32.TryParse(Session["CurrentUserID"].ToString(), out iCurrentUserID))
            {
                
                objFriendInfo.UserID = iCurrentUserID;
                objFriendInfo.FriendID = iFriendID;
                objFriendInfo.Status = Utilities.cstNewStatus;
                GetUserByID_Result objUserInfo = ctx.GetUserByID(iCurrentUserID).Single(p => p.UserID == iCurrentUserID);
                if(objUserInfo !=null)
                    objFriendInfo.Description = objUserInfo.UserFullName + " muốn kết bạn cùng bạn!";

                ctx.AddToFriends(objFriendInfo);
                ctx.SaveChanges();

                return RedirectToAction("NewFriends", "MemberFriends");
            }
            return RedirectToAction("NewFriends", "MemberFriends"); 
        }
        public ActionResult ShowUsersWantToMakeFriends(int iUserID, string category, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");

                IEnumerable<GetAllUsersWantToMakeFriendsWithMe_Result> lstUsers = ctx.GetAllUsersWantToMakeFriendsWithMe(iUserID).ToList();
                Session["GuestUserID"] = iUserID;
                //paging
                var viewModel = new FriendsListViewModel();
                viewModel.UsersWantToMakeFriendsWithMeList = lstUsers.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.UsersWantToMakeFriendsWithMePagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstUsers.Count() };
                viewModel.UsersWantToMakeFriendsWithMeCategory = category;
                ViewData["TotalFriends"] = lstUsers.Count();
                return View(viewModel);
            }
            catch
            {
                ModelState.AddModelError("", "Load Index Failure, see inner exception");
                return RedirectToAction("Index", "Home");
            }
        }
        public ActionResult UpdateStatusToFriends(int iUserID, int iFriendID, string strStatus)
        {
            int i = ctx.UpdateStatusToFriends(iUserID, iFriendID, strStatus);
            if (i == -1)
                return RedirectToAction("ShowUsersWantToMakeFriends", "MemberFriends", new { iUserID = iUserID, category = string.Empty, page = 1 });
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Delete(int iUserID, int iFriendID, int iPage)
        {
            ctx.DeleteFriendFromFriendsList(iUserID, iFriendID);
            return RedirectToAction("Index", "MemberFriends", new { id = iUserID, category = String.Empty, page = 1 });
        }
        public int CountUsersWantMakeFriendsWithMe(int iCurrentUserID)
        {
            int iNewFriendsCnt = 0;
            IEnumerable<GetAllUsersWantToMakeFriendsWithMe_Result> lstUsers = ctx.GetAllUsersWantToMakeFriendsWithMe(iCurrentUserID).ToList();
            if(lstUsers!=null)
                iNewFriendsCnt = lstUsers.Count();
            return iNewFriendsCnt;
        }
        public int CountUserIWantToMakeFriends(int iCurrentUserID)
        {
            int iNewFriendsCnt = 0;
            try
            {
                IEnumerable<GetAllUsersCanMakeFriendsByCurrentUserID_Result> lstUsers = ctx.GetAllUsersIWantToMakeFriends(iCurrentUserID).ToList();
                if (lstUsers != null)
                    iNewFriendsCnt = lstUsers.Count();
                
            }
            catch (ArgumentNullException ae){
                ModelState.AddModelError("I want to make friends! Count Failure, see inner exception", ae);
            }
            return iNewFriendsCnt; 
        }
        public ActionResult AdvanceSearch()
        {
            CVLK2011.Models.User objUserInfo =  new CVLK2011.Models.User();
            return View(objUserInfo);
        }
        [HttpPost]//[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AdvanceSearchResult([Bind(Exclude = "UserID")] CVLK2011.Models.User objUserInfo, FormCollection frmcollection, string category, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");

                int iAgeFrom = 0;
                int iAgeTo = 0;
                Int32.TryParse(frmcollection["AgeFrom"], out iAgeFrom);
                Int32.TryParse(frmcollection["AgeTo"], out iAgeTo);
                int iCurrentUserID = 0;
                if (Int32.TryParse(Session["CurrentUserID"].ToString(), out iCurrentUserID))
                {
                    IEnumerable<GetAllUsersCanMakeFriendsByCurrentUserID_Result> lstFriends =
                        ctx.Users_AdvanceSearch(iCurrentUserID, frmcollection["UserFullName"], frmcollection["UserGender"],
                                                frmcollection["UserEmail"], frmcollection["UserAddCity"],
                                                iAgeFrom, iAgeTo,
                                                frmcollection["UserHeight"], frmcollection["UserWeight"],
                                                frmcollection["UserFavColor"], frmcollection["UserFavFoods"], frmcollection["UserReadingBook"], frmcollection["UserFavPet"],
                                                frmcollection["UserPeopleLike"], frmcollection["UserPeopleDislike"], frmcollection["UserHobby"],
                                                frmcollection["UserCareer"], frmcollection["UserJobPosition"], frmcollection["UserTimeContact"]).ToList();
                    //paging
                    var viewModel = new FriendsListViewModel();
                    viewModel.UsersCanMakeFriendsList = lstFriends.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                    viewModel.UsersCanMakeFriendsPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstFriends.Count() };
                    viewModel.UsersCanMakeFriendsCategory = category;

                    ViewData["TotalNewFriends"] = lstFriends.Count();
                    if (lstFriends.Count() == 0)
                        ViewData["NoneFriendsMessage"] = "Không có bạn nào phù hợp với kết quả ";

                    return View("NewFriends", viewModel);
                }
            }
            catch
            {
                ModelState.AddModelError("", "Search Failure, see inner exception");
            }
            return RedirectToAction("Index", "Home");
        }
        /// <summary>
        /// Description: Friends list on left pane
        /// </summary>
        /// <param name="currentFriend"></param>
        /// <param name="page"></param>
        /// <returns></returns>
        public ActionResult Friends(string currentFriend, int page = 1)
        {
            var model = new FriendsListViewModel();
            int iuserId = Convert.ToInt32(Session["CurrentUserID"]);
            IEnumerable<GetAllFriendsByUser_Result> friendList = ctx.GetAllFriendsByUser(iuserId).ToList();
            model.FriendsList = friendList.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = friendList.Count() };
            model.CurrentCategory = currentFriend;
            return View(model);

        }
        public bool CheckUserExistInFriendsList(int iCurrentUserID, int iUserID, string strFriendStatus)
        {
            bool bCheck = false;
            Friend friendInfo = ctx.UserExistInFriendsList(iCurrentUserID, iUserID, strFriendStatus).FirstOrDefault();
            if (friendInfo != null)
                bCheck = true;
            return bCheck;
        }
    }
}
