using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
using System.Web.Routing;
using System.Text;
using CVLK2011.HtmlHelpers;

namespace CVLK2011.Controllers.Member
{
    /// <summary>
    /// Created By Hoang.Nguyen
    /// Created date: 2011.03.16
    /// Description: Class Controller Provides actions/methods for creating an request to member Home
    /// </summary>
    public class MemberHomeController : BaseController
    {
        /// <summary>
        ///Created By Hoang.Nguyen
        /// Created date: 2011.03.16
        /// Description: GET member Home
        /// </summary>
        /// <returns></returns>
        /// 

        DBContainer ctx = new DBContainer();
        public int PageSize = 20;
        public int CommentSize = 4;
        public ActionResult Index(int id, String currentPage, int page = 0)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");//lost session ==>redirect to home page
                int CurrentUserID = Convert.ToInt32(Session["CurrentUserID"].ToString());
                //int GuestUserID = Convert.ToInt32(Session["GuestUserID"].ToString());
                int GuestUserID = id;
                var model = new MemberHomeListViewModel();

                GetUserByID_Result guestUser = ctx.GetUserByID(GuestUserID).SingleOrDefault();
                model.UserNameOnWall = guestUser.UserFullName;
                model.PictureOnWall = guestUser.UserPicture;
                model.UserIDOnWall = guestUser.UserID;
                Session["GuestUserID"] = guestUser.UserID;

                //}
                //events
                NewEvents(model, currentPage, page);
                //Blogs
                Blogs(model, GuestUserID, currentPage, page);
                //Album
                Albums(model, GuestUserID, currentPage, page);
                // Friends
                // Friends(model, UserID, currentPage, page);
                //Main Wall
                //MainWall();
                // sub wall
                MainWall(model, GuestUserID, currentPage, page);
                //left wall
                //  LeftWall(model);
                //return view
                return View(model);
            }
            catch
            {
                return RedirectToAction("Index","Home");
            }
        }

        #region--New Events--
        public ActionResult NewEvents(MemberHomeListViewModel model, String currentEvent,int page=1)
        {
            IEnumerable<GetTopFiveNewEvent_Result> eveList = ctx.GetTopFiveNewEvent().ToList();
            //get 3 envents
            model.EventList = eveList.Take(3).ToList();
            model.PagingEventInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = eveList.Count() };
            model.CurrentEvent = currentEvent;
            return View(model);
        }
        #endregion
        #region--Blogs--
        public ActionResult Blogs(MemberHomeListViewModel model, int iuserId, String currentBlog, int page = 1)
        {
           //int iuserId = Convert.ToInt32(Session["CurrentUser"]);
            IEnumerable<GetTopFiveBlogByUserID_Result> blgList = ctx.GetTopFiveBlogByUserID(iuserId).ToList();
          //get 3 blogs
            model.BlogList = blgList.Take(3).ToList();
            model.PagingBlogInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = blgList.Count() };
            model.CurrentBlog = currentBlog;
            return View(model);
        }
        #endregion
        #region--Ablbum--
        public ActionResult Albums(MemberHomeListViewModel model, int iuserId, string currentAlbum, int page = 1)
        {
           // int iuserId = Convert.ToInt32(Session["CurrentUser"]);
            IEnumerable<GetTopFiveAlbumAndPhotoByUserID_Result> albumList = ctx.GetTopFiveAlbumAndPhotoByUserID(iuserId).ToList();
           //get 3 albums 
            model.AlbumList = albumList.Take(3).ToList();
            model.PagingAlbumInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = albumList.Count() };
            model.CurrentAlbum = currentAlbum;
            return View(model);

        }

        public ActionResult ChiTietAlbum(int id)
        {
            IEnumerable<Photo> pho = ctx.GetPhotoByAlbum(id);
            Album alb = ctx.GetAlbumByID(id).Single();
            ViewData["albumname"] = alb.AlbumName;
            return View(pho);
        }
        #endregion
        #region--Friends--
        //for Renderpartial
        //public ActionResult Friends(MemberHomeListViewModel model, int iuserId, string currentFriend, int page = 1)
        //{
        //   // int iuserId = Convert.ToInt32(Session["CurrentUser"]);
        //    IEnumerable<GetAllFriendsByUser_Result> friendList = ctx.GetAllFriendsByUser(iuserId).ToList();
        //    model.FriendList = friendList.Skip((page - 1) * PageSize).Take(PageSize).ToList();
        //    model.PagingFriendInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = friendList.Count() };
        //    model.CurrentFriend = currentFriend;
        //    return View(model);

        //}
        ////for action
        public ActionResult Friends(int UserID,string currentFriend, int page = 1)
        {
            var model = new MemberHomeListViewModel();
            //int iuserId = Convert.ToInt32(Session["CurrentUser"]);
            IEnumerable<GetAllFriendsOfCurrentUserByID_Result> friendList = ctx.GetAllFriendsOfCurrentUserByID(UserID).ToList();
            //get 10 friends
            model.FriendList = friendList.Take(10).ToList();
            model.PagingFriendInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = friendList.Count() };
            model.CurrentFriend= currentFriend;
            model.UserIDOnWall = UserID;
            return View(model);

        }

        #endregion

        #region--Wall Comments --
       
        public ActionResult MainWall(MemberHomeListViewModel model, int wallID, String currentComment, int page=0)
        {
            
            IEnumerable<GetAllCommentsByWall_Result> cmtList = ctx.GetAllCommentsByWall(wallID).ToList();
            model.CommentList = cmtList.Skip((page) * CommentSize).Take(CommentSize).ToList();
            foreach (var item in model.CommentList)
           {
               IEnumerable<GetAllCommentRelationByCommentID_Result> cmtRelationList = ctx.GetTopNewCommentRelationByCommentID(item.CommentID).ToList();
               if(cmtRelationList.Count()>0)
               {
                   if (model.CommentRelationList == null)
                       model.CommentRelationList = cmtRelationList.ToList();
                   else
                   {
                       foreach( var relation in cmtRelationList)
                       {
                           model.CommentRelationList.Add(relation);
                        }
                   }
               }
           }
            //paging comment
           model.PagingCommentInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = CommentSize, TotalItems = cmtList.Count() };
           model.CurrentComment = currentComment;
           model.ShowAll = false;

           // Subwall(model);
            return View(model);
        }
        //
        public ActionResult Subwall(MemberHomeListViewModel model)
        {
            return PartialView("Subwall", model);
        }
        //Create MainComment
        public ActionResult MainWall()
        {
            Comment cmt = new Comment();
            return View(cmt);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult MainWall([Bind(Exclude = "CommentID")] Models.Comment cmt, FormCollection collection)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string url = urlHelper.Action("Index", "Home");
            try
            {
                int userOnWall = Convert.ToInt32(collection["UserIDOnWall"].ToString());
                String cmtcontent = collection["MainContent"].ToString();
                if (Session["CurrentUserID"] == null)
                    return Redirect(url);
                if (String.IsNullOrWhiteSpace(cmtcontent))
                {
                    string urlNull = urlHelper.Action("Index", "MemberHome", new { id = userOnWall });
                    return Redirect(urlNull);
                }
                // check user comment
                //
                int currentUserID=Convert.ToInt32(Session["CurrentUserID"]);
                if (userOnWall != currentUserID)
                    cmt.UserID = currentUserID;// user write comment
                else
                    cmt.UserID = userOnWall;
                cmt.CommentContent = cmtcontent;
                cmt.Datepost = DateTime.Now;
                cmt.CommentType = Utilities.cstCommentTypeWall;
                cmt.BlogID = Utilities.IDefaultBlog;
                cmt.EventID = Utilities.IDefaultEvent;
                cmt.Status = Utilities.cstNewStatus;
                cmt.CommentParentID = Utilities.IDefaultComment;
                cmt.UserWall = userOnWall;
                ctx.AddToComments(cmt);
                ctx.SaveChanges();
                //main
                var model = new MemberHomeListViewModel();
                GetUserByID_Result guestUser = ctx.GetUserByID(userOnWall).Single(p => p.UserID == userOnWall);
                model.UserNameOnWall = guestUser.UserFullName;
                model.PictureOnWall = guestUser.UserPicture;
                model.UserIDOnWall = guestUser.UserID;
                Session["GuestUserID"] = guestUser.UserID;
                //main wall
                MainWall(model, userOnWall, "");
                return PartialView("MainWall", model); 

            }
            catch (Exception ex)
            {
                
                return Redirect(url);
            }
        } 
        //get subwall
     //   public ActionResult GetSubwall(int wallID,int page=0)
     //   {
     //       int CommentSize = 500;
     //       var model=new MemberHomeListViewModel(); 
     //       //main
     //       GetUserByID_Result guestUser = ctx.GetUserByID(wallID).Single(p => p.UserID == wallID);
     //       model.UserNameOnWall = guestUser.UserFullName;
     //       model.PictureOnWall = guestUser.UserPicture;
     //       model.UserIDOnWall = guestUser.UserID;
     //       Session["GuestUserID"] = guestUser.UserID;
     //       //sub
     //       IEnumerable<GetAllCommentsByWall_Result> cmtList = ctx.GetAllCommentsByWall(wallID).ToList();
     //       model.CommentList = cmtList.Skip((page-1) * CommentSize).Take(CommentSize).ToList();
     //       foreach (var item in model.CommentList)
     //       {
     //           IEnumerable<GetAllCommentRelationByCommentID_Result> cmtRelationList = ctx.GetAllCommentRelationByCommentID(item.CommentID).ToList();
     //           if (cmtRelationList.Count() > 0)
     //           {
     //               if (model.CommentRelationList == null)
     //                   model.CommentRelationList = cmtRelationList.ToList();
     //               else
     //               {
     //                   foreach (var relation in cmtRelationList)
     //                   {
     //                       model.CommentRelationList.Add(relation);
     //                   }
     //               }
     //           }
     //       }
     //       //paging comment
     //       model.PagingCommentInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = CommentSize, TotalItems = cmtList.Count() };
     //      // model.CurrentComment = currentComment;
     //       //Paging Comment relation
     //       int size = 10;
     //       if (model.CommentRelationList != null)
     //       {
     //           int countRelation = model.CommentRelationList.Count();
     //           model.CommentRelationList = model.CommentRelationList.Skip((page-1) * size).Take(size).ToList();
     //           model.PagingCommentRelationInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = size, TotalItems = countRelation };
     //       }
     //       return PartialView("Subwall",model); 
     //}

        //create subcomment
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Subwall([Bind(Exclude = "CommentID")] Models.Comment cmt, FormCollection collection)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string url = urlHelper.Action("Index","Home");
            try
            {
                if (Session["CurrentUserID"] == null)
                    return Redirect(url);
                int userOnWall = Convert.ToInt32(collection["UserIDOnWall"].ToString());
                int cmtID = Convert.ToInt32(collection["commentid"].ToString());
                String cmtcontent = collection["txtSubComment"+cmtID].ToString();
                if (String.IsNullOrWhiteSpace(cmtcontent))
                {
                    string urlnull = urlHelper.Action("Index", "MemberHome", new { id=userOnWall});
                    return Redirect(urlnull);
                }
               
                //
                int currentUserID = Convert.ToInt32(Session["CurrentUserID"]);
                if (userOnWall != currentUserID)
                    cmt.UserID = currentUserID;// user write comment
                else
                    cmt.UserID = userOnWall;
                cmt.CommentContent = cmtcontent;
                cmt.Datepost = DateTime.Now;
                cmt.CommentType = Utilities.cstCommentTypeWall;
                cmt.BlogID = Utilities.IDefaultBlog;
                cmt.EventID = Utilities.IDefaultEvent;
                cmt.Status = Utilities.cstNewStatus;
                cmt.CommentParentID = cmtID;
                cmt.UserWall = userOnWall;
                ctx.AddToComments(cmt);
                ctx.SaveChanges();
                //refresh mainwall
                var model = GetAllCommentsRelation(cmtID);
                //main
                model.UserIDOnWall = userOnWall;
                model.commentid = cmtID;
                return PartialView("Subwall", model);

            }
            catch (Exception ex)
            {
                return Redirect(url);
            }
        }
        // get all subcomments
        public MemberHomeListViewModel GetAllCommentsRelation(int cmtID)
        {
           var model=new MemberHomeListViewModel();
            IEnumerable<GetAllCommentRelationByCommentID_Result> cmtRelationList = ctx.GetAllCommentRelationByCommentID(cmtID).ToList();
            if (cmtRelationList.Count() > 0)
            {
                if (model.CommentRelationList == null)
                    model.CommentRelationList = cmtRelationList.ToList();
                else
                {
                    foreach (var relation in cmtRelationList)
                    {
                        model.CommentRelationList.Add(relation);
                    }
                }
            }
            model.commentid = cmtID;
            return model;
        }
       //delete main comment and all relations
        public ActionResult DeleteComment(int id, int wallID)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string url = urlHelper.Action("Index", "Home");
            try
            {
                if (Session["CurrentUserID"] == null)
                    return Redirect(url);
               
                ctx.DeleteCommentRelation(id);
                var model=new MemberHomeListViewModel();
                MainWall(model, wallID, "");
                return PartialView("MainWall", model);
            }
            catch 
            {
                return Redirect(url);

            }
        }
        public ActionResult DeleteCommentRelation(int id,int commentid,bool showall)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string url = urlHelper.Action("Index", "Home");
            try
            {
                if (Session["CurrentUserID"] == null)
                    return Redirect(url);
                ctx.DeleteComment(id);
                var model=new MemberHomeListViewModel();
                if (showall)
                {
                    model = GetAllCommentsRelation(commentid);
                    model.ShowAll = showall;
                }
                else
                {
                    model.CommentRelationList = ctx.GetTopNewCommentRelationByCommentID(commentid).ToList();
                    model.commentid = commentid;
                    model.ShowAll = false;
                }
                return PartialView("Subwall", model);
            }
            catch 
            {
                return Redirect(url);

            }
        }
        //show all comment relation by comment id
        public ActionResult ShowAllCommentsRealtion(int commentid)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string url = urlHelper.Action("Index", "Home");
            try
            {
                if (Session["CurrentUserID"] == null)
                    return Redirect(url);
                var model = GetAllCommentsRelation(commentid);
                model.commentid = commentid;
                model.ShowAll = true;
                return PartialView("Subwall", model);
            }
            catch
            {
                return Redirect(url);

            }
        }
        //paging comments
        public ActionResult PagingWall(int id,  int page = 0)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string url = urlHelper.Action("Index","Home");

            try
            {
                if (Session["CurrentUserID"] == null)
                    return Redirect(url);
                
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");//lost session ==>redirect to home page
                int CurrentUserID = Convert.ToInt32(Session["CurrentUserID"].ToString());
                //int GuestUserID = Convert.ToInt32(Session["GuestUserID"].ToString());
                int GuestUserID = id;
                var model = new MemberHomeListViewModel();

                GetUserByID_Result guestUser = ctx.GetUserByID(GuestUserID).SingleOrDefault();
                model.UserNameOnWall = guestUser.UserFullName;
                model.PictureOnWall = guestUser.UserPicture;
                model.UserIDOnWall = guestUser.UserID;
                Session["GuestUserID"] = guestUser.UserID;
                IEnumerable<GetAllCommentsByWall_Result> cmtList = ctx.GetAllCommentsByWall(id).ToList();
                model.CommentList = cmtList.Skip((page) * CommentSize).Take(CommentSize).ToList();
                foreach (var item in model.CommentList)
                {
                    IEnumerable<GetAllCommentRelationByCommentID_Result> cmtRelationList = ctx.GetTopNewCommentRelationByCommentID(item.CommentID).ToList();
                    if (cmtRelationList.Count() > 0)
                    {
                        if (model.CommentRelationList == null)
                            model.CommentRelationList = cmtRelationList.ToList();
                        else
                        {
                            foreach (var relation in cmtRelationList)
                            {
                                model.CommentRelationList.Add(relation);
                            }
                        }
                    }
                }
                //paging comment
                model.PagingCommentInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = CommentSize, TotalItems = cmtList.Count() };
                //model.CurrentComment = currentpage;
                //Paging Comment relation
                return PartialView("MainWall", model);
            }
            catch 
            {
                return Redirect(url);

            }
        }
        #endregion
        #region--Left Wall--
        public ActionResult LeftWall(int UserID)
        {
            try
            {
                var model = new MemberHomeListViewModel();
                GetUserByID_Result user = ctx.GetUserByID(UserID).FirstOrDefault();
                model.UserIDOnWall = user.UserID;
                model.UserNameOnWall = user.UserFullName;
                model.PictureOnWall = user.UserPicture;
                return View(model);
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }
        }
        #endregion
        #region--Join--
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Join(FormCollection collection)
        {
            var helper = new UrlHelper(HttpContext.Request.RequestContext);
            try
            {
                 if (Session["CurrentUserID"] == null)
                    return Redirect(Url.Action("Index","Home"));
                String custName = collection[1].ToString();
                String custPhone = collection[2].ToString();
                String custMail = collection[3].ToString();
                String custContent = collection["EventName"].ToString();
                //mail subject
                String Subject = "Đăng ký tham gia: " + custName + " -Số điện thoại- " + custPhone;
                //create mail body
                StringBuilder sbBody = new StringBuilder();
                sbBody.Append("\n");
                sbBody.Append("Tham gia chương trình: " + custContent);
                sbBody.Append("\n");
                sbBody.Append("Người đăng ký: " + custName);
                sbBody.Append("\n");
                sbBody.Append("Điện thoại: " + custPhone);
                sbBody.Append("\n");
                sbBody.Append("Email: " + custMail);
                    //
                    var model =new MemberHomeListViewModel();
                    IEnumerable<GetTopFiveNewEvent_Result> eveList = ctx.GetTopFiveNewEvent().ToList();
                     //get 3 envents
                    model.EventList = eveList.Take(3).ToList();
                if (MailHelper.Receive(Subject, sbBody.ToString()))
                {
                    ViewData["MailMessage"] = "Cảm ơn bạn đã đăng ký. Chúng tôi sẽ liên lạc trong thời gian sớm nhất";
                   return PartialView("NewEvents",model);
                }
                else
                {
                    ViewData["MailMessage"] = "Chưa đăng ký được. Vui lòng thử lại";
                    return PartialView("NewEvents",model);
                }
            }
            catch
            {
                
                string url =helper.Action("Index","MemberHome",new {id=Convert.ToInt32(Session["CurrentUserID"])});
                return Redirect(url); ;
            }
        }
        #endregion
    }
}