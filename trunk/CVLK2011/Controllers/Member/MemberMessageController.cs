using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
using System.Data.Objects.DataClasses;
using System.Data.Objects;
using System.Web.Routing;
namespace CVLK2011.Controllers.Member
{
    [HandleError]
    public class MemberMessageController : BaseController
    {
        //
        // GET: /MemberMessage/
        public int PageSize = 20;
        DBContainer ctx = new DBContainer();
        public ActionResult Index(String box, String currentMessage, int page = 1)
        {
            try
            {
                if(Session["CurrentUserID"]==null)
                    return RedirectToAction("Index", "Home");
                int currentUserID = Convert.ToInt32(Session["CurrentUserID"].ToString());
                Session["GuestUserID"] = currentUserID;
                IEnumerable<GetAllMessageInboxByUserID_Result> msg = null;
                var viewModel = new MemberMessageListViewModel();
                if (box == "UnRead")
                    msg = ctx.GetAllMessagesUnRead(currentUserID).ToList();
                else if (box == "IsRead")
                    msg = ctx.GetAllMessageIsRead(currentUserID).ToList();
                else
                    msg = ctx.GetAllMessageInboxByUserID(currentUserID).ToList();
                viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
                viewModel.CurrentMessage = currentMessage;
                viewModel.box = box;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        public ActionResult SearchAllMessagesByTitle(String messageTitle, String box, String currentMessage, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                int currentUserID = Convert.ToInt32(Session["CurrentUserID"].ToString());
                Session["GuestUserID"] = currentUserID;
                IEnumerable<GetAllMessageInboxByUserID_Result> msg = null;
                var viewModel = new MemberMessageListViewModel();
                if (box == "UnRead")
                    msg = ctx.GetAllMessagesUnRead(currentUserID).ToList();
                else if (box == "IsRead")
                    msg = ctx.GetAllMessageIsRead(currentUserID).ToList();
                else
                    msg = ctx.Member_SearchAllMessageByTitle(currentUserID, messageTitle).ToList();
                viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
                viewModel.CurrentMessage = currentMessage;
                viewModel.box = box;
                return View("Index",viewModel);
            }
            catch
            {
                return View();
            }
        }
        public ActionResult CheckAll(MemberMessageListViewModel model)
        {
            model.Checked = true;
            return View(model);
                 
        }
        //get all messages UnRead
        public ActionResult MessagesUnRead(String currentMessage, int page = 1)
        {
            try
            {
                IEnumerable<GetAllMessageInboxByUserID_Result> msg = ctx.GetAllMessagesUnRead(Convert.ToInt32(Session["CurrentUser"])).ToList();
                var viewModel = new MemberMessageListViewModel();
                viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
                viewModel.CurrentMessage = currentMessage;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        //get all messages Is Readed
        public ActionResult MessagesIsRead(String currentMessage, int page = 1)
        {
            try
            {
                IEnumerable<GetAllMessageInboxByUserID_Result> msg = ctx.GetAllMessageIsRead(Convert.ToInt32(Session["CurrentUser"])).ToList();
                var viewModel = new MemberMessageListViewModel();
                viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
                viewModel.CurrentMessage = currentMessage;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        //
        //get all messages UnRead
        public ActionResult MessagesIsReply(String currentMessage, int page = 1)
        {
            try
            {
                IEnumerable<GetAllMessageInboxByUserID_Result> msg = ctx.GetAllMessagesIsReply(Convert.ToInt32(Session["CurrentUser"])).ToList();
                var viewModel = new MemberMessageListViewModel();
                viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
                viewModel.CurrentMessage = currentMessage;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        //get all messages out box
        public ActionResult MessagesOutBox(String currentMessage, int page = 1)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                IEnumerable<GetAllMessageInboxByUserID_Result> msg = ctx.GetAllMessageOutboxByUserID(Convert.ToInt32(Session["CurrentUserID"])).ToList();
                var viewModel = new MemberMessageListViewModel();
                viewModel.MessageList = msg.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = msg.Count() };
                viewModel.CurrentMessage = currentMessage;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        // Details

        public ActionResult Details(int id)
        {
            try
            {
              
                ReplyMessage();
                GetMessageByID_Result msg = ctx.GetMessageByID(id).Single();
                var viewDetail = new MessageDetailsViewModel();
                viewDetail.CurrentMessage = msg;
                //viewDetail.CommentsList = ctx.GetAllCommentsByBlog(id).ToList();
                //update is read 
                Message msgIsRead = ctx.Messages.Single(ms => ms.MessageID == id);
                msgIsRead.MessageUnRead = false;
                UpdateModel(msgIsRead);
                ctx.SaveChanges();
                return View(viewDetail);
            }
            catch (Exception ex)
            {
                return View();
            }
        }
        #region--Create Message-- 
        //public ActionResult Recipients(FormCollection collection)
        //{
        //    string listNames = collection["listNames"].ToString();
        //    string listIds = collection["listUserId"].ToString();
        //    List<User> listUser = new List<User>();

        //    string[] names = listNames.Split('-');
        //    string[] ids = listIds.Split('-');
        //    for (int i = 0; i < ids.Length; i++)
        //    {

        //        if (ids[i] != "")
        //        {
        //            int id = int.Parse(ids[i].ToString());
        //            //User us = ctx.GetUserByIdUser(id).Single();
        //            //listUser.Add(us);
        //        }
        //    }
        //     int idUser = int.Parse(collection["userid"].ToString());
        //     if (ViewData["RecipientsList"] == null)
        //     {
        //         listUser = ctx.Users.ToList();
        //         ViewData["RecipientsList"] = new SelectList(listUser, "", "");
        //     }
        //     return PartialView("Recipients", listUser as IEnumerable<User>);
        //}
        //public ActionResult Create(int id)
        //{
        //    int currentUserID =Convert.ToInt32(Session["CurrentUserID"]);
        //    CVLK2011.Models.Message cmt = new Models.Message();
        //    if (id != currentUserID)
        //        cmt.FK_UserReceiptID = id;
        //    Models.User us = ctx.Users.Single(i => i.UserID == id);
        //    IEnumerable<GetAllUsers_Result> users = ctx.GetAllUsers().ToList();
        //    ViewData["userid"] = new SelectList(users, "UserID", "UserNameFullName");
        //    return View(cmt);
        //}
       
        //
        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult Create(FormCollection collection)
        //{
        //    try
        //    {
        //        if (Session["CurrentUserID"] == null)
        //            return RedirectToAction("Index", "Home");
        //        string listNames = collection["listNames"].ToString();
        //        string listIds = collection["listUserId"].ToString();
        //        if (String.IsNullOrWhiteSpace(listNames))
        //            return RedirectToAction("Create", "MemberMessage");
        //        string[] ids = listIds.Split('-');
        //        string[] names = listNames.Split('-');
        //        for (int i = 0; i < ids.Length; i++)
        //        {

        //            if (ids[i] != "")
        //            {
        //                Message msg = new Message();
        //                int userID = int.Parse(ids[i].ToString());
        //                msg.MessageTitle = collection["MessageTitle"].ToString();
        //                msg.MessageContent = collection["MessageContent"].ToString();
        //                msg.Status = Models.Utilities.cstNewStatus;
        //                msg.MessageIsReply = false;
        //                msg.MessageUnRead = true;
        //                msg.MessageDatetime = DateTime.Now;
        //                msg.FK_UserReceiptID = userID;
        //                msg.FK_UserSendID = Convert.ToInt32(Session["CurrentUserID"].ToString());
        //                ctx.AddToMessages(msg);
        //                ctx.SaveChanges();
        //            }

        //        }
        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
        //
        //
        public ActionResult Create()
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index", "Home");
            int currentUserID = Convert.ToInt32(Session["CurrentUserID"]);
            CVLK2011.Models.Message msg = new Models.Message();
            return View(msg);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                if (collection.Count == 0)
                {
                    ViewData["MessageResult"] = "Vui lòng điền tên người nhận";
                    return View();
                }
                bool isSend = false;
                foreach (string key in collection.Keys)
                {
                    if (key.StartsWith("hd"))
                    {
                        int userID = 0;
                        string stringID =collection[key].ToString();
                        if (int.TryParse(stringID, out userID))
                        {
                            Message msg = new Message();
                            msg.MessageTitle = collection["MessageTitle"].ToString();
                            msg.MessageContent = collection["MessageContent"].ToString();
                            msg.Status = Models.Utilities.cstNewStatus;
                            msg.MessageIsReply = false;
                            msg.MessageUnRead = true;
                            msg.MessageDatetime = DateTime.Now;
                            msg.FK_UserReceiptID = userID;
                            msg.FK_UserSendID = Convert.ToInt32(Session["CurrentUserID"].ToString());
                            msg.MessageType = "Member";
                            ctx.AddToMessages(msg);
                            ctx.SaveChanges();
                            isSend = true;

                        }

                    }
                }
                if (isSend)
                {
                    ViewData["MessageResult"] = "Tin nhẳn của bạn đã được gởi đi!";
                    var helper = new UrlHelper(HttpContext.Request.RequestContext);
                    string url = helper.Action("Index", "MemberMessage");
                    return Redirect(url);
                }
                else
                    ViewData["MessageResult"] = "Không gởi được.Vui lòng kiểm tra lại!";
                return View();
            }
            catch
            {
                return View();
            }
        }
        #endregion
        public int GetUserIDByName(String userName)
        {
            int id =Convert.ToInt32( ctx.GetUserIDByName(userName).Single()) ;
            return Convert.ToInt32(ctx.GetUserIDByName(userName).SingleOrDefault().ToString());
        }
        //
        public ActionResult Delete(int id,string box,string currentPage)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                ctx.DeleteMessage(id);
                if (box == "Outbox")
                    return RedirectToAction("MessagesOutBox", new { currentMessage = currentPage });
                return RedirectToAction("Index", new {box=box,currentMessage=currentPage});
            }
            catch (Exception ex)
            {
                return View();
            }
        }
       
        //
        public ActionResult ReplyMessage()
        {
            Message msg = new Message();
            return View(msg);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ReplyMessage([Bind(Exclude = "MessageID")] CVLK2011.Models.Message msg, FormCollection collection)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                int currentMessageID = Convert.ToInt32(collection["CurrentMessage.MessageID"].ToString());
                String strMessageReply = collection["MessageReply"].ToString();
                String strMessageTitle = collection["CurrentMessage.MessageTitle"].ToString();
                if (String.IsNullOrEmpty(strMessageReply))
                {
                    ViewData["ValidateMessage"] = "Nhập nội dung trả lời!";
                     return RedirectToAction("Details", new RouteValueDictionary { { "id", currentMessageID } });
                    
                         
                }
                if (strMessageTitle.Contains("Re:"))
                    msg.MessageTitle = strMessageTitle;
                else
                    msg.MessageTitle ="Re:"+ strMessageTitle;
                msg.FK_UserSendID = Convert.ToInt32(Session["CurrentUserID"]);
                msg.FK_UserReceiptID = Convert.ToInt32(collection["CurrentMessage.FK_UserSendID"]);
                msg.MessageContent = strMessageReply;
                
                msg.MessageDatetime = DateTime.Now;
                msg.Status = Models.Utilities.cstNewStatus;
                msg.MessageUnRead = true;
                msg.MessageIsReply = false;
                //update message to IsReply
                ctx.AddToMessages(msg);
                ctx.SaveChanges();
                //return RedirectToAction("Details", new RouteValueDictionary { { "id", currentMessageID } });
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
                // return RedirectToAction("Details", new RouteValueDictionary { { "id", currentMessageID } });
            }
        }

        //
        public ActionResult MessageSender(int id)
        {
            try
            {
                GetUserByID_Result user = ctx.GetUserByID(id).Single(us => us.UserID == id);
                return View(user);
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult MessageAction(string box,FormCollection collection)
        {
            try
            {
                if(Session["CurrentUserID"]==null)
                    return RedirectToAction("Index", "Home");
               
                    foreach (String key in collection.Keys)
                    {
                        int msgID = 0;
                        if (collection[key].ToString().StartsWith("true"))
                        {
                            string checkBoxID = key.ToString().Replace("cbox", "");

                            if (int.TryParse(checkBoxID, out msgID))
                            {
                                if (collection["Read"] != null)
                                {
                                    ctx.UpdateMessageToRead(msgID);
                                }
                                else if (collection["Delete"] != null)
                                {
                                    ctx.DeleteMessage(msgID);
                                }
                        }
                    }
                }
                    return RedirectToAction("Index", "MemberMessage", new { box=box});
            }
            catch
            {
                return RedirectToAction("Index", "MemberMessage");
            }
        }
        //delelte message out box
        [HttpPost]
        public ActionResult DeleteMessageOutBox(FormCollection collection)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");

                foreach (String key in collection.Keys)
                {
                    int msgID = 0;
                    if (collection[key].ToString().StartsWith("true"))
                    {
                        string checkBoxID = key.ToString().Replace("cbox", "");

                        if (int.TryParse(checkBoxID, out msgID))
                        {
                                ctx.DeleteMessage(msgID);
                        }
                    }
                }
                return RedirectToAction("MessagesOutBox", "MemberMessage");
            }
            catch
            {
                return RedirectToAction("Index", "MemberMessage");
            }
        }
        //search user for auto complete
        [HttpPost]
        public JsonResult FindNames(string searchText, int maxResults)
        {
            UserAutoComplete autoComplete = new UserAutoComplete();
            var result = autoComplete.FindPeople(searchText, maxResults);
            return Json(result);
        }


    }
}
