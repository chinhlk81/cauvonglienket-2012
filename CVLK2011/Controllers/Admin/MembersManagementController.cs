using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
using CVLK2011.HtmlHelpers;
using System.Data.Objects.DataClasses;
using System.Data.Objects;
using System.Web.Routing;
using System.Text;

namespace CVLK2011.Controllers.Admin
{
    [HandleError]
    public class MembersManagementController : BaseController
    {
        //
        // GET: /QuanLyThanhVien/
        private const String strNewUserStatus = "New";
       public int PageSize =20 ;
        Models.DBContainer ctx = new DBContainer();
       
        #region--Users--
        public ActionResult Index(string userType, string userGender, string userStatus, string eventParrent, int page=1)
        {
            if (!IsAuthenticateAdmin()) 
                return RedirectToAction("LogOn", "AdminHome");

            if (userType == null) userType = string.Empty;
            if (userGender == null) userGender = string.Empty;
            if (userStatus == null) userStatus = string.Empty;
            if (eventParrent == null) eventParrent = string.Empty;
            int iEventParrent = 0;
            Int32.TryParse(eventParrent, out iEventParrent);
            InitUserStatusDropdownlist();
            InitEventDropdownlist();
            InitAccountTypeDropdownlist();
            IEnumerable<GetAllUsers_Result> user = ctx.Admin_FilterForUsers(userType, userGender, userStatus, iEventParrent).ToList();
            //user = ctx.GetAllUsers().Where(ut => ut.UserType == userType).Where(ug => ug.UserGender == userGender).Where(us => us.UserStatus == userStatus).Where(ue => ue.UserEventParentID == iEventParrent).ToList();
            var viewModel = new UserListViewModel();

            viewModel.userTypeFilter = userType;
            viewModel.userGenderFilter = userGender;
            viewModel.userStatusFilter = userStatus;
            viewModel.userEventParrent = eventParrent;
            // hoang.nguyen added 2011.12.19.1059
            viewModel.UserQty = user.Count();
            ViewData["UserQty"] = viewModel.UserQty;
            viewModel.UserList = user.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = user.Count() };
            return View(viewModel);
        }
        private ActionResult InitUserStatusDropdownlist()
        {
            var configValues = from cfv in ctx.ConfigValues
                               where cfv.ConfigKeyGroup == "Users"
                               orderby cfv.ConfigText ascending
                               select cfv;
            IEnumerable<SelectListItem> userStatusItems = configValues.Select(
                items => new SelectListItem
                {
                    Value = items.ConfigKeyValue,
                    Text = items.ConfigText
                });
            ViewData["UserStatus"] = userStatusItems;
            return PartialView("Index", ViewData["UserStatus"]);
        }
        private ActionResult InitEventDropdownlist()
        {
            var eventParents = from e in ctx.EventParents
                                where e.Status != "Dummy" || e.Status != "Delete"
                               orderby e.EventParentName ascending
                               select e;

            //IEnumerable<SelectListItem> eventItems = eventParrents.Select(
            //    items => new SelectListItem
            //    {
            //        Value = items.EventParentID.ToString(),
            //        Text = items.EventParentName
            //    });
            IEnumerable<GetAllEventParents_Result> eventParrentItems = ctx.GetAllEventParents().ToList();

            ViewData["Events"] = new SelectList(eventParrentItems, "EventParentID", "EventParentName");
            return PartialView("Index", ViewData["Events"]);

        }
        private ActionResult InitAccountTypeDropdownlist()
        {
            var configValues = from cfv in ctx.ConfigValues
                               where cfv.ConfigKeyGroup == "AccountType"
                               orderby cfv.ConfigText ascending
                               select cfv;
            IEnumerable<SelectListItem> userStatusItems = configValues.Select(
                items => new SelectListItem
                {
                    Value = items.ConfigKeyValue,
                    Text = items.ConfigText
                });
            ViewData["accountType"] = userStatusItems;
            return PartialView("Index", ViewData["accountType"]); 
        }

        public ActionResult Details(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetUserByID_Result user = ctx.GetUserByID(id).FirstOrDefault();
                //update status to Active
                if (user.UserStatus == Utilities.cstNewStatus)
                    ctx.ActiveUser(id);
                if (user.UserIsVIP)
                {
                    user.VIPRemain = user.VIPPeriod - (DateTime.Today.DayOfYear - user.UserDatePayment.Value.DayOfYear);
                    ctx.SaveChanges();
                }
                return PartialView("Details",user);
            }
            catch
            {
                return View();
            }
        }
        public ActionResult FriendsList(int id, string category, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");

                IEnumerable<GetAllFriendsOfCurrentUserByID_Result> lstFriends = ctx.GetAllFriendsOfCurrentUserByID(id).ToList();
                ViewData["UserID"] = id;
                //paging
                var viewModel = new FriendsListViewModel();
                viewModel.FriendsOfCurrentUserList = lstFriends.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.FriendsOfCurrentUserPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstFriends.Count() };
                viewModel.FriendsOfCurrentUserCategory = category;
                ViewData["TotalFriends"] = lstFriends.Count();
                return View(viewModel);
            }
            catch
            {
                ModelState.AddModelError("", "Load Index Failure, see inner exception");
            }
            return RedirectToAction("Index", "MembersManagement");
        }
        [HttpPost]//[AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult SearchFriendsInList(int userID, string FullName, string category, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");

                var viewModel = new FriendsListViewModel();
                IEnumerable<GetAllFriendsOfCurrentUserByID_Result> lstFriends = ctx.SearchAllFriendsOfCurrentUserIdByFullName(userID, FullName).ToList();

                ViewData["UserID"] = userID;
                viewModel.FriendsOfCurrentUserList = lstFriends.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.FriendsOfCurrentUserPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstFriends.Count() };
                viewModel.FriendsOfCurrentUserCategory = category;

                ViewData["TotalFriends"] = lstFriends.Count();
                if (lstFriends.Count() == 0)
                    ViewData["NoneFriendsMessage"] = "Không có bạn nào phù hợp với kết quả " + FullName.ToUpper();

                return View("FriendsList", viewModel);
            }
            catch
            {
                ModelState.AddModelError("", "Search Failure, see inner exception");
                return RedirectToAction("Index", "Home");
            }

        }
        [HttpPost]
        public JsonResult UpdateUserType(int userID, string userType)
        {
            DelayResponse();
            try
            {
                if (!IsAuthenticateAdmin())
                    return Json("LogOn", "AdminHome");

                User user = ctx.Users.Single(p => p.UserID == userID);
                user.UserType = userType;
                ctx.SaveChanges();

                return Json("Details");

            }
            catch
            {
                return Json("Error");
            }

        }
        public ActionResult FilterMembers(string userType, string userGender, string userStatus, string eventParrent, string accountType, int page = 1 )
        {
            DelayResponse();

            if (userType == null) userType = string.Empty;
            if (userGender == null) userGender = string.Empty;
            if (userStatus == null) userStatus = string.Empty;
            if (eventParrent == null) eventParrent = string.Empty;
            if (accountType == null) accountType = null;
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");

                String currentUser = string.Empty;
                #region bak
                //test
                //var users =
                //            from u in ctx.Users
                //            where
                //                ((u.UserType == String.Empty) || (u.UserType == userType))
                //            &&
                //                ((u.UserGender == String.Empty) || (u.UserGender == userGender))
                //            &&
                //                ((u.UserStatus == String.Empty) || (u.UserStatus == userStatus))

                //            from eventParrents in ctx.EventParents
                //            where
                //                u.UserEventParentID == eventParrents.EventParentID
                //            from config in ctx.ConfigValues
                //            where
                //                u.UserStatus == config.ConfigKey
                //            &&
                //                config.ConfigKeyGroup == "Users"
                //            orderby u.UserRegisterDate descending

                //            select u;
                            
                //IEnumerable<GetAllUsers_Result> user = ctx.GetAllUsers().Where(
                //    p => (
                //        ((p.UserType == String.Empty) || (p.UserType ==userType))
                //        &&
                //        ((p.UserStatus == String.Empty) || (p.UserStatus == userStatus))
                //        &&
                //        ((p.UserGender == String.Empty) || (p.UserGender == userGender))
                //    )).ToList();
                #endregion
                int iEventParrent = 0;
                Int32.TryParse(eventParrent, out iEventParrent);
                IEnumerable<GetAllUsers_Result> user;
                if (string.IsNullOrEmpty(accountType))
                    user = ctx.Admin_FilterForUsers(userType, userGender, userStatus, iEventParrent).ToList();
                else
                    user =
                        ctx.Admin_FilterForUsers(userType, userGender, userStatus, iEventParrent).Where(
                            users => users.UserIsVIP.ToString().Equals(accountType)).ToList();
                var viewModel = new UserListViewModel();
                viewModel.userTypeFilter = userType;
                viewModel.userGenderFilter = userGender;
                viewModel.userStatusFilter = userStatus;
                viewModel.userEventParrent = eventParrent;
                viewModel.UserList = user.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = user.Count() };
                viewModel.CurrentUser = currentUser;
                return PartialView("UCUsers", viewModel);
            }
            catch
            {
                return Json("Error");
            }
        }
        private static void DelayResponse()
        {
            //Never add sleep in production code
            //Used here to demonstrate the "loading.." display 
            //for the CascadingDropDown jQuery plugin
            System.Threading.Thread.Sleep(100);
        }
        public ActionResult CheckVIP(int id, string currentUser, string filter, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                User us = ctx.Users.Single(p => p.UserID == id);
                if (us.UserIsVIP)
                    us.UserIsVIP = false;
                else
                    us.UserIsVIP = true;
                ctx.SaveChanges();
                var model = GetUsers(filter, currentUser, page);
                return PartialView("UCUsers",model);
               // return RedirectToAction("Index", new { currentUser = currentUser });

            }
            catch
            {
                return View();
            }
        }
        //get user
        public UserListViewModel GetUsers(String gender, String currentUser, int page)
        {
            IEnumerable<GetAllUsers_Result> user = null;
            if (String.IsNullOrEmpty(gender))
                user = ctx.GetAllUsers().ToList();
            else
                user = ctx.GetAllUsers().Where(p => p.UserGender == gender).ToList();
            var viewModel = new UserListViewModel();
            viewModel.userGenderFilter = gender;
            viewModel.UserList = user.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = user.Count() };
            viewModel.CurrentUser = currentUser;
            return viewModel;
        }
        //check vip on details view
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditVIP(int id,FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                User us = ctx.Users.Single(p => p.UserID == id);
                us.UserIsVIP = true;
                us.VIPPeriod=Convert.ToDouble(collection["VIPPeriod"].ToString());
                DateTime dtPayment = DateTime.Today;
                DateTime.TryParse(collection["PaymentDate"], out dtPayment);
                us.UserDatePayment = dtPayment;
                us.VIPRemain =us.VIPPeriod-(DateTime.Today.DayOfYear- dtPayment.DayOfYear);
                ctx.SaveChanges();
                return RedirectToAction("Edit", new { id = id });

            }
            catch
            {
                return RedirectToAction("Edit", new { id = id });
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpGradeVIP(int id, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                User us = ctx.Users.Single(p => p.UserID == id);
                us.UserIsVIP = true;
                us.VIPPeriod = Convert.ToDouble(collection["VIPPeriod"].ToString());
                DateTime dtPayment = DateTime.Today;
                DateTime.TryParse(collection["PaymentDate"], out dtPayment);
                us.UserDatePayment = dtPayment;
                us.VIPRemain = us.VIPPeriod - (DateTime.Today.DayOfYear - dtPayment.DayOfYear);
                ctx.SaveChanges();
                return RedirectToAction("Details", new { id = id });

            }
            catch
            {
                return RedirectToAction("Details", new { id = id });
            }
        }
        //Upgrade VIP member
        //public ActionResult UpGradeVIP(int id)
        //{
        //    try
        //    {
        //        if (!IsAuthenticateAdmin())
        //            return RedirectToAction("LogOn", "AdminHome");
        //        ctx.UpGradeUserVIP(id);
        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
        // cancel VIP member
        
        public ActionResult CancelVIP(int id,String view)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.CancelUserVIP(id);
                DeleteVideoByUser(id,view);
                if(view=="Details")
                    return RedirectToAction("Details", new { id = id });
                return RedirectToAction("Edit", new { id = id });

            }
            catch
            {
                return View();
            }
        }
        //Delete user-->Update status to Delete
        public ActionResult DeleteUser(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.DeleteUser(id);
                DeleteAllReferenceByUserID(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        // Active user
        public ActionResult ActiveUser(int id,String view)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.ActiveUser(id);
                if (view == "Edit")
                {
                    return RedirectToAction("Edit", new { id = id });
                }
                return RedirectToAction("Details",new{id=id});
            }
            catch
            {
                return View();
            }
        }
        //deactivate user
        public ActionResult DeactivateUser(int id,String view)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.DeActivateUser(id);
                //del video share by user
                ctx.DeleteShareVideoByUserID(id);
                //delete all friend by user
                DeleteAllFriendByUserID(id);
                if (view == "Edit")
                {
                    return RedirectToAction("Edit", new { id = id });
                }
                return RedirectToAction("Details", new { id=id});
            }
            catch
            {
                return View();
            }
        }
        public void DeleteAllReferenceByUserID(int id)
        {
            DeleteAllBlogByUserID(id);
            DeleteAllCommentByUserID(id);
            DeleteAllAlbumAndPhotosByUserID(id);
            DeleteAllFriendByUserID(id);


        }
        //delete all blogs
        public void DeleteAllBlogByUserID(int id)
        {
            string virtualPath = "~/Images/Blogs";
            IEnumerable<GetAllBlogs_Result> blogs = ctx.GetAllBlogByUserID(id).ToList();
            if (blogs != null)
            {
                foreach (var item in blogs)
                {
                    GetBlogByID_Result result = ctx.GetBlogByID(item.BlogID).FirstOrDefault();
                    if (result != null)
                    {
                        String oldfile = result.ImageUpload;
                        ctx.DeleteBlog(result.BlogID);
                        Utilities.DeleteFile(Request, virtualPath, oldfile);
                    }
                }
            }
        }
        //delete all comments
        public void DeleteAllCommentByUserID(int id)
        {
            //string virtualPath = "~/Images/Blog";
           
                    ctx.DeleteAllCommentByUserID(id);
                
            
        }
        //delete all albums and photos by User
        public void DeleteAllAlbumAndPhotosByUserID(int id)
        {
            const string virtualPath = "~/Content/Images/";
           IEnumerable<Album> album= ctx.GetAllAlbumByUser(id);
           if (album != null)
           {
               foreach (var item in album)
               {
                  IEnumerable<Photo> photos= ctx.GetPhotoByAlbum(item.AlbumID);
                  if (photos != null)
                  {
                      foreach (var photo in photos)
                      {
                          String oldFile = photo.PhotoPath;
                          String oldOriginalFile = photo.PhotoOriginal;
                          ctx.DeletePhoto(photo.PhotoID);
                          Utilities.DeleteFile(Request, virtualPath, oldOriginalFile);
                          //delete thumbs
                          Utilities.DeleteFile(Request, virtualPath + "Thumbs/", oldFile);
                      }
                  }
                  ctx.DeleteAlbum(item.AlbumID);
               }
               
           }
        }
        //delete all message by user
        public void DeleteAllMessageByUserID(int id)
        {
            ctx.DeleteAllMessageByUserID(id);   
        }
        //delete all friend by user 
        public void DeleteAllFriendByUserID(int id)
        {
            ctx.DeleteAllFriendByUserID(id);
        }

        public ActionResult Create()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            CVLK2011.Models.Message msg = new Models.Message();
            return View(msg);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                if (collection.Count == 0)
                {
                    ViewData["MessageResult"] = "Vui lòng điền tên người nhận";
                    return View();
                }
                bool isSend = false;
                foreach (string key in collection.Keys)
                {
                    if (key.StartsWith("hd"))
                    {
                        int userID = 0;
                        string stringID = collection[key].ToString();
                        if (int.TryParse(stringID, out userID))
                        {
                            Message msg = new Message();
                            msg.MessageTitle = collection["MessageTitle"].ToString();
                            msg.MessageContent = collection["MessageContent"].ToString();
                            msg.Status = Models.Utilities.cstApprove;
                            msg.MessageIsReply = false;
                            msg.MessageUnRead = true;
                            msg.MessageDatetime = DateTime.Now;
                            msg.FK_UserReceiptID = userID;
                            msg.FK_UserSendID = Utilities.IDefaultUser;
                            msg.MessageType = "Admin";
                            ctx.AddToMessages(msg);
                            ctx.SaveChanges();
                            isSend = true;

                        }

                    }
                }
                if (isSend)
                {
                    ViewData["MessageResult"] = "Tin nhẳn của bạn đã được gởi đi!";
                   // var helper = new UrlHelper(HttpContext.Request.RequestContext);
                   // string url = helper.Action("MembersMessage", "MemberManagement");
                    //return Redirect(url);
                }
                else
                    ViewData["MessageResult"] = "Không gởi được.Vui lòng kiểm tra lại!";
                return View();
            }
            catch
            {
                return View();
            }
        }
        //register user
        public ActionResult Register()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");  
            Models.User user = new Models.User();
            IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
            ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName");
            IEnumerable<Province> provinces = ctx.Provinces.ToList();
            ViewData["UserAddCity"] = new SelectList(provinces, "ProvinceName", "ProvinceName");
            IEnumerable<Career> careers = ctx.Careers.ToList();
            ViewData["UserCareer"] = new SelectList(careers, "CareerName", "CareerName");
            return View(user);
        }
        /// <summary>
        /// Created by Hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Add user object to database
        /// </summary>
        /// <param name="objUserInfo"></param>
        /// <param name="collection"></param>
        /// <returns></returns>
        /// 
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Register([Bind(Exclude = "UserID")] CVLK2011.Models.User objUserInfo, FormCollection frmcollection)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");  
                CVLK2011.Controllers.Home.HomeController controller = new Home.HomeController();
                if ((!controller.CheckName(objUserInfo.UserName)) || (!controller.CheckEmail(objUserInfo.UserEmail)))
                {
                    IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
                    ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName");
                    ViewData["error"] = "Tên đăng nhập hoặc email đã có người dùng.";
                    return PartialView("Register");
                }

                //DateTime dteUserBirthday = DateTime.Today;
                //objUserInfo.UserRegisterDate = DateTime.Today;
                //if (DateTime.TryParse(frmcollection["UserBirthday"], out dteUserBirthday))
                //    objUserInfo.UserBirthday = dteUserBirthday.Date;
                
                string dteDD = frmcollection["UserBirthdayDD"];
                string dteMM = frmcollection["UserBirthdayMM"];
                string dteYYYY = frmcollection["UserBirthdayYYYY"];
                //string strDate = string.Format("{0},{1},{2}",dteDD,dteMM,dteYYYY);
                DateTime dtbirthdate = new DateTime(Convert.ToInt32(dteYYYY), Convert.ToInt32(dteMM), Convert.ToInt32(dteDD));
                EnCrypto encript = new EnCrypto();
                objUserInfo.UserBirthday = dtbirthdate.Date;
                objUserInfo.UserRegisterDate = DateTime.Today;
                objUserInfo.Password = encript.Encrypt(objUserInfo.Password);
                objUserInfo.UserEventParentID = Convert.ToInt32(frmcollection["eventParents"].ToString());
                objUserInfo.UserStatus = strNewUserStatus;
                objUserInfo.UserIsVIP = false;
                objUserInfo.UserPicture = "../../Images/Users/none.jpg";
                objUserInfo.UserType = Utilities.cstUserTypeNone;
                ctx.AddToUsers(objUserInfo);
                ctx.SaveChanges();
                string memberUrl = urlHelper.Action("Index", "MembersManagement");

                //try
                //{
                //    //send mail to info@cauvonglienket.com
                //    //mail subject
                //    String Subject = "Thành viên mới đăng ký ";
                //    //create mail body
                //    StringBuilder sbBody = new StringBuilder();
                //    sbBody.Append("\n");
                //    sbBody.Append("Tên thành viên: " + objUserInfo.UserFullName);
                //    sbBody.Append("\n");
                //    sbBody.Append("Email: " + objUserInfo.UserEmail);
                //    sbBody.Append("\n");
                //    sbBody.Append("Điện thoại: " + objUserInfo.UserPhone);
                //    sbBody.Append("\n");
                //    MailHelper.ReceiveByEmail(Subject, sbBody.ToString(), "info@cauvonglienket.com");
                //    //and send mail to regester
                //    String SubjectConfirm = "Cầu vồng liên kết ";
                //    //create mail body
                //    StringBuilder sbBodyConfirm = new StringBuilder();
                //    sbBodyConfirm.Append("\n");
                //    sbBodyConfirm.Append("Xin chào " + objUserInfo.UserFullName + " ,");
                //    sbBodyConfirm.Append("\n");
                //    sbBodyConfirm.Append("Chúc mừng bạn  đã đăng ký thành công làm thành viên của đại gia đình Cầu Vồng Liên Kết.");
                //    sbBodyConfirm.Append("\n");
                //    sbBodyConfirm.Append(" Chúng tôi sẽ hồi âm đến bạn trong thời gian sớm nhất.Công ty chúng tôi rất hân hạnh được chia sẽ và đồng hành cùng bạn.");
                //    sbBodyConfirm.Append("\n");
                //    sbBodyConfirm.Append("Xin chân thành cảm ơn sự quan tâm của bạn đối với công ty.");
                //    sbBodyConfirm.Append("\n");
                //    sbBodyConfirm.Append("Trân trọng.");
                //    sbBodyConfirm.Append("\n");
                //    MailHelper.Send(SubjectConfirm, sbBodyConfirm.ToString(), objUserInfo.UserEmail);

                //}
                //catch
                //{
                //    return Redirect(memberUrl);
                //}

                return Redirect(memberUrl);

            }
            catch
            {

                IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
                ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName");
                ViewData["error"] = "Đã có lổi xẩy ra trong quá trình đăng ký .Vui lòng kiểm tra lại!";
                return PartialView("Register");

            }
        }

        public ActionResult Edit(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");   
                Models.User user = ctx.Users.SingleOrDefault(p => p.UserID == id && (p.UserStatus != "Dummy" || p.UserStatus != "Delete"));
                //Models.User user1 = ctx.GetUserInfoByID(id).FirstOrDefault();
                IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
                ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName", user.UserEventParentID);
                string strDay = user.UserBirthday.Day.ToString();
                string strMonth = user.UserBirthday.Month.ToString();
                string strYear = user.UserBirthday.Year.ToString();
                ViewData["UserBirthdayDD"] = strDay;
                ViewData["UserBirthdayMM"] = strMonth;
                ViewData["UserBirthdayYYYY"] = strYear;
                //ViewData["city"] = user.UserAddCity;
                IEnumerable<Province> provinces = ctx.Provinces.ToList();
                ViewData["UserAddCity"] = new SelectList(provinces, "ProvinceName", "ProvinceName",user.UserAddCity);
                IEnumerable<Career> careers = ctx.Careers.ToList();
                ViewData["UserCareer"] = new SelectList(careers, "CareerName", "CareerName", user.UserCareer);
                return View(user);
            }
            catch
            {

                return RedirectToAction("LogOn", "AdminHome");   
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Models.User currentUser, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");  
                int usid = Convert.ToInt32(collection["UserID"].ToString());
                int parentid = Convert.ToInt32(collection["EventParents"].ToString());
                currentUser.UserEventParentID = parentid;
                currentUser.UserID = usid;
                bool b = CheckEditEmail(currentUser.UserEmail, currentUser.UserID);
                if (!b)
                {
                    InitialViewData(currentUser);
                    ViewData["message"] = "Email đã có người dùng.";
                    return PartialView(currentUser);
                }
                //Models.User user = ctx.GetUserInfoByID(currentUser.UserID).FirstOrDefault();
                Models.User user = ctx.Users.SingleOrDefault(p => p.UserID == currentUser.UserID && (p.UserStatus != "Dummy" || p.UserStatus != "Delete"));
                string dteDD = collection["UserBirthdayDD"];
                String dteMM = collection["UserBirthdayMM"];
                string dteYYYY = collection["UserBirthdayYYYY"];
                DateTime dtbirthdate = new DateTime(Convert.ToInt32(dteYYYY), Convert.ToInt32(dteMM), Convert.ToInt32(dteDD));
                //EnCrypto encpt = new EnCrypto();
                //user.Password = encpt.Encrypt(currentUser.Password);
                user.UserFullName = currentUser.UserFullName;
                user.UserEmail = currentUser.UserEmail;
                user.UserAddLine = currentUser.UserAddLine;
                user.UserAddCity = currentUser.UserAddCity;
                user.UserPhone = currentUser.UserPhone;
                user.UserIDCard = currentUser.UserIDCard;
                user.UserBirthday = dtbirthdate;
                user.UserGender = currentUser.UserGender;
                user.UserEventParentID = currentUser.UserEventParentID;
                user.UserType = currentUser.UserType;
                user.UserLookingObj = currentUser.UserLookingObj;
                user.UserWeight = currentUser.UserWeight;
                user.UserHeight = currentUser.UserHeight;
                user.UserLevel = currentUser.UserLevel;
                user.UserMaritalStatus = currentUser.UserMaritalStatus;
                user.UserReligion = currentUser.UserReligion;
                user.UserCareer = currentUser.UserCareer;
                user.UserJobPosition = currentUser.UserJobPosition;
                user.UserWage = currentUser.UserWage;
                user.UserWorkingTime = currentUser.UserWorkingTime;
                user.UserTimeContact = currentUser.UserTimeContact;
                user.UserFavColor = currentUser.UserFavColor;
                user.UserFavFoods = currentUser.UserFavFoods;

                user.UserReadingBook = currentUser.UserReadingBook;
                user.UserFavPet = currentUser.UserFavPet;

                user.UserOjbLikeDating = currentUser.UserOjbLikeDating;
                user.UserPeopleDislike = currentUser.UserPeopleDislike;
                user.UserPeopleLike = currentUser.UserPeopleLike;
                user.UserHobby = currentUser.UserHobby;
                user.UserHope = currentUser.UserHope;
                user.UserRequirements = currentUser.UserRequirements;
                user.UserTimeContact = currentUser.UserTimeContact;
                user.UserDescriptions = currentUser.UserDescriptions;
                ctx.SaveChanges();
                //
                InitialViewData(user);
                ViewData["message"] = "Cập nhật thành công!";
                return View(user);
            }
            catch
            {
                InitialViewData(currentUser);
                ViewData["error"] = "Đã có lỗi xẩy ra trong quá trình cập nhật. Vui lòng kiểm tra lại!";
                return View(currentUser);
            }
        }
        public ActionResult ChangePassword(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            Models.User user = ctx.Users.SingleOrDefault(u => u.UserID == id && (u.UserStatus != "Dummy" || u.UserStatus != "Delete"));
            return View(user);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChangePassword(FormCollection collection)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string urlcatch = urlHelper.Action("LogOn", "AdminHome");
            try
            {
                if (!IsAuthenticateAdmin())
                    return Redirect(urlcatch);
                int id = Convert.ToInt32(collection["UserID"].ToString());
                Models.User user = ctx.Users.Single(u => u.UserID == id);
                if (String.IsNullOrWhiteSpace(collection["Password"].ToString()))
                {
                    ViewData["Password"] = "Nhập mật khẩu";
                    return PartialView("ChangePassword", user);
                }
                EnCrypto encpt = new EnCrypto();
                String newPassword = collection["Password"].ToString();

                if (user != null)
                {
                        user.Password = encpt.Encrypt(newPassword);
                        ctx.SaveChanges();
                        ViewData["Password"] = "Đã thay đổi mật khẩu";
                        return PartialView("ChangePassword", user);
                }
                else
                {
                    string url = urlHelper.Action("Index", "AdminManagement");
                    return Redirect(url);
                }

            }
            catch
            {

                return Redirect(urlcatch);
            }
        }
        public void InitialViewData(Models.User user)
        {
            IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
            ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName", user.UserEventParentID);
            string strDay = user.UserBirthday.Day.ToString();
            string strMonth = user.UserBirthday.Month.ToString();
            string strYear = user.UserBirthday.Year.ToString();
            ViewData["UserBirthdayDD"] = strDay;
            ViewData["UserBirthdayMM"] = strMonth;
            ViewData["UserBirthdayYYYY"] = strYear;
            ViewData["city"] = user.UserAddCity;
            //
            IEnumerable<Province> provinces = ctx.Provinces.ToList();
            ViewData["UserAddCity"] = new SelectList(provinces, "ProvinceName", "ProvinceName");
            IEnumerable<Career> careers = ctx.Careers.ToList();
            ViewData["UserCareer"] = new SelectList(careers, "CareerName", "CareerName");
        }
        public bool CheckEditEmail(String email,int id)
        {
            var query = from user in ctx.Users where user.UserStatus != "Dummy" && user.UserEmail==email select user;
            Models.User current = query.FirstOrDefault();
            if (current == null)
            {
                return true;
            }
            else
            {
                if (current.UserID == id)
                    return true;
                else
                    return false;
            }
            
        }
      
        public ActionResult UpdateAvatar(int id, String view)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                 User us =ctx.GetUserInfoByID(id).FirstOrDefault();
                 string oldFile = us.UserPicture;
                 us.UserPicture = "../../Images/Users/none.jpg";
                ctx.SaveChanges();
                if (!oldFile.Contains("none.jpg"))
                    Utilities.DeleteFile(Request, "~/Images/Users/", oldFile);
                if (view == "Edit")
                    return RedirectToAction("Edit", new { id = id });
                return RedirectToAction("Details", new { id = id });

            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        #endregion

        #region Search
        public ActionResult SearchMembersFromlist(string userFullName, string currentUser, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                
                InitUserStatusDropdownlist();
                InitEventDropdownlist();
                InitAccountTypeDropdownlist();
                IEnumerable<GetAllUsers_Result> user = ctx.Admin_SearchAllUsersByFullName(userFullName).ToList();
                var viewModel = new UserListViewModel();
                viewModel.UserList = user.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = user.Count() };
                viewModel.CurrentUser = currentUser;
                return View("Index", viewModel);
            }
            catch{
                ModelState.AddModelError("", "Search Failure, see inner exception");
            }
            return RedirectToAction("Admin", "Home");
        }
        public ActionResult AdvanceSearchUsersForAdminGUI()
        {
            CVLK2011.Models.User objUserInfo = new CVLK2011.Models.User();
            return View(objUserInfo);
        }
        public ActionResult AdvanceSearchUsersResultForAdminGUI([Bind(Exclude = "UserID")] CVLK2011.Models.User objUserInfo, FormCollection frmcollection, string currentUser, int page = 1)
        {

            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            InitUserStatusDropdownlist();
            InitEventDropdownlist();
            InitAccountTypeDropdownlist();
            int iAgeFrom = 0;
            int iAgeTo = 0;
            Int32.TryParse(frmcollection["AgeFrom"], out iAgeFrom);
            Int32.TryParse(frmcollection["AgeTo"], out iAgeTo);
            
            IEnumerable<GetAllUsers_Result> lstUsers =
                ctx.Admin_AdvanceSearchByUsers(frmcollection["UserName"], frmcollection["UserFullName"], frmcollection["UserGender"], frmcollection["UserPhone"],
                                        frmcollection["UserEmail"], frmcollection["UserAddCity"],
                                        iAgeFrom, iAgeTo,
                                        frmcollection["UserHeight"], frmcollection["UserWeight"],
                                        frmcollection["UserFavColor"], frmcollection["UserFavFoods"], frmcollection["UserReadingBook"], frmcollection["UserFavPet"],
                                        frmcollection["UserPeopleLike"], frmcollection["UserPeopleDislike"], frmcollection["UserHobby"],
                                        frmcollection["UserCareer"], frmcollection["UserJobPosition"], frmcollection["UserTimeContact"]).ToList();
            //paging
            var viewModel = new UserListViewModel();
            viewModel.UserList = lstUsers.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = lstUsers.Count() };
            viewModel.CurrentUser = currentUser;

            if (lstUsers.Count() == 0)
                ViewData["NoneFriendsMessage"] = "Không có bạn nào phù hợp với kết quả ";

            return View("Index", viewModel);
        }
        #endregion

        #region--Send photo to user--
        public ActionResult SendPhoto()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            IEnumerable<User> getUser = ctx.GetUsers().ToList();
           //ViewData["username"] = new SelectList(getUser, "UserID", "UserFullName");
            return View(getUser);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ShowPhoto(FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
               // int idUser = int.Parse(collection["userid"].ToString());
                int idUser = int.Parse(collection["hdUserID"].ToString());
                IEnumerable<Photo> getPhoto = ctx.GetPhotoByUser(idUser).ToList();
                return PartialView("ShowPhoto", getPhoto);
            }
            catch
            {
                return View();
            }
        }
       
        public ActionResult GetImage(int? id)
        {
            GetPhotoByID_Result pho = ctx.GetPhotoByID(id).FirstOrDefault();
            ViewData["sendPhoto"] = pho;
            IEnumerable<User> getUser = ctx.GetUsers().ToList();            
            return View(getUser);
        }
        public ActionResult ShowImage(int? id)
        {
            GetPhotoByID_Result pho = ctx.GetPhotoByID(id).FirstOrDefault();
                ViewData["sendPhoto"] = pho;
                return PartialView("ShowImage");
            
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SendPhoto(FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int idPhoto = int.Parse(collection["idPho"].ToString());
                if (collection.Count == 0)
                {
                    ViewData["SendImageMessage"] = "Vui lòng điền tên người nhận";
                    return View();
                }
                bool isSend = false;
                GetPhotoByID_Result select = ctx.GetPhotoByID(idPhoto).Single();
                foreach (string key in collection.Keys)
                {
                    if (key.StartsWith("hd"))
                    {
                        int userID = 0;
                        string stringID =collection[key].ToString();
                        if (int.TryParse(stringID, out userID))
                        {
                            //GetUserByID_Result us = ctx.GetUserByID(userID).SingleOrDefault();
                            IEnumerable<Album> share = ctx.GetAlbumShareByUser(userID).ToList();
                            int idAlbum = 0;
                            if (share.Count<Album>() == 0)
                            {
                                Album nAlbum = new Album();
                                nAlbum.AlbumDate = DateTime.Now;
                                nAlbum.Status = Utilities.cstApprove;
                                nAlbum.AlbumName = "Album được chia sẻ";
                                nAlbum.UserID = userID;
                                nAlbum.AlbumType = "Share";
                                nAlbum.Description = Utilities.AliasDictionary[nAlbum.AlbumType];
                                ctx.AddToAlbums(nAlbum);
                                ctx.SaveChanges();
                                int newId = nAlbum.AlbumID;
                                idAlbum = int.Parse(ctx.GetMaxIDAlbum().SingleOrDefault().ToString());
                            }
                            else
                            {
                                idAlbum = share.ElementAt(0).AlbumID;
                            }
                            Photo nPhoto = new Photo();
                            nPhoto.AlbumID = idAlbum;
                            nPhoto.Status = Utilities.cstApprove;
                            nPhoto.Description = "Hình ảnh được chia sẽ ";
                            nPhoto.DateUpload = DateTime.Now;
                            nPhoto.PhotoPath = select.PhotoPath;
                            ctx.AddToPhotos(nPhoto);
                            ctx.SaveChanges();
                            isSend = true;
                        }
                    }
                }
                if (isSend)
                    ViewData["SendImageMessage"] = "Đã gởi thành công!";
                else
                    ViewData["SendImageMessage"] = "Không gởi được.Vui lòng kiểm tra lại!";
                return  View();
                }            
            catch
            {
                ViewData["SendImageMessage"] = "Không gởi được.Vui lòng kiểm tra lại!";
                return View();
            }
        }
        #endregion


        #region--Send video to user--
        public ActionResult SendVIPVideo()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            IEnumerable<User> getUser = ctx.GetUsers().ToList();
            ViewData["username"] = new SelectList(getUser, "UserID", "UserFullName");
            return View(getUser);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ShowVideo(FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int idUser = int.Parse(collection["hdUserID"].ToString());
                GetUserByID_Result getUserVideo = ctx.GetUserByID(idUser).SingleOrDefault();
                return PartialView("ShowVideo", getUserVideo);
            }
            catch
            {
                return View();
            }
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SendVideo(FormCollection collection)
        {
           try
            { 
               
               if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
                 bool isSend = false;
                 int sendUserID = 0;
                 if (int.TryParse(collection["SendUserID"].ToString(), out sendUserID))
                 {
                     //GetUserByID_Result getUserInfo = ctx.GetUserByID(sendUserID).SingleOrDefault();
                     foreach (string key in collection.Keys)
                     {
                         if (key.StartsWith("hd"))
                         {
                             int userID = 0;
                             string stringID = collection[key].ToString();
                             if (int.TryParse(stringID, out userID))
                             {

                                 //Models.User us = ctx.GetUserInfoByID(userID).SingleOrDefault();
                                 //User us = ctx.GetUsers(userID).SingleOrDefault();

                                 VIPVideo video = new VIPVideo();
                                 video.Status = "Visible";
                                 video.UserID = sendUserID;
                                 video.VideoPartnerID = userID;
                                 video.DateCreate = DateTime.Now;
                                 video.Description = "";
                                 ctx.AddToVIPVideos(video);
                                 ctx.SaveChanges();
                                 isSend = true;
                             }
                         }
                     }
                 }
                 if (isSend)
                     ViewData["SendVideo"] = "Đã gởi thành công";
                else
                     ViewData["SendVideo"] = "Chưa gởi được.Vui lòng kiểm tra lại";
                 return View("SendVIPVideo");
               //return RedirectToAction("SendVIPVideo");

            }
            catch (Exception ex)
            {
                ViewData["SendVideo"] = "Chưa gởi được.Vui lòng kiểm tra lại";
                return RedirectToAction("SendVIPVideo");
            }
        }

        #endregion
       
        #region--blog--
        public ActionResult MembersBlog(string datePost, string status, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            InitBlogsStatusDropdownlist();
            
            DateTime blogsDatePost = DateTime.MinValue;
            DateTime.TryParse(datePost, out blogsDatePost);

            IEnumerable<GetAllBlogs_Result> blog = null;
            if (blogsDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                blog = ctx.GetAllBlogs().ToList();
            else if(blogsDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                blog = ctx.Admin_FilterForBlogs(blogsDatePost, status).ToList();
            else if (blogsDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                blog = ctx.GetAllBlogs().Where(p => p.Status.Equals(status)).ToList();
            else if(blogsDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                blog = ctx.GetAllBlogs().Where(p => p.Datepost.ToShortDateString().Equals(blogsDatePost.ToShortDateString())).ToList();
            
            var viewModel = new CVLK2011.Models.BlogListViewModel();
            viewModel.blogStatusFilter = status;
            viewModel.blogDateFilter = blogsDatePost;
            viewModel.BlogList = blog.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = blog.Count() };
            return View(viewModel);
        }
        public ActionResult FilterBlogs(string datePost, string status, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            
            DateTime blogsDatePost = DateTime.MinValue;
            DateTime.TryParse(datePost, out blogsDatePost);
            IEnumerable<GetAllBlogs_Result> blog = null;
            if (blogsDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                blog = ctx.GetAllBlogs().ToList();
            else if (blogsDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                blog = ctx.Admin_FilterForBlogs(blogsDatePost, status).ToList();
            else if (blogsDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                blog = ctx.GetAllBlogs().Where(p => p.Status.Equals(status)).ToList();
            else if (blogsDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                blog = ctx.GetAllBlogs().Where(p => p.Datepost.ToShortDateString().Equals(blogsDatePost.ToShortDateString())).ToList();

            var viewModel = new CVLK2011.Models.BlogListViewModel();
            viewModel.blogStatusFilter = status;
            viewModel.blogDateFilter = blogsDatePost;
            viewModel.BlogList = blog.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = blog.Count() };
            return PartialView("UCBlogsList", viewModel);
        }
        private ActionResult InitBlogsStatusDropdownlist()
        {
            var configValues = from cfv in ctx.ConfigValues
                               where cfv.ConfigKeyGroup == "Blogs"
                               orderby cfv.ConfigText ascending
                               select cfv;
            IEnumerable<SelectListItem> blogsStatusItems = configValues.Select(
                items => new SelectListItem
                {
                    Value = items.ConfigKeyValue,
                    Text = items.ConfigText
                });
            ViewData["blogsStatus"] = blogsStatusItems;
            return PartialView("MembersBlog", ViewData["blogsStatus"]);
        }
        public ActionResult BlogApprove(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.BlogApprove(Utilities.cstApprove, id);
                return RedirectToAction("MembersBlog");
                //return View();

            }
            catch
            {
                return View();
            }
        }
        public ActionResult BlogUnApprove(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.BlogUnApprove(Models.Utilities.cstUnApprove, id);
                return RedirectToAction("MembersBlog");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult MembersReviewBlog(int ID)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
               GetBlogByID_Result blg = ctx.GetBlogByID(ID).ToList().FirstOrDefault();
                if (blg != null)
                    return View(blg);
                return View();
            }
            catch
            {
                return View();
            }
        }
        public ActionResult DeleteBlog(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.DeleteBlog(id);
                return RedirectToAction("MembersBlog");
            }
            catch
            {
                return View();
            }
        }
        #endregion

        #region--Comments--
        //Check Comment is Typical 
        //public ActionResult CheckTypical(int id, string currentpage, string filter, int page = 1)
        //{
        //    if (!IsAuthenticateAdmin())
        //        return RedirectToAction("LogOn", "AdminHome");
        //    Comment cmt = ctx.Comments.Single(cm => cm.CommentID == id);
        //    if (cmt.IsTypical)
        //        cmt.IsTypical = false;
        //    else
        //        cmt.IsTypical = true;
        //    ctx.SaveChanges();
        //    var model = GetComments(currentpage, filter, page);
        //    return PartialView("UCCommentsList", model);
        //}
        public void CheckTypical(int id)
        {
            if (!IsAuthenticateAdmin())
                return ;
            Comment cmt = ctx.Comments.Single(cm => cm.CommentID == id);
            if (cmt.IsTypical)
                cmt.IsTypical = false;
            else
                cmt.IsTypical = true;
            ctx.SaveChanges();
        }
        
        public CommentListViewModel GetComments(string currentComment, String filter,int page )
        {
            
            IEnumerable<GetAllComments_Result> cmt = null;
            if (String.IsNullOrEmpty(filter))
                cmt = ctx.GetAllCommentsOrderByDatePost().ToList();
            else
                cmt = ctx.GetAllCommentsOrderByDatePost().Where(p => p.Status == filter).ToList();
            var viewModel = new CommentListViewModel();
            viewModel.Filter = filter;
            viewModel.CommentList = cmt.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = cmt.Count() };
            viewModel.CurrentComment = currentComment;
            return viewModel;
        }
        public ActionResult MembersComments(string datePost, string status, string comment, int page = 1)
        {

            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");

                InitCommentsStatusDropdownlist();

                DateTime commentsDatePost = DateTime.MinValue;
                DateTime.TryParse(datePost, out commentsDatePost);

                IEnumerable<GetAllComments_Result> cmt = null;

                if (commentsDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                    cmt = ctx.GetAllCommentsOrderByDatePost().ToList();
                else if(commentsDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                    cmt = ctx.Admin_FilterForComments(commentsDatePost, status).ToList();
                else if (commentsDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                    cmt = ctx.GetAllCommentsOrderByDatePost().Where(p => p.Status.Equals(status)).ToList();
                else if (commentsDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                    cmt = ctx.GetAllCommentsOrderByDatePost().Where(cm => cm.Datepost.ToShortDateString().Equals(commentsDatePost.ToShortDateString())).ToList();

                var viewModel = new CommentListViewModel();
                viewModel.commentStatusFilter = status;
                viewModel.commentDateFilter = commentsDatePost.Date;
                viewModel.CommentList = cmt.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = cmt.Count() };
                viewModel.CurrentComment = comment;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        public ActionResult FilterComments(string datePost, string status, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            string currentComment = string.Empty;
            DateTime commentsDatePost = DateTime.MinValue;
            DateTime.TryParse(datePost, out commentsDatePost);

            IEnumerable<GetAllComments_Result> cmt = null;
            if (commentsDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                cmt = ctx.GetAllCommentsOrderByDatePost().ToList();
            else if (commentsDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                cmt = ctx.Admin_FilterForComments(commentsDatePost, status).ToList();
            else if (commentsDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                cmt = ctx.GetAllCommentsOrderByDatePost().Where(p => p.Status.Equals(status)).ToList();
            else if (commentsDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                cmt = ctx.GetAllCommentsOrderByDatePost().Where(cm => cm.Datepost.ToShortDateString().Equals(commentsDatePost.ToShortDateString())).ToList();

            var viewModel = new CommentListViewModel();
            viewModel.commentStatusFilter = status;
            viewModel.commentDateFilter = commentsDatePost.Date;
            viewModel.CommentList = cmt.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = cmt.Count() };
            viewModel.CurrentComment = currentComment;
            return PartialView("UCCommentsList", viewModel);
        }
        private ActionResult InitCommentsStatusDropdownlist()
        {
            var configValues = from cfv in ctx.ConfigValues
                               where cfv.ConfigKeyGroup == "Comments"
                               orderby cfv.ConfigText ascending
                               select cfv;
            IEnumerable<SelectListItem> blogsStatusItems = configValues.Select(
                items => new SelectListItem
                {
                    Value = items.ConfigKeyValue,
                    Text = items.ConfigText
                });
            ViewData["commentsStatus"] = blogsStatusItems;
            return PartialView("MembersComments", ViewData["commentsStatus"]);
        }
        //
        public ActionResult MembersReviewComment(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetCommentByID_Result cmt = ctx.GetCommentByID(id).Single(cm=>cm.CommentID==id);
                if (cmt != null)
                    return View(cmt);
                return View();
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult ApproveComment(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.UpdateCommentStatus(Models.Utilities.cstApprove, id);
                return RedirectToAction("MembersComments");
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult UnApproveComment(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.UpdateCommentStatus(Models.Utilities.cstUnApprove, id);
                return RedirectToAction("MembersComments");
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult DeleteComment(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.DeleteComment(id);
                return RedirectToAction("MembersComments");
            }
            catch
            {
                return View();
            }
        }
        //create comment
        public ActionResult CreateComment()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            //initial blog list
            //initial event list
            InitialCommentControl();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateComment([Bind(Exclude = "CommentID")] CVLK2011.Models.Comment cmt, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                String commentfor = collection["comment"].ToString();

                cmt.CommentParentID = Utilities.IDefaultComment;
                cmt.UserID = Utilities.IDefaultUser;
                cmt.UserWall = cmt.UserID;
                cmt.Status = Utilities.cstApprove;
                cmt.Datepost = DateTime.Now;
                cmt.IsTypical = true;
                cmt.CommentContent = collection["FckEditor1"].ToString();
                if (cmt.CommentContent == "")
                {
                    InitialCommentControl();
                    ViewData["commentMessage"] = "Vui lòng nhập nội dung bình luận!";
                    return View();
                }
                if (commentfor == "Event")
                {
                    cmt.BlogID = Utilities.IDefaultBlog;
                    cmt.EventID = Convert.ToInt32(collection["events"].ToString());
                    cmt.CommentType = "Event";

                }
                else if (commentfor == "Blog")
                {
                    cmt.BlogID = Convert.ToInt32(collection["blogs"].ToString());
                    cmt.EventID = Utilities.IDefaultEvent;
                    cmt.CommentType = "Blog";
                }
                else
                {
                    cmt.BlogID = Utilities.IDefaultBlog;
                    cmt.EventID = Utilities.IDefaultEvent;
                    cmt.CommentType = "General";
                }
                ctx.AddToComments(cmt);
                ctx.SaveChanges();
                ViewData["commentMessage"] = "Tạo bình luận thành công!";
                InitialCommentControl();
                return View();
            }
            catch(Exception ex)
            {
                InitialCommentControl();
                ViewData["commentMessage"] = ex.Message; 
                return View();
            }
        }
        public void InitialCommentControl()
        {
            IEnumerable<Event> events = ctx.GetAllEvents().ToList();
            ViewData["Events"] = new SelectList(events, "EventID", "EventName");
            IEnumerable<GetAllBlogs_Result> blogs = ctx.GetAllBlogs().ToList();
            ViewData["Blogs"] = new SelectList(blogs, "BlogID", "BlogTitle");
        }
        //edit
        public ActionResult EditComment(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            GetCommentByID_Result cmt = ctx.GetCommentByID(id).SingleOrDefault();
            InitialCommentControl();
            return View(cmt);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditComment(int id, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                
                Models.Comment cmt = ctx.Comments.Single(p => p.CommentID == id);
                cmt.CommentContent = collection["FckEditor1"].ToString();
                if (cmt.CommentContent == "")
                {
                    InitialCommentControl();
                    ViewData["commentMessage"] = "Vui lòng nhập nội dung bình luận!";
                    return View();
                }
                
                ctx.SaveChanges();
                return RedirectToAction("MembersReviewComment", new { id=id});
            }
            catch (Exception ex)
            {
                InitialCommentControl();
                ViewData["commentMessage"] = ex.Message;
                return View();
            }
        }
        #endregion

        #region--Message--
        public ActionResult MembersMessage(string datePost, string status, string currentMessage, int page = 1 )
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            InitMessagesStatusDropdownlist();

            DateTime messagesDatePost = DateTime.MinValue;
            DateTime.TryParse(datePost, out messagesDatePost);
            IEnumerable<GetAllMessages_Result> msg = null;

            if (messagesDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                msg = ctx.GetAllMessages().ToList();
            else if (messagesDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                msg = ctx.Admin_FilterForMessages(messagesDatePost, status).ToList();
            else if (messagesDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                msg = ctx.GetAllMessages().Where(ms => ms.Status.Equals(status)).ToList();
            else if (messagesDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                msg = ctx.GetAllMessages().Where(ms => ms.MessageDatetime.ToShortDateString().Equals(messagesDatePost.ToShortDateString())).ToList();

            var viewModel = new MessageListViewModel();
            viewModel.messageStatusFilter = status;
            viewModel.messageDateFilter = messagesDatePost.Date;
            viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
            viewModel.CurrentMessage = currentMessage;
            return View(viewModel);
        }
        public ActionResult FilterMessages(string datePost, string status, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            string currentMessage = string.Empty;
            DateTime messagesDatePost = DateTime.MinValue;
            DateTime.TryParse(datePost, out messagesDatePost);
            IEnumerable<GetAllMessages_Result> msg = null;

            if (messagesDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                msg = ctx.GetAllMessages().ToList();
            else if (messagesDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                msg = ctx.Admin_FilterForMessages(messagesDatePost, status).ToList();
            else if (messagesDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                msg = ctx.GetAllMessages().Where(ms => ms.Status.Equals(status)).ToList();
            else if (messagesDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                msg = ctx.GetAllMessages().Where(ms => ms.MessageDatetime.ToShortDateString().Equals(messagesDatePost.ToShortDateString())).ToList();

            var viewModel = new MessageListViewModel();
            viewModel.messageStatusFilter = status;
            viewModel.messageDateFilter = messagesDatePost;
            viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
            viewModel.CurrentMessage = currentMessage;
            return PartialView("UCMessagesList", viewModel);
        }
        private ActionResult InitMessagesStatusDropdownlist()
        {
            var configValues = from cfv in ctx.ConfigValues
                               where cfv.ConfigKeyGroup == "Messages"
                               orderby cfv.ConfigText ascending
                               select cfv;
            IEnumerable<SelectListItem> blogsStatusItems = configValues.Select(
                items => new SelectListItem
                {
                    Value = items.ConfigKeyValue,
                    Text = items.ConfigText
                });
            ViewData["messagesStatus"] = blogsStatusItems;
            return PartialView("MembersMessage", ViewData["messagesStatus"]);
        }
        public ActionResult MembersReviewMessage(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            GetMessageByID_Result msg = ctx.GetMessageByID(id).Single(ms => ms.MessageID == id);
            return View(msg);
        }
        //
        public ActionResult ApproveMessage(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.UpdateMessageStatus(id, Models.Utilities.cstApprove);
                return RedirectToAction("MembersMessage");
                //return View();

            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult UnApproveMessage(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.UpdateMessageStatus(id, Models.Utilities.cstUnApprove);
                return RedirectToAction("MembersMessage");
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult DeleteMessage(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.DeleteMessage(id);
                return RedirectToAction("MembersMessage");
            }
            catch
            {
                return View();
            }
        }

        #endregion

        #region--Photos--

        public ActionResult MembersPhoto(string datePost, string status, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<GetAllPhotos_Result> photo = null;
                
                if (status == null) status = string.Empty;
                DateTime photoDatePost = DateTime.MinValue;
                DateTime.TryParse(datePost, out photoDatePost);

                InitPhotosStatusDropdownlist();

                if (photoDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                    photo = ctx.GetAllPhotos().ToList();
                else if (photoDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                    photo = ctx.Admin_FilterPhotos(photoDatePost, status).ToList();
                else if (photoDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                    photo = ctx.GetAllPhotos().Where(p => p.Status.Equals(status)).ToList();
                else if (photoDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                    photo = ctx.GetAllPhotos().Where(p => p.DateUpload.Value.ToShortDateString() == photoDatePost.ToShortDateString()).ToList();

                var viewModel = new PhotosListViewModel();
                viewModel.photoStatusFilter = status;
                viewModel.photoDateFilter = photoDatePost;
                viewModel.PhotosList = photo.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = photo.Count() };
                return View(viewModel);
            }
            catch (Exception ex)
            {
                return View();
            }
        }
        public ActionResult FilterPhotos(string datePost, string status, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            IEnumerable<GetAllPhotos_Result> photo =null;
            DateTime photoDatePost = DateTime.MinValue;
            DateTime.TryParse(datePost, out photoDatePost);

            if (photoDatePost.Date == DateTime.MinValue && string.IsNullOrEmpty(status))
                photo = ctx.GetAllPhotos().ToList();
            else if (photoDatePost.Date != DateTime.MinValue && !string.IsNullOrEmpty(status))
                photo = ctx.Admin_FilterPhotos(photoDatePost, status).ToList();
            else if (photoDatePost.Date == DateTime.MinValue && !string.IsNullOrEmpty(status))
                photo = ctx.GetAllPhotos().Where(p => p.Status.Equals(status)).ToList();
            else if (photoDatePost.Date != DateTime.MinValue && string.IsNullOrEmpty(status))
                photo = ctx.GetAllPhotos().Where(p => p.DateUpload.Value.ToShortDateString().Equals(photoDatePost.ToShortDateString())).ToList();

            var viewModel = new PhotosListViewModel();
            viewModel.photoStatusFilter = status;
            viewModel.photoDateFilter = photoDatePost;
            viewModel.PhotosList = photo.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = photo.Count() };
            return PartialView("UCPhotosList", viewModel);
        }
        public ActionResult InitPhotosStatusDropdownlist()
        {
            var configValues = from cfv in ctx.ConfigValues
                               where cfv.ConfigKeyGroup == "Photos"
                               orderby cfv.ConfigText ascending
                               select cfv;
            IEnumerable<SelectListItem> photosStatusItems = configValues.Select(
                items => new SelectListItem
                {
                    Value = items.ConfigKeyValue,
                    Text = items.ConfigText
                });
            ViewData["photosStatus"] = photosStatusItems;
            return PartialView("MembersPhoto", ViewData["photosStatus"]);
        }
        public ActionResult MembersReviewPhoto(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            GetPhotoByID_Result pt = ctx.GetPhotoByID(id).Single(p => p.PhotoID == id);
            return View(pt);
        }
        //delete photo
        public ActionResult DeletePhoto(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.DeletePhoto(id);
                return RedirectToAction("MembersPhoto");
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult ApprovePhoto(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.ApprovePhoto(id);
                return RedirectToAction("MembersPhoto");
                //return View();

            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult UnApprovePhoto(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.UnApprovePhoto(id);
                return RedirectToAction("MembersPhoto");
            }
            catch
            {
                return View();
            }
        }
       
        #endregion
        //
        #region--UploadVideo--
        public ActionResult UploadVideo()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ProcessUploadVideo(int id, HttpPostedFileBase videoUpload, String view)
        {
            const string virtualPath = "~/Content/Videos/";
            string physicalPath = "../../../Content/Videos/";

            var helper = new UrlHelper(HttpContext.Request.RequestContext);
            string urlEdit = helper.Action("Edit", new { id = id });
            try
            {
                if (!IsAuthenticateAdmin())
                {
                    string urlLogOn = helper.Action("LogOn", "AdminHome");
                    return Redirect(urlLogOn);
                }
                String fileName = Path.GetFileName(videoUpload.FileName);
                if (!Utilities.IsVideo(fileName))
                {
                    ViewData["UploadMessage"] = "Chi cho phép tải video định dạng FLV";
                    return Redirect(urlEdit);
                }
                var filePath = Path.Combine(Request.MapPath(virtualPath), fileName);
                videoUpload.SaveAs(filePath);
                User us = ctx.Users.Single(p => p.UserID == id);
                us.UserVideoUpload = physicalPath+ fileName;
                ctx.SaveChanges();
                if (view == "Edit")
                {
                    
                    return Redirect(urlEdit);
                }
                String urlDetails = helper.Action("Edit", new { id = id }); 
                return Redirect(urlDetails);
            }
            catch
            {
                String urlIndex = helper.Action("Index");
                return Redirect(urlIndex);
            }
        }

        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult ProcessUploadVideo(int id, HttpPostedFileBase videoUpload,String view)
        //{
        //    try
        //    {
        //        if (!IsAuthenticateAdmin())
        //            return RedirectToAction("LogOn", "AdminHome");
        //        String fileName = Path.GetFileName(videoUpload.FileName);
        //        var filePath = Path.Combine(Request.MapPath("~/Content/Videos"), fileName);
        //        videoUpload.SaveAs(filePath);
        //        User us = ctx.Users.Single(p => p.UserID == id);
        //        us.UserVideoUpload = "../../Content/Videos/" + fileName;
        //        ctx.SaveChanges();
        //        if (view == "Edit")
        //        {
        //            return RedirectToAction("Edit", new { id = id });
        //        }
        //        return RedirectToAction("Details", new { id=id});
        //    }
        //    catch
        //    {
        //        return RedirectToAction("Index");
        //    }
        //}
        //show video on user details view
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ShowVideoOnUserDetails(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetUserByID_Result getUserVideo = ctx.GetUserByID(id).SingleOrDefault();
                return PartialView("Details", getUserVideo);
            }
            catch
            {
                return View();
            }
        }
        //delete Video
        public ActionResult DeleteVideoByUser(int usId,String view)
        {
            try
            {
           
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                User us = ctx.Users.Single(p=>p.UserID==usId);
                String fileName=us.UserVideoUpload;
                us.UserVideoUpload = String.Empty;
                ctx.SaveChanges();
                //delete video file
                String filePath= Path.Combine(Request.MapPath(fileName));
                if (System.IO.File.Exists(filePath))
                    System.IO.File.Delete(filePath);
                //delete in share video by user
                ctx.DeleteShareVideoByUserID(usId);
                if (view == "Edit")
                    return RedirectToAction("Edit", new { id=usId});
                return RedirectToAction("Details", new { id=usId});
            }
            catch
            {
                return RedirectToAction("Details" ,new{id=usId});
            }
        }
        ////delete vip video 
        //public void DeleteVipVideoShare(int UserId)
        //{
        //    var query = d
        //}
        #endregion

        [HttpPost]
        public JsonResult FindNames(string searchText, int maxResults)
        {
            UserAutoComplete autoComplete = new UserAutoComplete();
            var result = autoComplete.FindPeople(searchText, maxResults);
            return Json(result);
        }
        [HttpPost]
        public ActionResult DeleteMultiUserAction(string box, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");

                foreach (String key in collection.Keys)
                {
                    int userID = 0;
                    if (collection[key].ToString().StartsWith("true"))
                    {
                        string checkBoxID = key.ToString().Replace("cbox", "");

                        if (int.TryParse(checkBoxID, out userID))
                        {
                            if (collection["Delete"] != null)
                            {
                                var user = (from u in ctx.Users where u.UserID == userID select u).Single();
                                user.UserStatus = "Delete";
                                ctx.SaveChanges();
                            }
                        }
                    }
                }
                return RedirectToAction("Index", "MembersManagement", new { box = box });
            }
            catch
            {
                return RedirectToAction("Index", "MembersManagement");
            }
        }

        #region Update Avatar
        public ActionResult NewAvatarListView(int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            try
            {
                IEnumerable<GetAllUsers_Result> users = null;
                users = ctx.GetAllUsers().Where(p => p.UserAvatarUpload != null).ToList();
                var viewModel = new UserListViewModel();
                viewModel.UserList = users.Skip((page - 1)*PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo
                                           {CurrentPage = page, ItemsPerPage = PageSize, TotalItems = users.Count()};

                return View(viewModel);
            }
            catch
            {
                return RedirectToAction("Error");
            }
        }
        [HttpPost]
        public ActionResult ActionApproveMultiAvatarUser(string box, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");

                foreach (String key in collection.Keys)
                {
                    int userID = 0;
                    if (collection[key].ToString().StartsWith("true"))
                    {
                        string checkBoxID = key.ToString().Replace("cbox", "");

                        if (int.TryParse(checkBoxID, out userID))
                        {
                            if (collection["ApprovedAvatar"] != null)
                            {
                                var user = (from u in ctx.Users where u.UserID == userID select u).Single();
                                user.UserPicture = user.UserAvatarUpload;
                                user.UserAvatarUpload = null;
                                ctx.SaveChanges();
                            }
                            else if (collection["UnApprovedAvatar"] != null)
                            {
                                var user = (from u in ctx.Users where u.UserID == userID select u).Single();
                                user.UserAvatarUpload = null;
                                ctx.SaveChanges();
                            }
                        }
                    }
                }
                return RedirectToAction("Index", "MembersManagement", new { box = box });
            }
            catch
            {
                return RedirectToAction("Index", "MembersManagement");
            }
        }
        #endregion
    }
}
