using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using CVLK2011.Models;
using System.IO;

namespace CVLK2011
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               "Admin", // Route name
               "Admin/AdminHome/{action}/{id}", // URL with parameters
               new { controller = "AdminHome", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
              "EventManagement",//"QuanLyEvent", // Route name
              "Admin/EventManagement/{action}/{id}", // URL with parameters
              new { controller = "EventManagement", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "AdvertisingManagement", // Route name
              "Admin/AdvertisingManagement/{action}/{id}", // URL with parameters
              new { controller = "AdvertisingManagement", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "GiftsManagement", // Route name
              "Admin/GiftsManagement/{action}/{id}", // URL with parameters
              new { controller = "GiftsManagement", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "MembersManagement", // Route name
              "Admin/MembersManagement/{action}/{id}", // URL with parameters
              new { controller = "MembersManagement", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "PhotoAlbumManagement", // Route name
              "Admin/PhotoAlbumManagement/{action}/{id}", // URL with parameters
              new { controller = "PhotoAlbumManagement", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "MemberBlog", // Route name
              "Member/MemberBlog/{action}/{id}", // URL with parameters
              new { controller = "MemberBlog", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "MemberFriends", // Route name
              "Member/MemberFriends/{action}/{id}", // URL with parameters
              new { controller = "MemberFriends", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "MemberMessage", // Route name
              "Member/MemberMessage/{action}/{id}", // URL with parameters
              new { controller = "MemberMessage", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "MemberPhoto", // Route name
              "Member/MemberPhoto/{action}/{id}", // URL with parameters
              new { controller = "MemberPhoto", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
              "MemberProfile", // Route name
              "Member/MemberProfile/{action}/{id}", // URL with parameters
              new { controller = "MemberProfile", action = UrlParameter.Optional, id = UrlParameter.Optional } // Parameter defaults
          );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );
            //        routes.MapRoute(
            //"404-PageNotFound",
            //"{controller}/{action}/{id}",
            //new { controller = "Home", action = "Error",id=UrlParameter.Optional }
            //);


        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);

            ModelBinders.Binders[typeof(UploadedFileInfo[])] = new UploadedFileInfoArrayBinder();
            //hieu.nguyen
            Utilities utili = new Utilities();
            if (!File.Exists(Server.MapPath("VisisCounter.txt")))
                File.WriteAllText(Server.MapPath("VisisCounter.txt"), "0");
            Application["Visited"] = int.Parse(File.ReadAllText(Server.MapPath("VisisCounter.txt")));
        }
        protected void Session_End()
        {
            Application["Visiting"] = (int)Application["Visiting"] - 1;
        }
        protected void Session_Start()
        {
            if (Application["Visiting"] == null)
                Application["Visiting"] = 1;
            else
                Application["Visiting"] = (int)Application["Visiting"] + 1;
            // Tăng số đã truy cập lên 1 nếu có khách truy cập
            Application["Visited"] = (int)Application["Visited"] + 1;
            File.WriteAllText(Server.MapPath("VisisCounter.txt"), Application["Visited"].ToString());
        }
        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception ex = Server.GetLastError();
            //if (ex is HttpException)
            //{
            //   int errorcode= ((HttpException)(ex)).GetHttpCode();
            //    if (((HttpException)(ex)).GetHttpCode() == 404)
            //         HttpContext.Current.Response.Redirect("Error.aspx");
            //}
            // Code that runs when an unhandled error occurs
           // HttpContext.Current.Response.Redirect("Error.aspx");
           // HttpContext.Current.Response.Redirect("SiteError.html");
            //Server.Transfer("Error.aspx");
            Exception ex = Server.GetLastError();  
            Application[HttpContext.Current.Request.UserHostAddress.ToString()] = ex;  


            
        }
    }
}