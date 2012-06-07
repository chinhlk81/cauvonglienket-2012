using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using CVLK2011.Models;
using System.Web.Routing;
namespace CVLK2011.Controllers.Admin
{
    [HandleError]
    public class AdminHomeController : BaseController
    {
        public int PageSize = 10;
        //
        // GET: /AdminHome/
        DBContainer ctx = new DBContainer();
        public ActionResult Index(string gender, string currentUser, int page = 1)
        {
           
            if(!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            try
            {
                IEnumerable<GetAllUsers_Result> user = null;
                if (String.IsNullOrEmpty(gender))
                    user = ctx.GetAllUsersHaveBirthdayInCurrentMonth().ToList();
                else
                    user = ctx.GetAllUsersHaveBirthdayInCurrentMonth().Where(p => p.UserGender == gender).ToList();
                var viewModel = new AdminHomeModel();
                viewModel.Filter = gender;
                viewModel.UserList = user.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = user.Count() };
                viewModel.CurrentUser = currentUser;
               
                
                return View(viewModel);
            }
            catch
            {
                return RedirectToAction("Error");
            }
        }
        
        public ActionResult LogOn()
        {
            Models.Admin adm = new Models.Admin();
            return View(adm);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult LogOn( FormCollection collection)
        {
            try
            {
                EnCrypto encrypto = new EnCrypto();
                String userName =collection[0].ToString();
                String password = collection[1].ToString();
                if(String.IsNullOrWhiteSpace(userName))
                    return RedirectToAction("LogOn", "AdminHome");
                Models.Admin adm = ctx.GetAdminByName(userName).SingleOrDefault(p=>p.UserName==userName);
                if (adm != null)
                {
                    if (adm.Type == "Admin")
                    {
                      string a=  encrypto.Decrypt(adm.Password);
                        if (adm.Password == encrypto.Encrypt(password))
                        {
                            Session["Admin"] = adm.AdminID;
                            Session["Type"] = adm.Type;
                            adm.PCIP = GetCookie();
                            ctx.SaveChanges();
                            return Redirect("Index");
                        }
                        else
                        {
                            Session["Admin"] = null;
                            Session["Type"] = null;
                            ViewData["LogOnMessage"] = "Mật khẩu không chính xác!";
                            return View();
                        }
                    }
                    else
                    {
                        if (adm.AllowLogOn)
                        {
                            if (adm.Password == encrypto.Encrypt(password))
                            {
                                Session["Admin"] = adm.AdminID;
                                Session["Type"] = adm.Type;
                                adm.PCIP = GetCookie();
                                ctx.SaveChanges();
                                return Redirect("Index");
                            }
                            else
                            {
                                Session["Admin"] = null;
                                Session["Type"] = null;
                                ViewData["LogOnMessage"] = "Mật khẩu không chính xác!";
                                return View();
                            }
                        }
                        else
                        {
                            ViewData["LogOnMessage"]="Hiện tại bạn không có quyền đăng nhập hệ thống!";
                            return View();
                        }
                    }
                    
                }
                else
                {
                    ViewData["LogOnMessage"] = "Người dùng không tồn tại!";
                    return View();
                }
                //return View();
            } catch (Exception ex)
            {
                ViewData["LogOnMessage"] = ex.Message;
                return View();
            }
        }
        public ActionResult Logout()
        {
            Session["Admin"] = null;
            Session["Type"] = null;
            Server.ClearError();
            return RedirectToAction("LogOn", "AdminHome");
        }
        
    }
}
