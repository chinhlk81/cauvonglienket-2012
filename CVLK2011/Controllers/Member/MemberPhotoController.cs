using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;

namespace CVLK2011.Controllers.Member
{
    public class MemberPhotoController : BaseController
    {
        //
        // GET: /MemberPhoto/
        Models.DBContainer ctx = new Models.DBContainer();
        public int PageSize = 12;
        const string virtualPath = "~/Content/Images/";
        const string physicalPath = "../../../Content/Images/";
        public ActionResult Index(int id, string category, int page = 1)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            //var viewModel = new BlogListViewModel();
           // viewModel.OwnerUser = Convert.ToInt32(Session["CurrentUserID"]);
            //viewModel.GuestUser = id;
            int gestID=Convert.ToInt32(Session["GuestUserID"]);
            Session["GuestUserID"] = id;
            IEnumerable<GetMemberAlbum_Result> getAlbumInfo = ctx.GetMemberAlbum(id).ToList();
            //if (getAlbumInfo.Count() == 0)
            //{
            //    if)
            //}
            var viewModel = new CVLK2011.Models.MemberAlbumListViewModel();
            viewModel.AlbumLists = getAlbumInfo.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = getAlbumInfo.Count() };
            viewModel.CurrentAlbum = category;
            return View(viewModel);
        }
        /// <summary>
        /// Created by Hoang.Nguyen
        /// Created date 11.03.16[yy.mm.dd]
        /// </summary>
        /// <returns></returns>
        public ActionResult Details(int id)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            IList<Photo> pho = ctx.GetPhotoByAlbum(id).ToList();
            Album alb = ctx.GetAlbumByID(id).Single();
            ViewData["albumname"] = alb.AlbumName;
            return View(pho);            
        }
        /// <summary>
        /// Created by Hoang.Nguyen
        /// Created date 11.03.16[yy.mm.dd]
        /// Description:
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            CVLK2011.Models.Album alb = new Models.Album();           
            return View(alb);            
        }

        [HttpPost]
        public ActionResult Create([Bind(Exclude = "AlbumID")]CVLK2011.Models.Album alb, FormCollection colection)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                alb.AlbumDate = DateTime.Now;
                alb.Status = Utilities.cstNewStatus;
                alb.UserID = int.Parse(Session["CurrentUserID"].ToString());// Utilities.GetDefaultUser();
                alb.AlbumType = Utilities.cstAlbumTypeMember;
                ctx.AddToAlbums(alb);
                ctx.SaveChanges();
                int idalbum = int.Parse(ctx.GetMaxIDAlbum().Single().ToString());
                //hieu.nguyen fix
                //return RedirectToAction("Index", new { id = Session["CurrentUserID"]});
                return RedirectToAction("UploadImages", new { id = idalbum });
            }
            catch (Exception ex)
            {
                return RedirectToAction("Create");
            }
        }

        /// <summary>
        /// Created by Hoang.Nguyen
        /// Created date 11.03.16[yy.mm.dd]
        /// Description:
        /// </summary>
        /// <returns></returns>
        public ActionResult EditInfo(int id)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            Album alb = ctx.GetAlbumByID(id).SingleOrDefault();
            //get album type
            //send album type to view
            return View(alb); 
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditInfo(int id, FormCollection collection)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                Album alb = ctx.Albums.Single(p => p.AlbumID == id);
                alb.UserID = int.Parse(Session["CurrentUserID"].ToString());                
                UpdateModel(alb);
                ctx.SaveChanges();
                return RedirectToAction("Index", new { id = Session["CurrentUserID"] });
            }
            catch (Exception ex)
            {
                return RedirectToAction("EditInfo", new { id = id});
            }            
        }


        //public ActionResult UploadImages(int id)
        //{
        //    try
        //    {
        //        GetAlbumInfoById_Result getAlbumInfo = ctx.GetAlbumInfoById(id).Single();
        //        return View(getAlbumInfo);
        //    }
        //    catch (Exception ex)
        //    {
        //        return RedirectToAction("Index", new { id = Session["CurrentUserID"] });
        //    }  
        //}
        //hieu.create
        public ActionResult UploadImages(int id)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                GetAlbumInfoById_Result getAlbumInfo = ctx.GetAlbumInfoById(id).Single();
                    var viewModel =new AlbumListViewModel();
                viewModel.Album=getAlbumInfo;
                IEnumerable<Photo> photo = ctx.GetPhotoByAlbum(id);
                viewModel.PhotosList = photo.ToList();
                return View(viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Index", new { id = Session["CurrentUserID"] });
            }
        }


        //[HttpPost]
        //public ActionResult UploadFiles(int id, UploadedFileInfo[] files)
        //{
        //    try
        //    {
        //        if (Session["CurrentUserID"] == null)
        //            return RedirectToAction("Index", "Home");
                
        //        int uploadedCount = files.Where(x => x.File.ContentLength > 0).Count();
        //        if (files != null && uploadedCount != 0)
        //        {
        //            foreach (var x in files)
        //            {
        //                CVLK2011.Models.Photo photo = new CVLK2011.Models.Photo();
        //                photo.AlbumID = id;
        //                photo.DateUpload = DateTime.Now;
        //                photo.Description = "";
        //                photo.Status = Utilities.cstNewStatus;
        //                String sFileName = Utilities.GenerateImageName(Request,virtualPath, x.File.FileName, Session["CurrentUserID"].ToString());
        //                photo.PhotoPath = physicalPath + sFileName;
        //                ctx.AddToPhotos(photo);
        //                //string filePath = Path.Combine(HttpContext.Server.MapPath(virtualPath), sFileName);
        //                string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
        //                x.File.SaveAs(filePath);
        //            }
        //        }
        //        ctx.SaveChanges();
        //        ViewData["UploadMessage"]="Bạn đã đăng hình thành công";
        //        //return View("UploadImages", new { id = id });
        //        return RedirectToAction("UploadImages", new { id = id });
        //    }
        //    catch (Exception ex)
        //    {
        //        return RedirectToAction("Details", new { id = id });
        //    }
        //}

           [HttpPost]
        public ActionResult UploadFiles(int id, UploadedFileInfo[] files)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                
                int uploadedCount = files.Where(x => x.File.ContentLength > 0).Count();
                if (files != null && uploadedCount != 0)
                {
                    foreach (var x in files)
                    {
                        CVLK2011.Models.Photo photo = new CVLK2011.Models.Photo();
                        photo.AlbumID = id;
                        photo.DateUpload = DateTime.Now;
                        photo.Description = "";
                        photo.Status = Utilities.cstNewStatus;
                        String sFileName = Utilities.GenerateImageName(Request,virtualPath, x.File.FileName, Session["CurrentUserID"].ToString());
                        string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                        x.File.SaveAs(filePath);
                        photo.PhotoPath = physicalPath + "Thumbs/" + sFileName;
                        photo.PhotoOriginal = physicalPath + sFileName;
                        ctx.AddToPhotos(photo);
                        String fileThumbPath = Path.Combine(Request.MapPath(virtualPath + "Thumbs/"), sFileName);
                        Utilities.MakeImagesForAFile(filePath, fileThumbPath);
                    }
                }
                ctx.SaveChanges();
                ViewData["UploadMessage"]="Bạn đã đăng hình thành công";
                //return View("UploadImages", new { id = id });
                return RedirectToAction("UploadImages", new { id = id });
            }
            catch (Exception ex)
            {
                return RedirectToAction("Details", new { id = id });
            }
        }

        public ActionResult ShowPhoto(int id)
        {
            IEnumerable<Photo> photo = ctx.GetPhotoByAlbum(id);
            return PartialView("ImageResult", photo);
        }

        public ActionResult DeleteImage(int idphoto, int idalbum)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            GetPhotoByID_Result photo = ctx.GetPhotoByID(idphoto).Single<GetPhotoByID_Result>();
            String fileName = photo.PhotoPath;
            String originalFileName=photo.PhotoOriginal;
            int result = ctx.DeletePhoto(idphoto);
            //delete  thumbs file
            Utilities.DeleteFile(Request,virtualPath+"Thumbs/", fileName);
            //delete original file
            Utilities.DeleteFile(Request, virtualPath, originalFileName);
            return RedirectToAction("UploadImages", new { id = idalbum });
        }
    }
}
