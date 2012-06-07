using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;

namespace CVLK2011.Controllers.Admin
{
    public class PhotoAlbumManagementController : BaseController
    {
        //
        // GET: /QuanLyThuVienAnh/
        Models.DBContainer ctx = new Models.DBContainer();
        public int PageSize = 20;
        const string virtualPath = "~/Content/Images/";
        const string physicalPath = "../../../Content/Images/";
        public ActionResult Index(string userID, string albumType, string status, string category, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            InitAlbumDropdownlist();
            if (albumType == null) albumType = string.Empty;
            if (status == null) status = string.Empty;
            IEnumerable < GetAlbumInfo_Result > getAlbumInfo;

            int iUserID = 0;
            Int32.TryParse(userID, out iUserID);
            
            getAlbumInfo = ctx.Admin_FilterForAlbums(iUserID, albumType, status).ToList();

            var viewModel = new CVLK2011.Models.AlbumListViewModel();
            viewModel.albumStatusFilter = status;
            viewModel.albumTypeFilter = albumType;
            viewModel.albumUserFilter = iUserID;
            viewModel.Products = getAlbumInfo.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = getAlbumInfo.Count() };
            viewModel.CurrentCategory = category;
            return View(viewModel);
        }
        private ActionResult InitAlbumDropdownlist()
        {
            var configValues = from cfv in ctx.ConfigValues
                               where cfv.ConfigKeyGroup == "Albums"
                               orderby cfv.ConfigText ascending
                               select cfv;
            IEnumerable<SelectListItem> albumStatusItems = configValues.Select(
                items => new SelectListItem
                {
                    Value = items.ConfigKeyValue,
                    Text = items.ConfigText
                });
            ViewData["AlbumStatus"] = albumStatusItems;
            return PartialView("Index", ViewData["AlbumStatus"]);
        }
        public ActionResult FilterAlbums(string userID, string albumType, string albumStatus, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            
            string category = string.Empty;
            int iUserID = 0;
            Int32.TryParse(userID, out iUserID);
            IEnumerable<GetAlbumInfo_Result> getAlbumInfo = ctx.Admin_FilterForAlbums(iUserID, albumType, albumStatus).ToList();

            var viewModel = new CVLK2011.Models.AlbumListViewModel();
            viewModel.albumStatusFilter = albumStatus;
            viewModel.albumTypeFilter = albumType;
            viewModel.albumUserFilter = iUserID;
            viewModel.Products = getAlbumInfo.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = getAlbumInfo.Count() };
            viewModel.CurrentCategory = category;
            return PartialView("UCAlbums", viewModel);
        }
        //create
        public ActionResult Create()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                CVLK2011.Models.Album alb = new Models.Album();

                return View(alb);
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult Details(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ImageResult();
                GetAlbumInfoById_Result albumInfo = ctx.GetAlbumInfoById(id).Single();
               //hieu fixed
                // ShowPhoto(getAlbumInfo.AlbumID); 
                IEnumerable<Photo> photo = ctx.GetPhotoByAlbum(id);
                var viewModel = new AlbumListViewModel();
                viewModel.Album = albumInfo;
                viewModel.PhotosList = photo.ToList();
                return View(viewModel); 
            }
            catch (Exception ex)
            {
                return Redirect("Index");
            }                       
        }
        public ActionResult ImageResult()
        {
            return View();
        }
        //
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "AlbumID")]CVLK2011.Models.Album alb, FormCollection colection)
        {            
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                alb.AlbumDate = DateTime.Now;         
                alb.Status = Utilities.cstApprove;
                alb.UserID = Utilities.IDefaultUser;
                ctx.AddToAlbums(alb);
                ctx.SaveChanges();
                int idalbum = int.Parse(ctx.GetMaxIDAlbum().Single().ToString());
                return RedirectToAction("Details", new { id = idalbum});
            }
            catch (Exception ex)
            {
                return RedirectToAction("Create");
            }
        }

        public ActionResult Delete(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int result = ctx.DeleteAlbum(id);
                int result2 = ctx.DeletePhotoByAlbum(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Edit(int id)
        {
            try
            {
                Album alb = ctx.GetAlbumByID(id).Single();

                IEnumerable<GetAlbumStatus_Result> status = ctx.GetAlbumStatus().ToList();
                ViewData["AlbumStatus"] = new SelectList(status, "ConfigKey", "ConfigText");
                IEnumerable<GetUserName_Result> username = ctx.GetUserName().ToList();
                ViewData["UserName"] = new SelectList(username, "UserID", "UserFullName", alb.Status);
                return View(alb);
            }
            catch
            {
                return View();
            }
        }

        public ActionResult ShowPhoto(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<Photo> photo = ctx.GetPhotoByAlbum(id);
                return PartialView("ImageResult", photo);
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult UploadImage(int id, UploadedFileInfo[] files)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int uploadedCount = files.Where(x => x.File.ContentLength > 0).Count(); 
                if (files != null && uploadedCount!=0)
                {                    
                    foreach (var x in files)
                    {
                        CVLK2011.Models.Photo photo = new CVLK2011.Models.Photo();
                        photo.AlbumID = id;
                        photo.DateUpload = DateTime.Now;
                        photo.Description = "";
                        photo.Status = Utilities.cstApprove;// "Visible";
                        String sFileName = Utilities.GenerateImageName(Request, virtualPath, x.File.FileName, Session["Admin"].ToString());
                        //photo.PhotoPath = physicalPath + sFileName;
                        //photo.PhotoPath = "../../../Content/Images/" + x.File.FileName;
                       // ctx.AddToPhotos(photo);
                       // string filePath = Path.Combine(HttpContext.Server.MapPath("../../../Content/Images"), Path.GetFileName(x.File.FileName)); 
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
                return RedirectToAction("Details", new { id = id });
            }
            catch (Exception ex)
            {
                return RedirectToAction("Details", new { id = id });
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Album alb = ctx.Albums.Single(p => p.AlbumID == id);
               // alb.UserID = int.Parse(collection["username"].ToString());
                alb.Status = collection["albumstatus"].ToString();
                UpdateModel(alb);
                ctx.SaveChanges();                
                return RedirectToAction("Details", new { id = id });
            }
            catch (Exception ex)
            {
                return RedirectToAction("Index");
            }
        }

        public ActionResult DeleteImage(int idphoto, int idalbum)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            GetPhotoByID_Result photo = ctx.GetPhotoByID(idphoto).Single<GetPhotoByID_Result>();
            String fileName = photo.PhotoPath;
            String originalFileName = photo.PhotoOriginal;
            int result = ctx.DeletePhoto(idphoto);
            //delete  thumbs file
            Utilities.DeleteFile(Request, virtualPath + "Thumbs/", fileName);
            //delete original file
            Utilities.DeleteFile(Request, virtualPath, originalFileName);
            return RedirectToAction("Details", new { id = idalbum });
        }

        public void CheckTypical(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return;
                Photo photo = ctx.Photos.Single(p => p.PhotoID == id);
                if (photo.IsTypical)
                    photo.IsTypical = false;
                else
                {
                    photo.IsTypical = true;
                    Album album = ctx.Albums.Single(al => al.AlbumID == photo.AlbumID);
                    album.AlbumImgTitle = photo.PhotoPath;
                }
                    
                ctx.SaveChanges();


            }
            catch (InvalidOperationException ie)
            {
                return;
            }
            
        }
    }
}
