using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
namespace CVLK2011.Controllers.Admin
{
    public class VideoShareManagementController : BaseController
    {
        //
        // GET: /VideoShareManagement/

        Models.DBContainer ctx = new Models.DBContainer();
        public int PageSize = 12;
        public ActionResult Index(string category, int page = 1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");            
            IEnumerable<VIPVideo> getvideo = ctx.GetAllShareVideo().ToList();
            var viewModel = new CVLK2011.Models.AllVideoShare();
            viewModel.VideoList = getvideo.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = getvideo.Count() };
            viewModel.CurrentVideo = category;
           
            return View(viewModel);
        }
        public ActionResult Details(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetUserByID_Result us = ctx.GetUserByID(id).SingleOrDefault();
                return PartialView("ShowVideo", us);
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Delete(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int result = ctx.DeleteVIPVideo(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ProcessUploadVideo(HttpPostedFileBase videoUpload, FormCollection frmcollection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int idUser = 0;
                Int32.TryParse(frmcollection["id"], out idUser);

                String fileName = Path.GetFileName(videoUpload.FileName);
                var filePath = Path.Combine(Request.MapPath("~/Content/Videos"), fileName);
                videoUpload.SaveAs(filePath);
                User us = ctx.Users.Single(p => p.UserID == idUser);
                us.UserVideoUpload = "../../../Content/Videos/" + fileName;
                ctx.SaveChanges();                
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }

    }
}
