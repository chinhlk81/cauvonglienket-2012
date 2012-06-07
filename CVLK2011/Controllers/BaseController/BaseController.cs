using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
using System.IO;
namespace CVLK2011.Controllers
{
    public class BaseController: Controller
    {
        protected override RedirectResult Redirect(string url)
        {
            return new AjaxAwareRedirectResult(url);
        }
        public class AjaxAwareRedirectResult : RedirectResult
        {
            public AjaxAwareRedirectResult(string url)
                : base(url)
            {
            }

            public override void ExecuteResult(ControllerContext context)
            {
                if (context.RequestContext.HttpContext.Request.IsAjaxRequest())
                {
                    string destinationUrl = UrlHelper.GenerateContentUrl(Url, context.HttpContext);

                    JavaScriptResult result = new JavaScriptResult()
                    {
                        Script = "window.location='" + destinationUrl + "';"
                    };
                    result.ExecuteResult(context);
                }
                else
                    base.ExecuteResult(context);
            }
        }
        public bool IsAuthenticateAdmin()
        {
            if (Session["Admin"]==null)
                return false;
            int adminID = 0;
            Int32.TryParse(Session["Admin"].ToString(), out adminID);
            DBContainer ctx = new DBContainer();
            Models.Admin adm = ctx.Admins.SingleOrDefault(p => p.AdminID == adminID);

            if (adm.PCIP.Equals(GetCookie()))
                return true;
            return false;

        }
        public string GetCookie()
        {
            //return HttpContext.Request.ServerVariables["ASP.NET_SessionId"];
            String cookie=HttpContext.Request.ServerVariables["HTTP_COOKIE"];
            if (cookie.Contains("ASP.NET_SessionId"))
            {
                int index =cookie.IndexOf("ASP.NET_SessionId");
                //int lenght=cookie.Substring(0,index).Length;
                return cookie.Substring(index,cookie.Length-(index));
            }
           return HttpContext.Request.ServerVariables["HTTP_COOKIE"];
        }
        public static String GenerateFileNameByNo(HttpRequestBase requestBase, String virtualPath, String fileName, String No)
        {

            FileInfo fileInfo = new FileInfo(fileName);
            //get extension file
            String extension = fileInfo.Extension;
            //gen name with user id
            fileName = No;
            String sFileName = fileName + extension;
            int file_append = 0;
            while (System.IO.File.Exists(Path.Combine(requestBase.MapPath(virtualPath + "/" + sFileName))))
            {
                file_append++;
                sFileName = fileName + file_append.ToString() + extension;
            }
            return sFileName;
        }
        // Delete file
        public static void DeleteFile(HttpRequestBase requestBase, String virtualPath, String fileName)
        {
            String Name = System.IO.Path.GetFileName(fileName);
            String virtualFullPath = virtualPath + "/" + Name;
            String filePath = Path.Combine(requestBase.MapPath(virtualFullPath));
            FileInfo info = new FileInfo(filePath);
            if (info.Exists)
                info.Delete();
        }
    }
}