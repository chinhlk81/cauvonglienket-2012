using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
namespace CVLK2011.Controllers.Admin
{
    [HandleError]
    public class ConfigValueController : BaseController
    {
        //
        // GET: /ConfigValue/
        DBContainer ctx = new DBContainer();
        int PageSize = 10;
        public ActionResult Index(String currentPage,int page=1)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            IEnumerable<Province> provinces = ctx.Provinces.ToList();
            var model = new ConfigValueViewModel();

            model.provinceList = provinces.Skip((page-1)*PageSize).Take(PageSize).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = provinces.Count() };
            model.CurrentProvince = currentPage;
            IList<Career> careers = ctx.Careers.ToList();
            model.careerList = careers;
            //
            return View(model);
        }
        public ActionResult CreateProvince()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateProvince([Bind(Exclude="ProvinceID")] CVLK2011.Models.Province province, FormCollection collection)
        {
             if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
             Province pr = ctx.GetProvinceByName(province.ProvinceName).SingleOrDefault();
             if (pr != null)
             {
                 ViewData["CreateMessage"] = "Đã tồn tại tỉnh thành trong danh sách!";
                 return PartialView("CreateCareer");
             }
             ctx.AddToProvinces(province);
             ctx.SaveChanges();
             ViewData["CreateMessage"] = "Đã lưu thành công!";
             return PartialView("CreateCareer");

        }
        public ActionResult CreateCareer()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateCareer([Bind(Exclude = "CareerID")] CVLK2011.Models.Career career, FormCollection collection)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
           Career caree=ctx.GetCareerByName(career.CareerName).SingleOrDefault();
           if (caree!=null)
           {
               ViewData["CreateMessage"] = "Đã tồn tại ngành nghề trong danh sách!";
               return View();
           }
            ctx.AddToCareers(career);
            ctx.SaveChanges();
            ViewData["CreateMessage"] = "Đã lưu thành công!";
            return View();

        }

        public ActionResult DeleteProvince(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            ctx.DeleteProvince(id);
            return RedirectToAction("Index");
        }
        public ActionResult DeleteCareer(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            ctx.DeleteCareer(id);
            return RedirectToAction("Index");
        }
    }
}
