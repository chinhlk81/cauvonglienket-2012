using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;

namespace CVLK2011.Controllers.Member
{
    public class MemberVideoController : BaseController
    {
        //
        // GET: /MemberVideo/

        Models.DBContainer ctx = new Models.DBContainer();
        public int PageSize = 12;
        public ActionResult Index(string category, int page = 1)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            int id = 0;
            Int32.TryParse(Session["CurrentUserID"].ToString(), out id);
            Session["GuestUserID"] = id;
            IEnumerable<VIPVideo> getvideo = ctx.GetShareVideo(id).ToList();
          
            var viewModel = new CVLK2011.Models.MemberShareVideoViewModel();
            viewModel.VideoList = getvideo.Skip((page - 1) * PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = getvideo.Count() };
            viewModel.CurrentVideo = category;
            //get link video
            foreach (var item in viewModel.VideoList)
            { 
                GetUserByID_Result us = ctx.GetUserByID(item.UserID).SingleOrDefault();
                if(us!=null)
                item.VideoLink = us.UserVideoUpload;
            }
          
            return View(viewModel);            
        }
        public ActionResult Details(int id)
        {
            try
            {
                //if (Session["CurrentUserID"] == null)
                //return RedirectToAction("Index", "Home");
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
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                int result = ctx.DeleteVIPVideo(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
