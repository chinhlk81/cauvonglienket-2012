using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
using System.IO;
using System.Data.Objects;
using System.Web.Routing;
namespace CVLK2011.Controllers.Member
{
    [HandleError]
    public class MemberBlogController : BaseController
    {
        //
        // GET: /MemberBlog/
        Models.DBContainer ctx = new DBContainer();
        public int PageSize = 20;
        const string physicalPath = "../../Images/Blogs/";
        const string virtualPath = "~/Images/Blogs/";
        public ActionResult Index(int id,String currentBlog, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                var viewModel = new BlogListViewModel();
                viewModel.OwnerUser = Convert.ToInt32(Session["CurrentUserID"]);
                viewModel.GuestUser = id;
                Session["GuestUserID"] = viewModel.GuestUser;
                IEnumerable<GetAllBlogs_Result> blog = ctx.GetAllBlogByUserID(viewModel.GuestUser).ToList();
                viewModel.BlogList = blog.Skip((page-1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = blog.Count() };
                viewModel.CurrentBlog = currentBlog;
                //get blog of friend
                UCFriendBlog(viewModel,currentBlog, page);
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        //get all blog of friend 
        public ActionResult UCFriendBlog(BlogListViewModel viewModel,String CurrentFriendBlog, int page = 1)
        {
            try
            {

                IEnumerable<GetAllFriendsOfCurrentUserByID_Result> friendLists = GetAllFriends(viewModel.GuestUser);
                //var viewModel = new BlogListViewModel();
                foreach (GetAllFriendsOfCurrentUserByID_Result fr in friendLists)
                {
                    //one frien only take 1 blog on index 
                    IEnumerable<GetAllBlogOfFriends_Result> friendBlog = ctx.GetAllBlogOfFriends(fr.UserIdOfFriend).Take(1).ToList();
                    if (friendBlog.Count() > 0)
                    {
                        if (viewModel.FriendBlogList == null)
                            viewModel.FriendBlogList = friendBlog.ToList();
                        else
                        {
                            foreach (var item in friendBlog)
                            {
                                viewModel.FriendBlogList.Add(item);
                            }
                        }
                    }
                }
                IList<GetAllBlogOfFriends_Result> friendBlogList = viewModel.FriendBlogList;
                viewModel.FriendBlogList = friendBlogList.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.FriendPagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = friendBlogList.Count() };
                viewModel.CurrentFrindBlog = CurrentFriendBlog;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
    
        //get all priend relationship
        public IEnumerable<GetAllFriendsOfCurrentUserByID_Result> GetAllFriends(int UserID)
        {
            return ctx.GetAllFriendsOfCurrentUserByID(UserID);
           //return ctx.GetAllFriendsByUser(UserID);
        }
        public ActionResult FriendBlog(int id,String currentFriendBlog,int page=1)
        {
            try
            {
                var viewModel = new FriendsBlogListViewModel();
                IEnumerable<GetAllFriendsOfCurrentUserByID_Result> friendLists = GetAllFriends(id);
                foreach (GetAllFriendsOfCurrentUserByID_Result fr in friendLists)
                {
                    IEnumerable<GetAllBlogOfFriends_Result> friendBlog = ctx.GetAllBlogOfFriends(fr.UserIdOfFriend).ToList();
                    if (friendBlog.Count() > 0)
                    {
                        if (viewModel.FriendBlogList == null)
                            viewModel.FriendBlogList = friendBlog.ToList();
                        else
                        {
                            foreach (var item in friendBlog)
                            {
                                viewModel.FriendBlogList.Add(item);
                            }
                        }
                    }
                }
                IList<GetAllBlogOfFriends_Result> friendBlogList = viewModel.FriendBlogList;
                viewModel.FriendBlogList = friendBlogList.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = friendBlogList.Count() };
                viewModel.CurrentBlog = currentFriendBlog;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
    
        public ActionResult Details(int id, String currentCommet, int page =0)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            //create usercontrol Comment
           // CreateComment();
            // GetBlogByID_Result blg = ctx.GetBlogByID(id).Single(bl => bl.BlogID == id);
            GetBlogByID_Result blg = ctx.GetBlogByID(id).Single();
            var viewDetail = new BlogDetailsViewModel();
            viewDetail.CurrentBlog = blg;
            IList<Comment> listComment = ctx.GetAllCommentsByBlog(id).ToList();
            viewDetail.CommentsList = listComment.Skip((page) * PageSize).Take(PageSize).ToList();
            viewDetail.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = listComment.Count() };
            viewDetail.CurrentBlogComment = currentCommet;
            viewDetail.BlogID = id;
            viewDetail.CommentCount = listComment.Count();
            //BlogComments(viewDetail);
            return View(viewDetail);
        }

       
        // 
        public ActionResult Create()
        {
            CVLK2011.Models.Blog blg = new Models.Blog();
            return View(blg);
        }
        //
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Exclude = "BlogID")] Blog blog, FormCollection collection, HttpPostedFileBase upLoadFile)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                int userID = Convert.ToInt32(Session["CurrentUserID"].ToString());
                blog.Datepost = DateTime.Now;
                blog.UserID = userID;
                blog.Status = Models.Utilities.cstNewStatus;
                blog.BlogContent = collection["FckEditor1"].ToString();
                if (upLoadFile != null)
                {
                    var filePath = String.Empty;
                   
                    var fileName = Path.GetFileName(upLoadFile.FileName);
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath,upLoadFile.FileName, Session["CurrentUserID"].ToString());
                    blog.ImageUpload = physicalPath + sFileName;
                    filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    upLoadFile.SaveAs(filePath);
                    

                }
                ctx.AddToBlogs(blog);
                ctx.SaveChanges();
               
                return RedirectToAction("Index",new {id=userID});
            }
            catch
            {
                return View("Create");
            }
        }
        //
        public ActionResult Edit(int id)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            Blog blg = ctx.Blogs.Single(bl => bl.BlogID == id);
            return View(blg);
        }
        //
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection, HttpPostedFileBase editFile)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                Blog blg = ctx.Blogs.Single(bl => bl.BlogID == id);
                blg.BlogTitle = collection["BlogTitle"].ToString();
                blg.BlogContent = collection["FckEditor1"].ToString();
                String oldName = String.Empty;
                if (editFile != null)
                {
                    oldName = blg.ImageUpload;
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath, editFile.FileName, Session["CurrentUserID"].ToString());
                    blg.ImageUpload = physicalPath + sFileName;
                   String filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                   editFile.SaveAs(filePath);
                }

                //UpdateModel(blg);
                ctx.SaveChanges();
                Utilities.DeleteFile(Request, virtualPath, oldName);
                return RedirectToAction("Details", new { id=id});
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult Delete(int id)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                ctx.DeleteBlog(id);
                return RedirectToAction("Index", new { id = Convert.ToInt32(Session["GuestUserID"]) });
            }
            catch
            {
                return View();
            }
        }
        //preview
        public ActionResult Preview(ViewContext viewContext)
        {
            try
            {
                Blog blg = new Blog();
                ViewContext v = viewContext;

                //blg.BlogTitle = collection[0].ToString();
                //blg.BlogContent = collection[1].ToString();
                return View(blg);
            }
            catch
            {
                return View();
            }
        }
        //Comment blog
        //
        public ActionResult BlogComments( int id, int page = 0)
        {
            //int id = 18;
           // String currentCommet = String.Empty;
            GetBlogByID_Result blg = ctx.GetBlogByID(id).Single();
            var viewDetail = new BlogDetailsViewModel();
            viewDetail.CurrentBlog = blg;
            IList<Comment> listComment = ctx.GetAllCommentsByBlog(id).ToList();
            viewDetail.CommentsList = listComment.Skip((page) * PageSize).Take(PageSize).ToList();
            viewDetail.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = listComment.Count() };
           // viewDetail.CurrentBlogComment = currentCommet;
            viewDetail.BlogID = id;
            viewDetail.CommentCount = listComment.Count();
            return PartialView("BlogComments", viewDetail);
        }
        //
        public ActionResult CreateComment()
        {
            Comment comt = new Comment();
            return View(comt);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateComment([Bind(Exclude = "CommentID")] CVLK2011.Models.Comment cmt, FormCollection collection)
        {
            
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            
            try
            {
                
                if (Session["CurrentUserID"] == null)
                {
                    string url = urlHelper.Action("Index", "Home");
                    return Redirect(url);
                }
               // cmt.BlogID = Convert.ToInt32(collection["CurrentBlog.BlogID"]);
                cmt.BlogID = Convert.ToInt32(collection["BlogID"]);
                 String strCommentContent =collection["BlogComment"].ToString();
                if (String.IsNullOrWhiteSpace(strCommentContent))
                {
                    ViewData["ValidateComment"] = "Vui lòng nhập bình luận trước!";
                    var model = GetBlogCommments(cmt.BlogID, false);
                    return PartialView("BlogComments",model);
                }
                cmt.UserID = Convert.ToInt32(Session["CurrentUserID"]);
                cmt.CommentContent = collection["BlogComment"].ToString();
                cmt.Datepost = DateTime.Now;
                cmt.Status = Models.Utilities.cstNewStatus;
                cmt.EventID =Utilities.IDefaultEvent;
                ctx.AddToComments(cmt);
                ctx.SaveChanges();
               //refresh comment list
                //int page = 0;
                var newmodel = GetBlogCommments(cmt.BlogID,true);
                return PartialView("BlogComments", newmodel);

            }
            catch
            {
                string ulrFail = urlHelper.Action("Details", "MemberBlog", new RouteValueDictionary { { "id", cmt.BlogID } });
                return Redirect(ulrFail);
               // return RedirectToAction("Details", new RouteValueDictionary { {} });
            }
        }
        public BlogDetailsViewModel GetBlogCommments(int blogid ,bool bNew,int page=0)
        {
            var model = new BlogDetailsViewModel();
            IList<Comment> listComment = ctx.GetAllCommentsByBlog(blogid).ToList();
            if (bNew)
            {
                page = (int)Math.Ceiling(listComment.Count() / (double)PageSize);
                if (page > 0)
                    page--;
            }
            model.CommentsList = listComment.Skip((page) * PageSize).Take(PageSize).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = listComment.Count() };
            model.CurrentBlogComment = (page).ToString();
            model.CommentCount = listComment.Count();
            model.BlogID = blogid;
            return model;
        }
        //delete comment blog
        public ActionResult DeleteComment(int id,int blogid)
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
                 var model = GetBlogCommments(blogid, false);
                 return PartialView("BlogComments", model);
             }
             catch
             {
                 string urlBlog = urlHelper.Action("Details", "MemberBlog", new { id = blogid });
                 return Redirect(urlBlog);
             }
        }
    }
}
