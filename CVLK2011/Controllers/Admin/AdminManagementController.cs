using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
using System.Web.Routing;
namespace CVLK2011.Controllers.Admin
{
    [HandleError]
    public class AdminManagementController : BaseController
    {
        //
        // GET: /AdminManagerment/
        DBContainer ctx = new DBContainer();
        public int PageSize = 10;
        #region--Admin--
        public ActionResult Index()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            IEnumerable<Models.Admin> admin = ctx.Admins.ToList<Models.Admin>();
            return View(admin);
          
        }

        //
        // GET: /AdminManagerment/Details/5

        public ActionResult Details(int id)
        {
            try
           {
               if (!IsAuthenticateAdmin())
                   return RedirectToAction("LogOn", "AdminHome");
                Models.Admin adm = ctx.Admins.Single(p => p.AdminID == id);
                if (adm != null)
                    return View(adm);
                return View();
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AdminManagerment/Create

        public ActionResult Create()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            CVLK2011.Models.Admin admin = new Models.Admin();
            return View(admin);
        } 

        //
        // POST: /AdminManagerment/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Exclude="AdminID")] CVLK2011.Models.Admin adm, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<Models.Admin> existAdmin = ctx.GetAdminByName(adm.UserName).ToList();
                String Password=collection["Password"].ToString();
                String confirmPassword = collection["ConfirmPassword"].ToString();
                if (Password != confirmPassword)
                {
                    ViewData["AdminMessage"]= "không trùng password";
                    return View();
                }
                if (existAdmin.Count()==0)
                {
                    EnCrypto enc = new EnCrypto();
                    adm.Password = enc.Encrypt(adm.Password);
                    adm.AllowLogOn = true;
                    ctx.AddToAdmins(adm);
                    ctx.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewData["AdminMessage"]= "Đã tồn tại tên đăng nhập";
                    return View();

                }
            }
            catch
            {
                return View("Create");
            }
        }
        
        //
        // GET: /AdminManagerment/Edit/5
 
        public ActionResult Edit(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            Models.Admin adm = ctx.Admins.Single(p => p.AdminID == id);
            return View(adm);
        }

        //
        // POST: /AdminManagerment/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
             try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                String description = collection["Description"].ToString();
                 String type=collection["Type"].ToString();
                Models.Admin adm = ctx.Admins.Single(ad => ad.AdminID == id);
                if (adm != null)
                {
                    
                    adm.Type = type;
                    adm.Description = description;
                    if (adm.Type != "Admin")
                    {
                        String allowLogOn = collection["AllowLogOn"].ToString();
                        if (allowLogOn.StartsWith("true"))
                            adm.AllowLogOn = true;
                        else
                            adm.AllowLogOn = false;
                    }
                    ctx.SaveChanges();
                    ViewData["Password"] = "Cập nhật thành công";
                }
                return RedirectToAction("Edit", new { id = id });
            }
            catch
             { 
                return RedirectToAction("Index");
             }
        }
        //allow Log On
        public void AllowLogOn(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return;
                Models.Admin adm = ctx.Admins.SingleOrDefault(p => p.AdminID == id);
                if (adm.AllowLogOn)
                    adm.AllowLogOn = false;
                else
                    adm.AllowLogOn = true;
                ctx.SaveChanges();


            }
            catch
            {
                return;
            }
        }
        //active,deactivate logon
        public ActionResult ActiveConsultants()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<Models.Admin> adms = ctx.Admins.Where(p => p.Type != "Admin").ToList();
                foreach (var item in adms)
                {
                    item.AllowLogOn = true;
                    ctx.SaveChanges();
                }
                return RedirectToAction("Index");

            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        //deactive
        public ActionResult DeactivateConsultants()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<Models.Admin> adms = ctx.Admins.Where(p => p.Type != "Admin").ToList();
                foreach (var item in adms)
                {
                    item.AllowLogOn = false;
                    ctx.SaveChanges();
                }
                return RedirectToAction("Index");

            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        public ActionResult UCAdminPassword()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChangePassword(int id, FormCollection collection)
        {
            var urlHelper = new UrlHelper(HttpContext.Request.RequestContext);
            string urlcatch = urlHelper.Action("LogOn", "AdminHome");
            try
            {
                if (!IsAuthenticateAdmin())
                    return Redirect(urlcatch);
                Models.Admin adm = ctx.Admins.Single(ad => ad.AdminID == id);
                if (String.IsNullOrWhiteSpace(collection["Password"].ToString()))
                {
                    ViewData["Password"] = "Nhập mật khẩu";
                    return PartialView("Edit", adm);
                }
                EnCrypto encpt = new EnCrypto();
                String oldPassword = collection["OldPassWord"].ToString();
                String newPassword = collection["Password"].ToString();

                if (adm != null)
                {
                    if (encpt.Encrypt(oldPassword) == adm.Password)
                    {
                        adm.Password = encpt.Encrypt(newPassword);
                        ctx.SaveChanges();
                        ViewData["Password"] = "Đã thay đổi mật khẩu";
                        return PartialView("Edit", adm);
                    }
                    else
                    {
                        ViewData["Password"] = "Mật khẩu cũ không chính xác";
                        return PartialView("Edit", adm);
                    }
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
      
       //
        // GET: /AdminManagerment/Delete/5

        public ActionResult Delete(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Models.Admin adm = ctx.Admins.Single(p => p.AdminID == id);
                ctx.DeleteObject(adm);
                ctx.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
       
        //
        // POST: /AdminManagerment/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AdminManagerment/Delete/5
        #endregion
        #region--Menu Config
        public ActionResult MenuIndex(String currentMenu, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<MenuConfig> mconfig = ctx.GetAllMenuConfig().ToList();
                var viewModel = new MenuConfigsListViewModel();
                viewModel.MenuConfigsList = mconfig.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = mconfig.Count() };
                viewModel.CurrentMenuConfigs = currentMenu;
                return View(viewModel);
            }
            catch 
            {
                return View();
            }
        }

        public ActionResult MenuDetail(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                MenuConfig mconfig = ctx.GetMenuConfigByID(id).Single(p => p.MenuConfigID == id);
                return View(mconfig);
            }
            catch
            {
                return View();

            }
        }

        public ActionResult MenuUpdate(int id)
        {
            MenuConfig mconfig = ctx.GetMenuConfigByID(id).Single(p => p.MenuConfigID == id);
            return View(mconfig);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult MenuUpdate(int id, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                MenuConfig mconfig = ctx.GetMenuConfigByID(id).Single(p => p.MenuConfigID == id);
                mconfig.Contents = collection["FckEditor1"].ToString();
                mconfig.MenuConfigName = collection["MenuConfigName"].ToString();
               // UpdateModel(mconfig);
                ctx.SaveChanges();
                return RedirectToAction("MenuIndex");
            }
            catch (Exception ex)
            {
                return View();
            }
        }

        public ActionResult MenuCreate()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            Models.MenuConfig mconfig = new MenuConfig();
            return View(mconfig);
        }
        //
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult MenuCreate(Models.MenuConfig mconfig, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                mconfig.Contents = collection["FckEditor1"].ToString();
                ctx.AddToMenuConfigs(mconfig);
                ctx.SaveChanges();
                return RedirectToAction("MenuIndex");
            }
            catch
            {
                return View();
            }
        }
        //delete 
        public ActionResult DeleteMenu(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Models.MenuConfig mconfig = ctx.MenuConfigs.Single(p => p.MenuConfigID == id);
                ctx.DeleteObject(mconfig);
                ctx.SaveChanges();
                return RedirectToAction("MenuIndex");
            }
            catch
            {
                return View();
            }
        }
        #endregion

    }
}
