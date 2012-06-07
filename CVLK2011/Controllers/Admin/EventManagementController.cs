using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;

namespace CVLK2011.Controllers.Admin
{
    [HandleError]
    public class EventManagementController : BaseController
    {
        //
        // GET: /QuanLyEvent/
        private const string virtualPath = "~/Images/Events/";
        private const string virtualPathMusic = "~/Content/Music/Events/";
        string physicalPath = "../../Images/Events/";
        string physicalPathMusic = "../../../Content/Music/Events/";
        Models.DBContainer ctx = new Models.DBContainer();
        public int PageSize = 20;

        public ActionResult Index(string category, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<Event> getAllEvent = ctx.GetAllEvents().ToList();
                var viewModel = new CVLK2011.Models.EventsListViewModel();
                viewModel.Products = getAllEvent.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = getAllEvent.Count() };
                viewModel.CurrentCategory = category;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                CVLK2011.Models.Event e = new Models.Event();
                IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
                ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName");
                return View(e);
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
                Event result = ctx.GetEventByID(id).Single<Event>();
                return View(result);
            }
            catch
            {
                return View();
            }
        }

        //
        public ActionResult Edit(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<GetNIdEventParents_Result> result = ctx.GetNIdEventParents().ToList();
                ViewData["EventParents"] = new SelectList(result, "EventParentID", "EventParentName");
                Event eve = ctx.GetEventByID(id).Single();
                return View(eve);
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection, HttpPostedFileBase uploadFile, UploadedFileInfo[] files, HttpPostedFileBase uploadFileMusic)
        {            
            try
            {
                //hieu.nguyen fix
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Event eve = ctx.Events.Single(p => p.EventID == id);
                eve.EventContent = collection["FckEditor1"].ToString();
                eve.EventAgeJoint = collection["EventAgeJoint"].ToString();
                eve.EventDate = Convert.ToDateTime(collection["eventDay2"].ToString());
                eve.EventLocation = collection["EventLocation"].ToString();
                eve.EventName = collection["EventName"].ToString();
                eve.FK_EventParentID = Convert.ToInt32(collection["eventParents"].ToString());
                eve.EventTime = collection["EventTime"].ToString();
                eve.Description = collection["Description"].ToString();
                //String typical= collection["editTypical"].ToString();
                String typical = collection["IsTypical"].ToString();
                if (typical.StartsWith("true"))
                    eve.IsTypical = true;
                else
                    eve.IsTypical = false;
                String oldName = String.Empty;
                //uload image present
                if (uploadFile != null)
                {
                    oldName = eve.EventImages;
                    var fileName = Path.GetFileName(uploadFile.FileName);
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath, fileName, Session["Admin"].ToString());
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    uploadFile.SaveAs(filePath);
                    eve.EventImages = physicalPath + sFileName;
                    
                }
                //upload bg music.
                if (uploadFileMusic != null)
                {
                    var fileName = Path.GetFileName(uploadFileMusic.FileName);
                    //String sFileName = GenerateFileNameByNo(Request, virtualPathMusic, fileName, "EV" + eve.EventName);
                    string filePath = Path.Combine(Request.MapPath(virtualPathMusic), fileName);//sFileName);
                    uploadFileMusic.SaveAs(filePath);
                    eve.EventMusic = physicalPathMusic + fileName;//sFileName;
                }
                //updaload album
               
                int uploadedCount = files.Where(x => x.File.ContentLength > 0).Count();
               // if (files != null && uploadedCount != 0)
                if(files!=null)
                {
                     if(files[1].File.ContentLength>0){
                    //get album information by id
                    //get userid
                    //check album is dummy
                    //create album and upload image
                    //or upload image
                    Album alb = ctx.GetAlbumByID(eve.FK_AlbumID).SingleOrDefault();
                    int? albID = eve.FK_AlbumID;
                    if (alb.Status == "Dummy")
                    {
                        Album newalb = new Album();
                        newalb.AlbumDate = DateTime.Now;
                        newalb.AlbumName = eve.EventName;
                        newalb.Status =Utilities.cstApprove;
                        newalb.UserID = Utilities.IDefaultUser;
                        newalb.AlbumType = "Event";
                        newalb.Description = "Album của sự kiện "+eve.EventName;
                        ctx.AddToAlbums(newalb);
                        ctx.SaveChanges();
                        albID = ctx.GetMaxIDAlbum().Single();
                        //update album id in event
                        eve.FK_AlbumID = albID;
                    }
                    foreach (var x in files)
                    {
                        if(x.Name=="file1"){
                        CVLK2011.Models.Photo photo = new CVLK2011.Models.Photo();
                        photo.AlbumID = int.Parse(albID.ToString());
                        photo.DateUpload = DateTime.Now;
                        photo.Description = "";
                        photo.Status =Utilities.cstApprove;
                        String sFileName = Utilities.GenerateImageName(Request, "~/Content/Images", x.File.FileName, Session["Admin"].ToString());
                        string filePath = Path.Combine(Request.MapPath("~/Content/Images"), sFileName);
                        x.File.SaveAs(filePath);
                        photo.PhotoPath = "../../../Content/Images/Thumbs/" + sFileName;
                        photo.PhotoOriginal = "../../../Content/Images/" + sFileName;
                        ctx.AddToPhotos(photo);
                        String fileThumbPath = Path.Combine(Request.MapPath("~/Content/Images/Thumbs/"), sFileName);
                        Utilities.MakeImagesForAFile(filePath, fileThumbPath);
                    }}
                }
  
                }
                ctx.SaveChanges();
                if (!string.IsNullOrEmpty(oldName))
                    Utilities.DeleteFile(Request, virtualPath, oldName);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("Index");
            }            
        }
        // check Event Typical
        public void CheckTypical(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return;
                Event eve = ctx.Events.Single(p => p.EventID == id);
                if (eve.IsTypical)
                    eve.IsTypical = false;
                else
                    eve.IsTypical = true;
                ctx.SaveChanges();
                

            }
            catch
            {
                return ;
            }
        }
        //
        public ActionResult Delete(int? id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Event ev = ctx.GetEventByID(id).FirstOrDefault();
                string evfile = ev.EventImages;
                int result = ctx.DeleteEvent(id);
                Utilities.DeleteFile(Request, virtualPath, evfile);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return Redirect("Index");
            }
        }
        //
        // POST: /Default1/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Exclude = "EventID")] CVLK2011.Models.Event eve, FormCollection collection, HttpPostedFileBase uploadFile, HttpPostedFileBase uploadFileMusic)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int idAlbum = int.Parse(ctx.GetDefaultAlbumID().Single().ToString());
                eve.EventDate = Convert.ToDateTime(collection["eventDay"]);
                //eve.EventDate = DateTime.Parse(eve.EventTime);
                eve.Datepost = DateTime.Today;
                eve.Status =Utilities.cstVisible;
                eve.EventContent = collection["FckEditor1"].ToString();
                eve.FK_EventParentID = int.Parse(collection["eventParents"].ToString());
                eve.FK_AlbumID = idAlbum;
                String typical = collection["IsTypical"].ToString();
                if (typical.StartsWith("true"))
                    eve.IsTypical = true;
                else
                    eve.IsTypical = false;
                eve.EventImages = "";
                if (uploadFile != null)
                {
                    var fileName = Path.GetFileName(uploadFile.FileName);
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath, fileName, Session["Admin"].ToString());
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    uploadFile.SaveAs(filePath);
                    eve.EventImages = physicalPath + sFileName;
                }
                if (uploadFileMusic != null)
                {
                    var fileName = Path.GetFileName(uploadFileMusic.FileName);
                    String sFileName = GenerateFileNameByNo(Request, virtualPath, fileName, "EV"+ eve.EventName);
                    string filePath = Path.Combine(Request.MapPath(virtualPathMusic), sFileName);
                    uploadFileMusic.SaveAs(filePath);
                    eve.EventMusic = physicalPathMusic + sFileName;
                }
                ctx.AddToEvents(eve);
                ctx.SaveChanges();

                return Redirect("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("Create");
            }
        }        
    }
}
