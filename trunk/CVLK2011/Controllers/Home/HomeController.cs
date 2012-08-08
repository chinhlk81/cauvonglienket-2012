using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Text;
using CVLK2011.Models;
using CVLK2011.HtmlHelpers;
using System.Net.Mail;
using System.Net;
using System.Web.Configuration;
using System.Net.Configuration;
using System.Configuration;
namespace CVLK2011.Controllers.Home
{
    [HandleError]
    public class HomeController : BaseController
    {
        //
        // GET: /Home/Index
        private const String strNewUserStatus = "New";
        public int PageSize = 4;
        public int PageSizeComment = 10;
        public int PageSizeAlbum = 12;
        Models.DBContainer ctx = new Models.DBContainer();

        public ActionResult Index()
        {
            //ViewData["Message"] = "Welcome to ASP.NET MVC!";
            return View();
            
        }
        //
        // GET: /Home/Gioithieu

       
        //
        // GET: /Home/ThuVienAnh (Danh sach Album)
        #region--album photo--
        public ActionResult DanhSachAlbum(string category, int page = 1)
        {
            IEnumerable<GetAlbumAndPhoto_Result> album = ctx.GetAlbumAndPhoto().ToList();            
            var viewModel = new CVLK2011.Models.AlbumCatalogueListViewModel();
            viewModel.Albums = album.Skip((page - 1) * PageSizeAlbum).Take(PageSizeAlbum).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSizeAlbum, TotalItems = album.Count() };
            viewModel.CurrentAlbums = category;
            return View(viewModel);           
            
        }

        public ActionResult ChiTietAlbum(int id)
        {
            IList<Photo> pho = ctx.GetPhotoByAlbum(id).ToList();
           // IEnumerable<Photo> pho = ctx.GetPhotoByAlbum(id);
            Album alb = ctx.GetAlbumByID(id).Single();
            ViewData["albumname"] = alb.AlbumName;
            return View(pho);
        }
        //
        // GET: /Home/DanhSachHinhAnh

        public ActionResult DanhSachHinhAnh()
        {
            return View();
        }
        #endregion
        #region--Register--
      
        /// <summary>
        /// Created by Hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Show Register form
        /// </summary>
        /// <returns></returns>
        public ActionResult Register()
        {
            Captcha();
            TermsOfUse();
            Models.User user = new Models.User();
            IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
            ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName");
            //
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
        /// <param name="frmcollection"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Register([Bind(Exclude = "UserID")] CVLK2011.Models.User objUserInfo, FormCollection frmcollection)
        {
            //overide redirect to onather page by redirect of ajxa
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext); 
            try
            {
                if (!CaptchaHelper.VerifyAndExpireSolution(HttpContext, frmcollection["myCaptcha"].ToString(), frmcollection["txtCaptcha"].ToString()))
                {
                    ViewData["NoCaptcha"] = "Mã xác nhận không chính xác";
                    return PartialView("Captcha");
                }
                if ((!CheckName(objUserInfo.UserName)) || (!CheckEmail(objUserInfo.UserEmail)))
                {
                   // return View();
                    return PartialView("Captcha");
                   //string registerUrl = urlHelper.Action("Register", "Home");
                   //return Redirect(registerUrl);
                }

                DateTime dteUserBirthday = DateTime.Today;
                objUserInfo.UserRegisterDate = DateTime.Today;
                if(DateTime.TryParse(frmcollection["UserBirthday"], out dteUserBirthday))
                    objUserInfo.UserBirthday = dteUserBirthday.Date;
                 EnCrypto encript = new EnCrypto();
                 objUserInfo.Password = encript.Encrypt(objUserInfo.Password);
                 objUserInfo.UserEventParentID = Convert.ToInt32(frmcollection["eventParents"].ToString());
                objUserInfo.UserStatus = strNewUserStatus;
                objUserInfo.UserIsVIP = false;
                if (objUserInfo.UserGender.Equals("Male"))
                    objUserInfo.UserPicture = "../../Images/Users/Male.jpg";
                else if (objUserInfo.UserGender.Equals("Female"))
                    objUserInfo.UserPicture = "../../Images/Users/Female.jpg";
                else
                    objUserInfo.UserPicture = "../../Images/Users/none.jpg";
                objUserInfo.UserType = Utilities.cstUserTypeNone;
                ctx.AddToUsers(objUserInfo);
                ctx.SaveChanges();
                Session["CurrentUserID"] = objUserInfo.UserID;
                Session["CurrentUserObject"]=objUserInfo;
                Session["GuestUserID"]=objUserInfo.UserID;
                string memberUrl = urlHelper.Action("Index", "MemberHome", new { id = objUserInfo.UserID });
                
                try
                {
                    //send mail to info@cauvonglienket.com
                     //mail subject
                String  Subject = "Thành viên mới đăng ký ";
                //create mail body
                StringBuilder sbBody = new StringBuilder();
                sbBody.Append("\n");
                sbBody.Append("Tên thành viên: "+objUserInfo.UserFullName);
                sbBody.Append("\n");
                sbBody.Append("Email: "+objUserInfo.UserEmail);
                sbBody.Append("\n");
                sbBody.Append("Điện thoại: " + objUserInfo. UserPhone);
                sbBody.Append("\n");
                MailHelper.ReceiveByEmail(Subject, sbBody.ToString(), "info@cauvonglienket.com");
                //and send mail to regester
                String SubjectConfirm = "Cầu vồng liên kết ";
                //create mail body
                StringBuilder sbBodyConfirm = new StringBuilder();
                sbBodyConfirm.Append("\n");
                sbBodyConfirm.Append("Xin chào "+objUserInfo.UserFullName+" ,");
                sbBodyConfirm.Append("\n");
                sbBodyConfirm.Append("Chúc mừng bạn  đã đăng ký thành công làm thành viên của đại gia đình Cầu Vồng Liên Kết.");
                sbBodyConfirm.Append("\n");
                sbBodyConfirm.Append(" Chúng tôi sẽ hồi âm đến bạn trong thời gian sớm nhất.Công ty chúng tôi rất hân hạnh được chia sẽ và đồng hành cùng bạn.");
                sbBodyConfirm.Append("\n");
                sbBodyConfirm.Append("Xin chân thành cảm ơn sự quan tâm của bạn đối với công ty.");
                sbBodyConfirm.Append("\n");
                sbBodyConfirm.Append("Trân trọng.");
                sbBodyConfirm.Append("\n");
                MailHelper.Send(SubjectConfirm, sbBodyConfirm.ToString(),objUserInfo.UserEmail);
                
                }
                catch
                {
                    return Redirect(memberUrl);
                }
                
               return Redirect(memberUrl);

                
                
            }catch
            {
                string urlcatch = urlHelper.Action("Register", "Home", objUserInfo);
                return Redirect(urlcatch);
            }
        }
        
        public ActionResult TermsOfUse()
        {
            MenuConfig menu = ctx.MenuConfigs.Single(m => m.MenuNo == "Regulations" || m.MenuConfigName == "Quy định sử dụng");
            return View(menu);
        }
        //check esxist user name
        public bool CheckName(string userName)
        {
            try
            {
                Models.User user = ctx.GetUserByName(userName.Trim()).FirstOrDefault();
                if (user != null)
                    return false;
                else
                    return true;
            }
            catch
            {
                return false;
            }
        }
        public bool CheckEmail(String email)
        {
            try
            {
                String uEmail = ctx.CheckUserEmail(email).FirstOrDefault();
                if (String.IsNullOrEmpty(uEmail))
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }
        //check login
        public bool CheckLogin()
        {
            if (Session["CurrentUserID"] == null)
                return false;
            else
                return true;
        }
        //Register join
        public ActionResult Join()
        {
            return View();
        }
        //
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Join(FormCollection collection)
        {
            try
            {
                
                String custName = collection[1].ToString();
                String custPhone = collection[2].ToString();
                String custMail = collection[3].ToString();                               
                String custContent = collection["EventName"].ToString();
                //mail subject
                String  Subject = "Đăng ký tham gia: " + custName + " -Số điện thoại- " + custPhone;
                //create mail body
                StringBuilder sbBody = new StringBuilder();
                sbBody.Append("\n");
                sbBody.Append("Tham gia chương trình: "+custContent);
                sbBody.Append("\n");
                sbBody.Append("Người đăng ký: "+custName);
                sbBody.Append("\n");
                sbBody.Append("Điện thoại: " + custPhone);
                sbBody.Append("\n");
                sbBody.Append("Email: "+custMail);
                if (MailHelper.Receive(Subject, sbBody.ToString()))
                {
                    ViewData["MailMessage"] = "Cảm ơn bạn đã liên lạc. Chúng tôi sẽ trả lời trong thời gian sớm nhất";
                    return RedirectToAction("EventList", "Home");
                }
                else
                {
                    ViewData["MailMessage"] = "Nội dung chưa gởi được. Vui lòng thử lại";
                    return RedirectToAction("EventList", "Home");
                }
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }
        }
        //
        public ActionResult ShowJoin()
        {
            return PartialView("Join");
        }

        #endregion

        #region--Send contact -- Menu--
        //
        // GET: /Home/LienHe

        public ActionResult LienHe()
        {
            MenuConfig menu = ctx.MenuConfigs.Single(p => p.MenuConfigName == "Liên hệ" || p.MenuNo == "Contact");
            return View(menu);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult LienHe(FormCollection collection)
        {
            try
            {
                String custMail = collection["txtEmail"].ToString();
                String custPhone = collection["txtPhone"].ToString();
                String custName = collection["txtName"].ToString();
                String custContent = collection["txtaContent"].ToString();
                String subject="Người liên hệ: "+custName;
                String mailContent = custName + "--ĐT--" + custPhone + "--" + custContent;
                if (MailHelper.Receive(subject, mailContent))
                {
                    ViewData["MailSuccess"] = "Cảm ơn bạn đã liên lạc. Chúng tôi sẽ trả lời trong thời gian sớm nhất";
                    return RedirectToAction("LienHe", "Home");
                }
                else
                {
                    ViewData["mailFail"] = "Không thực hiện được, vui lòng thử lại";
                    return RedirectToAction("LienHe", "Home");
                }
            }
            catch
            {
                ViewData["mailFail"] = "Không thực hiện được, vui lòng thử lại";
                return RedirectToAction("LienHe", "Home");
            }
        }
        //
        public ActionResult Gioithieu()
        {
            MenuConfig menu = ctx.MenuConfigs.Single(m => m.MenuNo == "Introduction" || m.MenuConfigName == "Giới thiệu");
            return View(menu);
        }

        //
        // GET: /Home/QuyDinhSuDung

        public ActionResult QuyDinhSuDung()
        {
            MenuConfig menu = ctx.MenuConfigs.Single(m => m.MenuNo == "Regulations" || m.MenuConfigName == "Quy định sử dụng");
            return View(menu);
        }

        //
        // GET: /Home/TroGiup

        public ActionResult TroGiup()
        {
            MenuConfig menu = ctx.MenuConfigs.Single(m => m.MenuNo == "Help" || m.MenuConfigName == "Trợ giúp");
            return View(menu);
        }

        #endregion
        // 
        // GET: /Home/EventList (Danh Sach Event)
        #region--Events--
        public ActionResult EventList(string category, int page = 1)
        {
            IEnumerable<Event> getAllEvent = ctx.GetAllEvents().ToList();
            var viewModel = new CVLK2011.Models.EventsListViewModel();
            viewModel.Products = getAllEvent.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = getAllEvent.Count() };
            viewModel.CurrentCategory = category;
            return View(viewModel);
        }

        //
        // GET: /Default1/Create
        //
        public ActionResult EventDetails(int id,String currentPage,int page=0)
        {
            
            Event eve = ctx.GetEventByID(id).FirstOrDefault<Event>();
            var viewDetail = new EventDetailsViewModel();
            viewDetail.CurrentEvent = eve;
            IEnumerable<Comment> cmt =ctx.GetAllCommentByEventID(id).ToList();
            viewDetail.CommentsList = cmt.Skip((page ) * PageSizeComment).Take(PageSizeComment).ToList();
            viewDetail.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSizeComment, TotalItems = cmt.Count() };
            viewDetail.CurrentPage = currentPage;
            viewDetail.EventID = id;
            return View(viewDetail);
        }
        //
        //create Event comment
        public ActionResult CreateComment()
        {
            Comment comt = new Comment();
            return View(comt);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateComment([Bind(Exclude = "CommentID")] CVLK2011.Models.Comment cmt, FormCollection collection)
        {
            var helper = new UrlHelper(HttpContext.Request.RequestContext);
            try
            {
                int eventID = Convert.ToInt32(collection["EventID"].ToString());
                cmt.EventID = eventID;
                 //var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
                 //string url = urlHelper.Action("EventDetails", new { id = cmt.EventID });
                if (Session["CurrentUserID"] == null)
                {
                    ViewData["InvalidateUser"] = "Vui lòng đăng nhập trước khi bình luận !";
                    string url = helper.Action("EventDetails", new { id = cmt.EventID });
                    return Redirect(url);
                }
                String strCommentContent = collection["EventComment"].ToString();
                if (String.IsNullOrWhiteSpace(strCommentContent))
                {
                    ViewData["InvalidateComment"] = "Vui lòng nhập bình luận trước!";
                    return Redirect(Url.Action("EventDetails", new { id = cmt.EventID }));
                }
                cmt.UserID = Convert.ToInt32(Session["CurrentUserID"]);
                cmt.CommentContent = collection["EventComment"].ToString();
                cmt.Datepost = DateTime.Now;
                cmt.Status = Models.Utilities.cstNewStatus;
                cmt.BlogID = Utilities.IDefaultBlog;
                cmt.CommentParentID = Utilities.IDefaultComment;
                cmt.CommentType = Utilities.cstCommentTypeEvent;
                cmt.UserWall = Utilities.IDefaultUser;
                ctx.AddToComments(cmt);
                ctx.SaveChanges();
                var newmodel = GetEventCommments(eventID, true);
                return PartialView("EventComments", newmodel);

            }
            catch
            {
                //return to error page
                return Redirect(Url.Action("EventDetails", new RouteValueDictionary { { "id", cmt.BlogID } }));
            }
        }

        //get comments
        public EventDetailsViewModel GetEventCommments(int eventid, bool bNew, int page =0)
        {
            var model = new EventDetailsViewModel();
            IList<Comment> listComment = ctx.GetAllCommentByEventID(eventid).ToList();
            if (bNew)
            {
                page = (int)Math.Ceiling(listComment.Count() / (double)PageSizeComment);
                if (page > 0)
                    page--;
            }
            model.CommentsList = listComment.Skip((page) * PageSizeComment).Take(PageSizeComment).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSizeComment, TotalItems = listComment.Count() };
            model.EventComment = (page).ToString();
            model.EventID = eventid;
            return model;
        }
        public ActionResult EventComments(int id, int page = 0)
        {
            //int id = 18;
            // String currentCommet = String.Empty;
            Event eve = ctx.GetEventByID(id).SingleOrDefault();
            var viewDetail = new EventDetailsViewModel();
            viewDetail.CurrentEvent = eve;
            IList<Comment> listComment = ctx.GetAllCommentByEventID(id).ToList();
            viewDetail.CommentsList = listComment.Skip((page) * PageSizeComment).Take(PageSizeComment).ToList();
            viewDetail.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSizeComment, TotalItems = listComment.Count() };
            // viewDetail.CurrentBlogComment = currentCommet;
            viewDetail.EventID = id;
            return PartialView("EventComments", viewDetail);
        }
        //delete comment
        public ActionResult DeleteComment(int id, int eventid)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);

            try
            {

                if (Session["CurrentUserID"] == null)
                {
                    string url = urlHelper.Action("Index", "Home");
                    return Redirect(url);
                }
                ctx.DeleteComment(id);
                var model = GetEventCommments(eventid, false);
                return PartialView("EventComments", model);
            }
            catch
            {
                string urlevent = urlHelper.Action("EventDetails", "Home", new { id = eventid });
                return Redirect(urlevent);
            }
        }
        public ActionResult UCSuKienNoiBat()
        {
            IEnumerable<Event> evt = ctx.GetTopEventTypical().ToList();
            var viewModel = new CVLK2011.Models.EventsListViewModel();
            viewModel.Products = evt.ToList();

            return View(viewModel);
        }
        #endregion
        // 
        #region--Event Parents--
        //public ActionResult EventParents(int page=0)
        //{
        //    var model = new MemberHomeListViewModel();
        //    IEnumerable<GetAllEventParents_Result> eveprt = ctx.GetAllEventParents().ToList();
        //    model.EventParents = eveprt.Skip(page * PageSize).Take(PageSize).ToList();
        //    return View(model);
            
        //}
        //public JsonResult EventParents()
        //{
        //    StringBuilder sb = new StringBuilder();
        //    IEnumerable<GetAllEventParents_Result> list = ctx.GetAllEventParents().ToList();
        //    sb.Append("<div id=\"dvsubmenu\"");
        //    foreach (var item in list)
        //    {
        //        sb.Append("<ul><li><a href=\"/Home/EventParentDetails/" +item.EventParentID.ToString()+"\">"+item.EventParentName+ "</a></li></ul>");
        //    }
        //    sb.Append("<ul><li><a href=\"/Home/EventList\">Sự kiện</a></li></ul>");
        //    sb.Append("</div>");
        //    return Json(sb.ToString());

        //}
        public JsonResult EventParents()
        {
            StringBuilder sb = new StringBuilder();
            IEnumerable<GetAllEventParents_Result> list = ctx.GetAllEventParents().ToList();
            sb.Append("<ul class=\"a1\" id=\"dvsubmenu\">");
            foreach (var item in list)
            {
                sb.Append("<li><a href=\"/Home/EventParentDetails/" + item.EventParentID.ToString() + "\">" + item.EventParentName + "</a></li>");
            }
            sb.Append("<li><a href=\"/Home/EventList\">Sự kiện</a></li>");
            sb.Append("</ul>");
            return Json(sb.ToString());

        }
        public ActionResult EventParentDetails(int id)
        {
            try
            {
                var model = new EventParentsListViewModel();
               GetEventParentByID_Result eve= ctx.GetEventParentByID(id).FirstOrDefault();
               model.EventParent = eve;
                return View(model);
            }
            catch
            {
                return View();
 
            }
        }
        //
        public ActionResult EventParentList()
        {
            try
            {
                var model = new EventParentsListViewModel();
                IList<GetAllEventParents_Result> list = ctx.GetAllEventParents().ToList();
                model.EventParentsList = list;
                return View(model);

            }
            catch
            {
                return View();
            }
        }
        #endregion



        #region--Search user--
        public ActionResult TVFilterList(String gender, DateTime From, DateTime To, String province, String currentPage, int page = 1)
        {

            if (String.IsNullOrEmpty(province))
                province = "";
            IEnumerable<UserSearch_Result> searchResults = ctx.UserSearch(gender, From, To, province).ToList();
            var viewModel = new UserSearchResultViewModel();
            viewModel.SearchResults = searchResults.Skip((page-1)*PageSizeComment).Take(PageSizeComment).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSizeComment, TotalItems = searchResults.Count() };
            viewModel.CurrentPage = currentPage;
            //filter condition
            viewModel.FilterProvince = province;
            viewModel.FilterGender = gender;
            viewModel.FilterFrom = From;
            viewModel.FilterTo = To;
            return View(viewModel);
        }
        [HttpPost]
        public ActionResult SearchUser(FormCollection collection)
        {
            String gender = collection["UserGender"].ToString();
            String province =collection["Province"].ToString();
            int YearFROM = DateTime.Now.Year - Convert.ToInt32(collection["YearFrom"].ToString());
            int YearTO = DateTime.Now.Year - Convert.ToInt32(collection["YearTo"].ToString());
            DateTime From = new DateTime(YearFROM, 1, 1);
            DateTime To = new DateTime(YearTO, 1, 1);
            return RedirectToAction("TVFilterList", new { gender = gender, From = From, To = To, province = province });
        }
        
        public ActionResult AdvanceSearch()
        {
            return View();
        }
          public ActionResult UCTimThanhVien()
        {   
              List<string> result =YearOld();
              ViewData["YearFrom"] = new SelectList(result, "", "");
              ViewData["YearTo"] = new SelectList(result, "", "");
            return View();
        }

          

        public List<string> YearOld()
        {
            List<string> lst = new List<string>();
            for (int i = 18; i <= 40; i += 2)
            {
                lst.Add(i.ToString());
            }
            return lst;
        }
        #endregion
     
          #region--not use--
          public ActionResult VIPMember()
        {
            return View();
        }
          [HttpPost]
          public ActionResult VIPMember(FormCollection collection)
          {
              try
              {
                  String custMail = collection["txtEmail"].ToString();
                  String custPhone = collection["txtPhone"].ToString();
                  String custName = collection["txtName"].ToString();
                  String custContent = collection["txtaContent"].ToString();
                  String subject = "Thành viên đăng ký VIP: " + custName;
                  String mailContent = custName + " ĐT: " + custPhone + " : " + custContent;
                  if (MailHelper.Receive(subject, mailContent))
                  {
                      ViewData["MailMessage"] = "Bạn đã đăng ký VIP thành công, xin vui lòng chờ BQT xác nhận";
                     // return RedirectToAction("VIPMember", "Home");
                      return PartialView("UCVIPMember");
                  }
                  else
                  {
                      ViewData["MailMessage"] = "Không thực hiện được, vui lòng thử lại";
                     // return RedirectToAction("VIPMember", "Home");
                      return PartialView("UCVIPMember");
                  }
              }
              catch
              {
                  ViewData["MailMessage"] = "Không thực hiện được, vui lòng thử lại";
                  return View();
                  return PartialView("UCVIPMember");
              }
          }
        public ActionResult UCDichVu()
        {
            return View();
        }

        public ActionResult UCTVNoibat()
        {
            return View();
        }

        public ActionResult UCTVOnline()
        {
            return View();
        }

        public ActionResult UCQuangcaoL()
        {
            return View();
        }

      
        public ActionResult UCTVMoi()
        {
            return View();
        }

        public ActionResult UCTVUpPhoto()
        {
            return View();
        }
        
        public ActionResult UCQuangcaoR()
        {
            return View();
        }

        public ActionResult UCslideshow()
        {
            return View();
        }
          #endregion

        #region--Consultants--
        public ActionResult UCDoiNguTuVan()
        {
            //take 
            IEnumerable<GetAllConsultants_Result> cst = ctx.GetAllConsultants().Where(p=>p.Status=="Visible" && p.ConsultantFrontPage.ToString()=="True").ToList();
            //paging
            var viewModel = new ConsultantsListViewModel();
            viewModel.ConsultantList = cst.Take(3).ToList();
            return View(viewModel);
           
        }
        // view details
        public ActionResult ConsultantDetails(int id)
        {
            try
            {
                GetConsultantByID_Result cst = ctx.GetConsultantByID(id).Where(p=>p.Status=="Visible").SingleOrDefault();
                
                    var model = new ConsultantsListViewModel();
                    model.CurrentConsultantByID = cst;
                    model.ConsultantList = ctx.GetAllConsultants().Where(p => p.Status == "Visible").ToList();
                    return View(model);
                
            }
            catch
            {
                return View();
            }
        }
       
        public ActionResult TuVanVien()
        {
            return View();
        }
        public ActionResult TuVanVienDetail()
        {
            return View();
        }
        public ActionResult UCHoTroTrucTuyen()
        {
            IEnumerable<OlineSupport> lstOline = ctx.OlineSupports.Where(p => p.IsActive == true).Take(1).ToList();
            return View(lstOline);
        }


        //public ActionResult UCGocCamNhan()
        //{
        //    IEnumerable<GetAllCommentsEvent_Result> cmtEvt = ctx.GetTopCommentTypicalEvent().ToList();
        //    var viewModel = new CVLK2011.Models.CommentListViewModel();
        //    viewModel.CommentEventList = cmtEvt.ToList();
        //    return View(viewModel);
        //}
        public ActionResult UCGocCamNhan(int page=0)
        {
            IEnumerable<GetAllCommentsEvent_Result> cmtEvt = ctx.GetTopCommentTypicalEvent().ToList();
            var viewModel = new CVLK2011.Models.CommentListViewModel();
            viewModel.CommentEventList = cmtEvt.Skip((page) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = cmtEvt.Count() };
            return PartialView(viewModel);
        }
        //
        public ActionResult CommentDetails(int id)
        {
            GetCommentByID_Result cmt = ctx.GetCommentByID(id).SingleOrDefault();
            var model = new CommentListViewModel();
            model.CommentByID = cmt;
            IList<Comment> allcomment = ctx.GetAllCommentTypical().ToList();
            model.CommentTypicalList = allcomment;
            model.CommentTypicalList = allcomment.Skip((0) * PageSize).Take(PageSize).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = 0, ItemsPerPage = PageSize, TotalItems = allcomment.Count() };
            return View(model);
        }
        public ActionResult UCAllCommentTypical(string CurrentPage,int page=0)
        {
            var model = new CommentListViewModel();
            IList<Comment> allcomment = ctx.GetAllCommentTypical().ToList();
            model.CommentTypicalList = allcomment.Skip((page) * PageSize).Take(PageSize).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = allcomment.Count() };
            return View(model);
        }
        #endregion
        #region--Consultings--
        public ActionResult ConsultingDetails(int id)
        {
            try
            {
                GetConsultingByID_Result cst = ctx.GetConsultingByID(id).Single();
                var viewModel = new ConsultingsListViewModel();
                viewModel.CurrentConsulting = cst;
                viewModel.Products = ctx.GetAllConsultings().ToList();
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        public ActionResult UCGocTuVan()
        {
            IEnumerable<GetAllConsultings_Result> result = ctx.GetTopTreeConsulting().ToList();
            var viewModel = new CVLK2011.Models.ConsultingsListViewModel();
            viewModel.Products = result.ToList();
            return View(viewModel);
        }
        #endregion

        #region--Captcha--
          //captcha
        public ActionResult Captcha()
        {
            return PartialView("Captcha");
            //return View();
        }

        public ActionResult RefreshCaptcha()
        {
            //Captcha();
            return PartialView("Captcha");
        }
        public bool VerifyCaptcha(string myCaptcha, string txtCaptcha)
        {
            bool b = false;
            b = CVLK2011.HtmlHelpers.CaptchaHelper.VerifyAndExpireSolution(HttpContext, myCaptcha, txtCaptcha);
            return b;
        }
        #endregion
        #region--User LogOn--

        public ActionResult UCLogin()
        {
           // Models.User user = new User();
            return View();
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UCLogin(FormCollection collection)
        {
            try
            {
                EnCrypto encrypto = new EnCrypto();

                String userName = collection["UserName"].ToString();
                String password = collection["Password"].ToString();
                if (String.IsNullOrEmpty(userName) || String.IsNullOrEmpty(password))
                {
                    ViewData["LogOnResult"] = String.Format(userName + ": Thiếu thông tin đăng nhập!");
                    return RedirectToAction("Index", "Home");
                   // return View();
                }

                Models.User user = ctx.GetUserByName(userName).SingleOrDefault();
                if (user != null)
                {
                    
                    if (user.Password == encrypto.Encrypt(password))
                    {
                        Session["CurrentUserID"] = user.UserID;
                        Session["CurrentUserObject"] = user;
                        Session["GuestUserID"] = user.UserID;
                        return RedirectToAction("Index", "MemberHome", new RouteValueDictionary { { "id", user.UserID } });
                    }
                    else
                    {
                        ViewData["LogOnResult"] = String.Format(userName + ": Mật khẩu không đúng!");
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewData["LogOnResult"] = String.Format(userName + ": Không tồn tại!");
                    return RedirectToAction("Index", "Home");
                }
                //return View();
            }
            catch (Exception ex)
            {
                ViewData["LogOnResult"] = ex.Message;
                return RedirectToAction("Index", "Home");
            }
        }
        #endregion

        #region--User Logout--
        public ActionResult UCLogout()
        {
            try
            {
                //int iUserID = Convert.ToInt32(Session["CurrentUser"]);
                //GetUserByID_Result user = ctx.GetUserByID(iUserID).Single();
                return View();
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }
        }
        
        public ActionResult Logout()
        {
           
                Session["CurrentUserID"] = null;
                Session["CurrentUserObject"] = null;
                Session["GuestUserID"] = null;
                return RedirectToAction("Index", "Home");
        }
        #endregion

        #region --Foget password--
     
        public ActionResult ForgetPassword()
        {
            Captcha();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ForgetPassword(FormCollection collection, string myCaptcha, string txtCaptcha)
        {
            try
            {
               
                var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
                string url = urlHelper.Action("ForgetPassword", "Home");
                //
                if (!CVLK2011.HtmlHelpers.CaptchaHelper.VerifyAndExpireSolution(HttpContext, myCaptcha, txtCaptcha))
                {
                    ViewData["NoCaptcha"] = "Mã xác nhận không chính xác";
                    return PartialView("Captcha");
                } 
                String userName = collection["txtName"].ToString();
                String email = collection["txtEmail"].ToString();
                User user = ctx.GetUserByName(userName).SingleOrDefault();
                if (user != null)
                {
                    if (email == user.UserEmail)
                    {
                        //recovery password
                        EnCrypto crypt = new EnCrypto();
                        String pwd = crypt.Decrypt(user.Password);
                        //send email
                        String subject = "Lấy lại mật khẩu";
                        //mail subject
                        //create mail content
                        StringBuilder sbBody = new StringBuilder();
                        sbBody.Append("\n");
                        sbBody.Append("Chào :" + user.UserFullName);
                        sbBody.Append("\n");
                        sbBody.Append("Tên đăng nhập của bạn: " + user.UserName);
                        sbBody.Append("\n");
                        sbBody.Append("Mật khẩu: " + pwd);
                        sbBody.Append("\n");
                        sbBody.Append("Thân chào");
                        if (MailHelper.Send(subject, sbBody.ToString(), email))
                        {
                            //message successfull.
                            ViewData["SendSuccess"] = "Đã gởi thành công.Vui lòng kiểm tra Email";
                            return Redirect(url);
                        }
                        else
                        {
                            ViewData["Fail"] = "Không tồn tại tài khoản/Email.Vui lòng kiểm tra lại.";
                            return Redirect(url);
                        }
                    }
                }
                ViewData["Fail"] = "Không tồn tại tài khoản/Email.Vui lòng kiểm tra lại.";
                return Redirect(url);
               
                   
            }
            catch(Exception ex)
            {
                var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
                string url = urlHelper.Action("ForgetPassword", "Home");
                ViewData["Fail"] = ex.Message;
                return Redirect(url);
            }
        }
       
        #endregion

        public ActionResult Error()
        {
            return View();
        }
        //advertising
        public ActionResult FootAdOnHome()
        {
            var model = new AdListViewModel();
            IList<Ad> adsBottom = ctx.Ads_GetByOnPageAndPosition(Utilities.cstPositionBottomPage, Utilities.cstOnHomePage).ToList();
            if (adsBottom != null)
            {
                if (adsBottom.Count() > 0)
                {
                    List<Ad> listBottom = new List<Ad>();
                    int count = 4;
                    if (adsBottom.Count() < 4)
                        count = adsBottom.Count();
                    for (int i = 0; i < count; i++)
                    {
                        int iRandom = Random(adsBottom.Count());
                        listBottom.Add(adsBottom[iRandom]);
                        adsBottom.RemoveAt(iRandom);
                    }
                    model.AdList = listBottom;
                }
            }
            return View(model);
        }
        public int Random(int iRowCount)
        {
            Random rd = new Random();
            return rd.Next(0, iRowCount);
        }
        public ActionResult UserImagesCarousel()
        {
            IEnumerable<User> users = ctx.Users.Where(u => u.UserPicture != "../../Images/Users/none.jpg")
                .Where(u => u.UserPicture != "../../Images/Users/Male.jpg")
                .Where(u => u.UserPicture != "../../Images/Users/Female.jpg")
                .Where(status => status.UserStatus != "Delete").ToList();
            var viewModel = new CVLK2011.Models.UserListViewModel();
            viewModel.UsersObjectList = users.ToList();

            return View(viewModel);
        }
        public ActionResult UCStatisticsVisitor()
        {
            return View();
        }
    }
}
