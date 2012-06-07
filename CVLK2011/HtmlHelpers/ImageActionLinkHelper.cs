using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using CVLK2011.Models;
namespace CVLK2011.HtmlHelpers
{
    public static class ImageActionLinkHelper
    {
        public static string ImageActionLink(this AjaxHelper helper, string imageUrl, string altText, string actionName, object routeValues, AjaxOptions ajaxOptions)
        {
            var builder = new TagBuilder("img");
            builder.MergeAttribute("src", imageUrl);
            builder.MergeAttribute("alt", altText);
            string link = helper.ActionLink("[replaceme]", actionName, routeValues, ajaxOptions).ToString();
            return link.Replace("[replaceme]", builder.ToString(TagRenderMode.SelfClosing));
        }

        public static string ImageActionLink(this AjaxHelper helper, string imageUrl, string altText, string actionName, AjaxOptions ajaxOptions)
        {
            var builder = new TagBuilder("img");
            builder.MergeAttribute("src", imageUrl);
            builder.MergeAttribute("alt", altText);
            string link = helper.ActionLink("[replaceme]", actionName, ajaxOptions).ToString();
            return link.Replace("[replaceme]", builder.ToString(TagRenderMode.SelfClosing));
        }
        public static string ImageActionLink(this AjaxHelper helper, string imageUrl, string altText, string actionName,object width,object height, AjaxOptions ajaxOptions)
        {
            var builder = new TagBuilder("img");
            builder.MergeAttribute("src", imageUrl);
            builder.MergeAttribute("alt", altText);
            builder.MergeAttribute("width", width.ToString());
            builder.MergeAttribute("height", height.ToString());
            string link = helper.ActionLink("[replaceme]", actionName, ajaxOptions).ToString();
            return link.Replace("[replaceme]", builder.ToString(TagRenderMode.SelfClosing));
        }
        public static string ImageActionLink(this AjaxHelper helper, string imageUrl, string altText, string actionName, object routeValues, object width, object height, AjaxOptions ajaxOptions)
        {
            var builder = new TagBuilder("img");
            builder.MergeAttribute("src", imageUrl);
            builder.MergeAttribute("alt", altText);
            builder.MergeAttribute("width", width.ToString(),true);
            builder.MergeAttribute("height", height.ToString(), true);
            string link = helper.ActionLink("[replaceme]", actionName, routeValues, ajaxOptions).ToString();
            return link.Replace("[replaceme]", builder.ToString(TagRenderMode.SelfClosing));
        }
    }
}