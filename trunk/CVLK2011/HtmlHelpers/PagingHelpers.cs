using System;
using System.Text;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using CVLK2011.Models;

namespace CVLK2011.HtmlHelpers
{
    public static class PagingHelpers
    {
        public static MvcHtmlString PageLinks(this HtmlHelper html, PagingInfo pagingInfo, Func<int, string> pageUrl)
        {
            StringBuilder result = new StringBuilder();
            for (int i = 1; i <= pagingInfo.TotalPages; i++)
            {
                TagBuilder tag = new TagBuilder("a"); // Construct an <a> tag
                tag.MergeAttribute("href", pageUrl(i));
                tag.InnerHtml = i.ToString();
                if (i == pagingInfo.CurrentPage)
                    tag.AddCssClass("selected");
                result.AppendLine(tag.ToString());
            }
            MvcHtmlString htmtring = MvcHtmlString.Create(result.ToString());
            return MvcHtmlString.Create(result.ToString());
        }
         //public static MvcHtmlString Pager(this AjaxHelper helper, int CurrentPage, int TotalRecords, string TargetDiv,int id=0, int PageSize = 10, string ActionName="Index")
         // {
         //    if (TotalRecords > 0)
         //    {
         //       StringBuilder sb = new StringBuilder();
         //     int TotalPages = (int)Math.Ceiling(TotalRecords / (double)PageSize);
         //       //int TotalPages =(int) TotalRecords / PageSize;
         //       //Build the Ajax Options
         //       AjaxOptions ao = new AjaxOptions();
         //       ao.UpdateTargetId = TargetDiv;
  
         //       if (CurrentPage >0)
         //       {
         //          //Add the Back Links
         //           sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<<", ActionName, new {id=id, Page = 0 }, ao));
         //          sb.Append("  ");
         //          sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper,"<", ActionName, new {id=id, Page = CurrentPage - 1 }, ao));
         //          sb.Append("  ");
         //       }
  
         //       //Add the Page Number
         //       sb.Append( (CurrentPage + 1).ToString() + " / " + (TotalPages).ToString());
  
         //       if (CurrentPage < (TotalPages - 1))
         //       {
         //          //Add the Next Links
         //          sb.Append("  ");
         //          sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">", ActionName, new {id=id, Page = CurrentPage + 1 }, ao));
         //          sb.Append("  ");
         //          sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">>", ActionName, new {id=id, Page = TotalPages-1 }, ao));
         //       }
  
         //       return MvcHtmlString.Create(sb.ToString());
         //    }
         //    else
         //    {
         //       //Don't return anything for the pager if we do not have any records
         //       return MvcHtmlString.Create("");
         //    }
         // } 


        public static MvcHtmlString Pager(this AjaxHelper helper, int CurrentPage, int TotalRecords, string TargetDiv, int id = 0, int PageSize = 10, string ActionName = "Index")
        {
            if (TotalRecords > 0)
            {
                StringBuilder sb = new StringBuilder();
                int TotalPages = (int)Math.Ceiling(TotalRecords / (double)PageSize);
                //int TotalPages =(int) TotalRecords / PageSize;
                //Build the Ajax Options
                AjaxOptions ao = new AjaxOptions();
                ao.UpdateTargetId = TargetDiv;

                if (CurrentPage > 0)
                {
                    //Add the Back Links
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<<", ActionName, new { id = id, Page = 0 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<", ActionName, new { id = id, Page = CurrentPage - 1 }, ao));
                    sb.Append("  ");
                }

                //Add the Page Number
                sb.Append((CurrentPage + 1).ToString() + " / " + (TotalPages).ToString());

                if (CurrentPage < (TotalPages - 1))
                {
                    //Add the Next Links
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">", ActionName, new { id = id, Page = CurrentPage + 1 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">>", ActionName, new { id = id, Page = TotalPages - 1 }, ao));
                }

                return MvcHtmlString.Create(sb.ToString());
            }
            else
            {
                //Don't return anything for the pager if we do not have any records
                return MvcHtmlString.Create("");
            }
        }
        //
        public static MvcHtmlString Pager(this AjaxHelper helper, int CurrentPage, int TotalRecords, string TargetDiv, String Filter, int PageSize = 10, string ActionName = "Index")
        {
            if (TotalRecords > 0)
            {
                StringBuilder sb = new StringBuilder();
                int TotalPages = (int)Math.Ceiling(TotalRecords / (double)PageSize);
                //int TotalPages =(int) TotalRecords / PageSize;
                //Build the Ajax Options
                AjaxOptions ao = new AjaxOptions();
                ao.UpdateTargetId = TargetDiv;

                if (CurrentPage > 0)
                {
                    //Add the Back Links
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<<", ActionName, new { Filter = Filter, Page = 0 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<", ActionName, new { Filter = Filter, Page = CurrentPage - 1 }, ao));
                    sb.Append("  ");
                }

                //Add the Page Number
                sb.Append((CurrentPage + 1).ToString() + " / " + (TotalPages).ToString());

                if (CurrentPage < (TotalPages - 1))
                {
                    //Add the Next Links
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">", ActionName, new { Filter = Filter, Page = CurrentPage + 1 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">>", ActionName, new { Filter = Filter, Page = TotalPages - 1 }, ao));
                }

                return MvcHtmlString.Create(sb.ToString());
            }
            else
            {
                //Don't return anything for the pager if we do not have any records
                return MvcHtmlString.Create("");
            }
        }
        public static MvcHtmlString Pager(this AjaxHelper helper, int CurrentPage, int TotalRecords, string TargetDiv, int Singerid, String Filter, int PageSize = 10, string ActionName = "Index")
        {
            if (TotalRecords > 0)
            {
                StringBuilder sb = new StringBuilder();
                int TotalPages = (int)Math.Ceiling(TotalRecords / (double)PageSize);
                //int TotalPages =(int) TotalRecords / PageSize;
                //Build the Ajax Options
                AjaxOptions ao = new AjaxOptions();
                ao.UpdateTargetId = TargetDiv;

                if (CurrentPage > 0)
                {
                    //Add the Back Links
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<<", ActionName, new { Singerid = Singerid, Filter = Filter, Page = 0 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<", ActionName, new { Singerid = Singerid, Filter = Filter, Page = CurrentPage - 1 }, ao));
                    sb.Append("  ");
                }

                //Add the Page Number
                sb.Append((CurrentPage + 1).ToString() + " / " + (TotalPages).ToString());

                if (CurrentPage < (TotalPages - 1))
                {
                    //Add the Next Links
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">", ActionName, new { Singerid = Singerid, Filter = Filter, Page = CurrentPage + 1 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">>", ActionName, new { Singerid = Singerid, Filter = Filter, Page = TotalPages - 1 }, ao));
                }

                return MvcHtmlString.Create(sb.ToString());
            }
            else
            {
                //Don't return anything for the pager if we do not have any records
                return MvcHtmlString.Create("");
            }
        }
        public static MvcHtmlString Pager(this AjaxHelper helper, int CurrentPage, int TotalRecords, string TargetDiv, int iGameId, int iVideoId, int iNEWSId, int PageSize = 10, string ActionName = "Index")
        {
            if (TotalRecords > 0)
            {
                StringBuilder sb = new StringBuilder();
                int TotalPages = (int)Math.Ceiling(TotalRecords / (double)PageSize);
                //int TotalPages =(int) TotalRecords / PageSize;
                //Build the Ajax Options
                AjaxOptions ao = new AjaxOptions();
                ao.UpdateTargetId = TargetDiv;

                if (CurrentPage > 0)
                {


                    //Add the Back Links
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<<", ActionName, new { iGameId = iGameId, iVideoId = iVideoId, iNEWSId = iNEWSId, Page = 0 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, "<", ActionName, new { iGameId = iGameId, iVideoId = iVideoId, iNEWSId = iNEWSId, Page = CurrentPage - 1 }, ao));
                    sb.Append("  ");
                }

                //Add the Page Number
                sb.Append((CurrentPage + 1).ToString() + " / " + (TotalPages).ToString());

                if (CurrentPage < (TotalPages - 1))
                {
                    //Add the Next Links
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">", ActionName, new { iGameId = iGameId, iVideoId = iVideoId, NewsId = iNEWSId, Page = CurrentPage + 1 }, ao));
                    sb.Append("  ");
                    sb.Append(System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, ">>", ActionName, new { iGameId = iGameId, iVideoId = iVideoId, NewsId = iNEWSId, Page = TotalPages - 1 }, ao));
                }

                return MvcHtmlString.Create(sb.ToString());
            }
            else
            {
                //Don't return anything for the pager if we do not have any records
                return MvcHtmlString.Create("");
            }
        }
        //
        public static MvcHtmlString ImagePager(this AjaxHelper helper, int CurrentPage, int TotalRecords, string TargetDiv, String imageUrlPrv, String altPrv, String imageUrlNext, String altNext, int id = 0, int PageSize = 10, string ActionName = "Index")
        {
            if (TotalRecords > 0)
            {
                StringBuilder sb = new StringBuilder();
                int TotalPages = (int)Math.Ceiling(TotalRecords / (double)PageSize);
                //int TotalPages =(int) TotalRecords / PageSize;
                //Build the Ajax Options
                AjaxOptions ao = new AjaxOptions();
                ao.UpdateTargetId = TargetDiv;
                int NextPage = CurrentPage;
                int PrevPage = CurrentPage;
                if (CurrentPage == 0)
                {
                    //int validatePage = 0;
                    if (TotalPages > 1)
                        NextPage++;
                    //else 
                    //    validatePage=CurrentPage;
                    var builderPrv = new TagBuilder("img");
                    builderPrv.MergeAttribute("src", imageUrlPrv);
                    builderPrv.MergeAttribute("alt", altPrv);
                    //Add the Back Links
                    var linkPrv = System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, " ", ActionName, new { id = id, Page = PrevPage }, ao);
                    String sLinkPrv = linkPrv.ToString();
                    String imagPrv = sLinkPrv.Insert(sLinkPrv.Length - 4, builderPrv.ToString());
                    sb.Append(imagPrv.ToString());
                    //next
                    sb.Append(" ");
                    var builderNext = new TagBuilder("img");
                    builderNext.MergeAttribute("src", imageUrlNext);
                    builderNext.MergeAttribute("alt", altNext);

                    var linkNext = System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, " ", ActionName, new { id = id, Page = NextPage }, ao);
                    String sLinkNext = linkNext.ToString();
                    String imagNext = sLinkNext.Insert(sLinkNext.Length - 4, builderNext.ToString());
                    sb.Append(imagNext.ToString());


                }

                else
                {
                    //int validatePage = 0;
                    if (CurrentPage == TotalPages - 1)
                        NextPage--;
                    //else
                    NextPage++;
                    PrevPage--;
                    var builderPrv = new TagBuilder("img");
                    builderPrv.MergeAttribute("src", imageUrlPrv);
                    builderPrv.MergeAttribute("alt", altPrv);
                    //Add the Back Links
                    var linkPrv = System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, " ", ActionName, new { id = id, Page = PrevPage }, ao);
                    String sLinkPrv = linkPrv.ToString();
                    String imagPrv = sLinkPrv.Insert(sLinkPrv.Length - 4, builderPrv.ToString());
                    sb.Append(imagPrv.ToString());
                    //
                    sb.Append(" ");
                    var builderNext = new TagBuilder("img");
                    builderNext.MergeAttribute("src", imageUrlNext);
                    builderNext.MergeAttribute("alt", altNext);
                    var linkNext = System.Web.Mvc.Ajax.AjaxExtensions.ActionLink(helper, " ", ActionName, new { id = id, Page = NextPage }, ao);
                    String sLinkNext = linkNext.ToString();
                    String imageNext = sLinkNext.Insert(sLinkNext.Length - 4, builderNext.ToString());
                    sb.Append(imageNext.ToString());
                }

                return MvcHtmlString.Create(sb.ToString());
            }
            else
            {
                //Don't return anything for the pager if we do not have any records
                return MvcHtmlString.Create("");
            }
        }


    }
}