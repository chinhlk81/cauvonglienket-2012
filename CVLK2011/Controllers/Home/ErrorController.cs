using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CVLK2011.Controllers.Home
{
    public class ErrorController : BaseController
    {
        //
        // GET: /Error/

        public ActionResult Index()
        {
            return View();
        }
      public ActionResult HttpError()  
         {  
            Exception ex = null;  
             try  
            {  
                ex = (Exception)HttpContext.Application[Request.UserHostAddress.ToString()];  
            }  
            catch  
            {  
            }  
   
            if (ex != null)  
            {  
                ViewData["Description"] = ex.Message;  
            }  
            else  
            {  
                ViewData["Description"] = "An error occurred.";  
            }  
   
            ViewData["Title"] = "Oops. We're sorry. An error occurred and we're on the case.";  
            return View("Error");  
     }  
         public ActionResult Http404()  
         {  
            ViewData["Title"] = "The page you requested was not found";  
             return View("Error");  
        }  
    }
}
