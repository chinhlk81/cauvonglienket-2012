using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Mvc;
using System.IO;

using CVLK2011.Models;

namespace CVLK2011.Controllers.Member
{
    /// <summary>
    /// Created By Hoang.Nguyen
    /// Created date: 2011.03.16
    /// Description: Class Controller Provides actions/methods for creating an request to member Profile
    /// </summary>
   // [HandleError]
    public class MemberProfileController : BaseController
    {
        DBContainer ctx = new DBContainer();

        /// <summary>
        /// Created by Hoang.Nguyen
        /// Created date 2011.03.23
        /// Description: Method get user infor
        /// </summary>
        /// <returns>return result info by user ID</returns>
        public ActionResult Index(int id)
        {
            if (Session["CurrentUserID"] == null)
                return RedirectToAction("Index","Home");
            int currentUserID = Convert.ToInt32(Session["CurrentUserID"].ToString());
            int guestUserID = id;
            Session["GuestUserID"] = guestUserID;
            try
            {
                GetUserByID_Result userInfor = ctx.GetUserByID(guestUserID).Single(p => p.UserID == guestUserID);
                if (userInfor != null)
                    return View(userInfor);
                else
                    return View();
            }
            catch
            { return View(); }
        }

        /// <summary>
        /// Created by Hoang.Nguyen
        /// Created date 2011.03.23
        /// Description: Method edit user infor
        /// </summary>
        /// <returns></returns>
        public ActionResult Edit(int id, string cauthongbao)
        {

            try
            {
                IEnumerable<Province> provinces = ctx.Provinces.ToList();
                ViewData["UserAddCity"] = new SelectList(provinces, "ProvinceName", "ProvinceName");
                IEnumerable<Career> careers = ctx.Careers.ToList();
                ViewData["UserCareer"] = new SelectList(careers, "CareerName", "CareerName");
                Models.User objUserInfo = ctx.Users.Single(objUser => objUser.UserID == id);
                    string strDay = objUserInfo.UserBirthday.Day.ToString();
                    string strMonth = objUserInfo.UserBirthday.Month.ToString();
                    string strYear = objUserInfo.UserBirthday.Year.ToString();
                    ViewData["UserBirthdayDD"] = strDay;
                    ViewData["UserBirthdayMM"] = strMonth;
                    ViewData["UserBirthdayYYYY"] = strYear;
                ViewData["thongbao"] = cauthongbao;
                if (objUserInfo != null)
                    return View(objUserInfo);
                return View();
            }
            catch
            { return View(); }
        }
        /// <summary>
        /// Created by hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Update user info
        /// </summary>
        /// <param name="id">Current user id</param>
        /// <param name="frmColection">collection</param>
        /// <param name="editFile">tranfer file</param>
        /// <returns></returns>
        public ActionResult ChangeUserInfo(Models.User CurrentUserInfo, FormCollection frmColection, HttpPostedFileBase editFile)
        {
            try
            {
                Models.User objUserInfo = CurrentUserInfo;
                //Models.User objUserInfo = ctx.Users.SingleOrDefault(objUser => objUser.UserID == id);
                objUserInfo = CurrentUserInfo;
                if (objUserInfo != null)
                {
                    if (editFile != null)
                    { }
                    //if(TryUpdateModel(objUserInfo))
                        ctx.SaveChanges();
                        return RedirectToAction("Edit", objUserInfo.UserID);
                    //return RedirectToAction("Edit", new { id = id });
                }
                return View();
            }
            catch
            {
                ModelState.AddModelError("", "Change Failure, see inner exception");
                return View(); }
        }

        /// <summary>
        /// Created by hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Update user info
        /// </summary>
        /// <param name="id">Current user id</param>
        /// <param name="frmColection">collection</param>
        /// <param name="editFile">tranfer file</param>
        /// <returns></returns>
        public ActionResult tab1(int id)
        {
            try
            {
                Models.User objUserInfo = ctx.Users.Single(objUser => objUser.UserID == id);
                if (objUserInfo != null)
                //{
                //    return RedirectToAction("Edit", new RouteValueDictionary { { "id", objUserInfo.UserID }});
                    return View(objUserInfo);
                //}
                return View();
            }
            catch
            { return View(); }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult tab1(Models.User CurrentUserInfo, FormCollection frmColection, HttpPostedFileBase editFile)
        {
            try
            {
                //--Start region------
                //Thiết lập lưu kiểu dữ liệu date time theo ngày giơ hệ thống.
                string[] str = System.DateTime.Now.GetDateTimeFormats();
                System.Globalization.DateTimeFormatInfo n = System.Globalization.DateTimeFormatInfo.CurrentInfo;
                string strSeparator = n.DateSeparator;
                string strFullFortmat = n.ShortDatePattern;
                //-End region------------------------------

                Models.User objUserInfo = ctx.Users.SingleOrDefault(objUser => objUser.UserID == CurrentUserInfo.UserID);
                objUserInfo.UserFullName = CurrentUserInfo.UserFullName;
                string dteDD = frmColection["UserBirthdayDD"];
                String dteMM = frmColection["UserBirthdayMM"];
                string dteYYYY = frmColection["UserBirthdayYYYY"];
                //objUserInfo.UserBirthday = Convert.ToDateTime(dteDD +","+ dteMM +","+ dteYYYY);
                DateTime dtbirthdate = new DateTime(Convert.ToInt32(dteYYYY),Convert.ToInt32( dteMM),Convert.ToInt32( dteDD));
                objUserInfo.UserBirthday = dtbirthdate;
                //objUserInfo.UserBirthday = Convert.ToDateTime(frmColection["UserBirthday"]);
                objUserInfo.UserGender = CurrentUserInfo.UserGender;
                objUserInfo.UserEmail = CurrentUserInfo.UserEmail;
                objUserInfo.UserIDCard = CurrentUserInfo.UserIDCard;
                objUserInfo.UserDescriptions = CurrentUserInfo.UserDescriptions;
                if (objUserInfo != null)
                {
                    if (editFile != null)
                    { }
                    ctx.SaveChanges();
                    int id = Convert.ToInt32(Session["CurrentUserID"]);
                    if (id > 0)
                        return RedirectToAction("Edit", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn đã cập nhật thông tin cơ bản thành công" } });
                    else
                        return RedirectToAction("Index", "Home");
                }
                return RedirectToAction("Edit", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn chưa cập nhật đượcthông tin cơ bản!" } });
            }
            catch
            {
                ModelState.AddModelError("", "Change Failure, see inner exception");
                return View();
            }
        }

        /// <summary>
        /// Created by hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Update user info
        /// </summary>
        /// <param name="id">Current user id</param>
        /// <param name="frmColection">collection</param>
        /// <param name="editFile">tranfer file</param>
        /// <returns></returns>
        public ActionResult tab2(int id)
        {
            try
            {
                Models.User objUserInfo = ctx.Users.Single(objUser => objUser.UserID == id);
                if (objUserInfo != null)
                    return View(objUserInfo);
                return View();
            }
            catch
            { return View(); }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult tab2(Models.User CurrentUserInfo, FormCollection frmColection, HttpPostedFileBase editFile)
        {
            try
            {
                //Models.User objUserInfo = CurrentUserInfo;
                Models.User objUserInfo = ctx.Users.SingleOrDefault(objUser => objUser.UserID == CurrentUserInfo.UserID);
                objUserInfo.UserWeight = CurrentUserInfo.UserWeight;
                objUserInfo.UserHeight = CurrentUserInfo.UserHeight;
                objUserInfo.UserMaritalStatus = frmColection["UserMaritalStatus"];
                objUserInfo.UserReligion = CurrentUserInfo.UserReligion;
                if (objUserInfo != null)
                {
                        if (editFile != null)
                        { }
                        //if(TryUpdateModel(objUserInfo))
                        ctx.SaveChanges();
                        int id = Convert.ToInt32(Session["CurrentUserID"]);
                        if (id > 0)
                            return RedirectToAction("Index", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn đã cập nhật thông tin riêng tư thành công" } });
                        else
                            return RedirectToAction("Index", "Home");
                    }
                return RedirectToAction("Edit", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn chưa cập nhật được thông tin riêng tư!" } });
            }
            catch
            {
                ModelState.AddModelError("", "Change Failure, see inner exception");
                return View();
            }
        }

        /// <summary>
        /// Created by hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Update user info
        /// </summary>
        /// <param name="id">Current user id</param>
        /// <param name="frmColection">collection</param>
        /// <param name="editFile">tranfer file</param>
        /// <returns></returns>
        public ActionResult tab3(int id)
        {
            try
            {
                IEnumerable<Province> provinces = ctx.Provinces.ToList();
                ViewData["UserAddCity"] = new SelectList(provinces, "ProvinceName", "ProvinceName");
                Models.User objUserInfo = ctx.Users.Single(objUser => objUser.UserID == id);
                if (objUserInfo != null)
                    return View(objUserInfo);
                return View();
            }
            catch
            { return View(); }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult tab3(Models.User CurrentUserInfo, FormCollection frmColection, HttpPostedFileBase editFile)
        {
            try
            {
                Models.User objUserInfo = ctx.Users.SingleOrDefault(objUser => objUser.UserID == CurrentUserInfo.UserID);
                objUserInfo.UserAddLine = CurrentUserInfo.UserAddLine;
                objUserInfo.UserAddCity = CurrentUserInfo.UserAddCity;
                objUserInfo.UserPhone = CurrentUserInfo.UserPhone; 
                if (objUserInfo != null)
                {
                        if (editFile != null)
                        { }
                        //if(TryUpdateModel(objUserInfo))
                        ctx.SaveChanges();
                        int id = Convert.ToInt32(Session["CurrentUserID"]);
                        if (id > 0)
                            return RedirectToAction("Index", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn đã cập nhật thông tin nơi ở - liên lạc thành công" } });
                        else
                            return RedirectToAction("Index", "Home");
                    }
                return RedirectToAction("Edit", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn chưa cập nhật được thông tin nơi ở - liên lạc!" } });
            }
            catch
            {
                ModelState.AddModelError("", "Change Failure, see inner exception");
                return View();
            }
        }
        /// <summary>
        /// Created by hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Update user info
        /// </summary>
        /// <param name="id">Current user id</param>
        /// <param name="frmColection">collection</param>
        /// <param name="editFile">tranfer file</param>
        /// <returns></returns>
        public ActionResult tab4(int id)
        {
            try
            {
                IEnumerable<Career> careers = ctx.Careers.ToList();
                ViewData["UserCareer"] = new SelectList(careers, "CareerName", "CareerName");
                Models.User objUserInfo = ctx.Users.Single(objUser => objUser.UserID == id);
                if (objUserInfo != null)
                {
                   
                    return View(objUserInfo);
                }
                return View();
            }
            catch
            { return View(); }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult tab4(Models.User CurrentUserInfo, FormCollection frmColection, HttpPostedFileBase editFile)
        {
            try
            {
                Models.User objUserInfo = ctx.Users.SingleOrDefault(objUser => objUser.UserID == CurrentUserInfo.UserID);

                objUserInfo.UserLevel = frmColection["UserLevel"];
                objUserInfo.UserCareer = CurrentUserInfo.UserCareer;
                objUserInfo.UserJobPosition = CurrentUserInfo.UserJobPosition;
                objUserInfo.UserWage = CurrentUserInfo.UserWage;
                objUserInfo.UserWorkingTime = CurrentUserInfo.UserWorkingTime;
                if (objUserInfo != null)
                {
                    if (editFile != null)
                    { }
                    ctx.SaveChanges();
                    int id = Convert.ToInt32(Session["CurrentUserID"]);
                    if (id > 0)
                        return RedirectToAction("Index", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn đã cập nhật thông tin Học vấn - nghề nghiệp thành công" } });
                    else
                        return RedirectToAction("Index", "Home");
                }
                return RedirectToAction("Edit", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn chưa cập nhật được thông tin Học vấn nghề nghiệp!" } });
            }
            catch
            {
                ModelState.AddModelError("", "Change Failure, see inner exception");
                return View();
            }
        }
        /// <summary>
        /// Created by hoang.nguyen
        /// Created date 2011.03.24
        /// Desc: Update user info
        /// </summary>
        /// <param name="id">Current user id</param>
        /// <param name="frmColection">collection</param>
        /// <param name="editFile">tranfer file</param>
        /// <returns></returns>
        public ActionResult tab5(int id)
        {
            try
            {
                Models.User objUserInfo = ctx.Users.Single(objUser => objUser.UserID == id);
                if (objUserInfo != null)
                    return View(objUserInfo);
                return View();
            }
            catch
            { return View(); }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult tab5(Models.User CurrentUserInfo, FormCollection frmColection, HttpPostedFileBase editFile)
        {
            try
            {
                Models.User objUserInfo = ctx.Users.SingleOrDefault(objUser => objUser.UserID == CurrentUserInfo.UserID);
                objUserInfo.UserFavColor = CurrentUserInfo.UserFavColor;
                objUserInfo.UserFavFoods = CurrentUserInfo.UserFavFoods;
                objUserInfo.UserReadingBook = CurrentUserInfo.UserReadingBook;
                objUserInfo.UserPeopleLike = CurrentUserInfo.UserPeopleLike;
                objUserInfo.UserPeopleDislike = CurrentUserInfo.UserPeopleDislike;
                objUserInfo.UserHobby = CurrentUserInfo.UserHobby;
                objUserInfo.UserRequirements = CurrentUserInfo.UserRequirements;
                objUserInfo.UserHope = CurrentUserInfo.UserHope;
                objUserInfo.UserOjbLikeDating = CurrentUserInfo.UserOjbLikeDating;

                //objUserInfo.UserID = 
                if (objUserInfo != null)
                {
                    if (editFile != null)
                    { }
                    //if(TryUpdateModel(objUserInfo))
                    ctx.SaveChanges();
                    int id = Convert.ToInt32(Session["CurrentUserID"]);
                    if (id > 0)
                        return RedirectToAction("Index", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn đã cập nhật thông tin sở thích thành công" } });
                    else
                        return RedirectToAction("Index", "Home");
                }
                return RedirectToAction("Edit", new RouteValueDictionary { { "id", CurrentUserInfo.UserID }, { "cauthongbao", "Bạn chưa cập nhật được thông tin Học sở thích!" } });
            }
            catch
            {
                ModelState.AddModelError("", "Change Failure, see inner exception");
                return View();
            }
        }
        public ActionResult Cancel()
        {
            return RedirectToAction("Edit");
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id,Models.User CurrentUserInfo, FormCollection frmColection, HttpPostedFileBase editFile)
        {
            try
            {
                Models.User objUserInfo = CurrentUserInfo;
                //Models.User objUserInfo = ctx.Users.SingleOrDefault(objUser => objUser.UserID == id);
                objUserInfo = CurrentUserInfo;
                //objUserInfo.UserID = 
                if (objUserInfo != null)
                {
                    if (editFile != null)
                    { }
                    //if(TryUpdateModel(objUserInfo))
                        ctx.SaveChanges();
                    int id1 = objUserInfo.UserID;
                        return RedirectToAction("Edit", id);
                    //return RedirectToAction("Edit", new { id = iCurrentUserID });
                }
                return View();
            }
            catch
            {
                ModelState.AddModelError("", "Change Failure, see inner exception");
                return View();
            }
        }

        #region--UploadProfile by Hieu.Nguyen--
        //change avatar
        public ActionResult Avatar(int id)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                Models.User usr = ctx.Users.Single(p => p.UserID == id);
                return View(usr);
            }
            catch
            {
                return RedirectToAction("Index", "MemberHome", new {id=id });
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Avatar(int id, HttpPostedFileBase uploadFile)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                Models.User usr = ctx.Users.Single(p => p.UserID == id);
                String oldVatar = usr.UserPicture;
                if (uploadFile == null)
                {
                    ViewData["AvatarMessage"]="Bạn chưa chọn hình để thay đổi";
                   // return RedirectToAction("Avatar", "MemberProfile", new { id = id });
                    return View( usr);
                   
                }
                String oldName = usr.UserPicture;
                // String fileName = Path.GetFileName(uploadFile.FileName);
                if (!Utilities.IsImageFile(uploadFile.FileName))
                 {
                     ViewData["AvatarMessage"] = "Bạn chỉ được chọn hình JPG, GIF hoặc PNG.";
                     return View(usr);
                 }

                const string virtualPath = "~/Images/Users/";
                const string physicalPath = "../../Images/Users/";
               var filePath = Path.Combine(Request.MapPath(virtualPath));
                if (!Directory.Exists(filePath))
                    Directory.CreateDirectory(filePath);
                //get unique file name
              //  String sFileName = Utilities.GenerateImageName(filePath, uploadFile.FileName, Session["CurrentUserID"].ToString());
                String sFileName = Utilities.GenerateImageName(Request, virtualPath, uploadFile.FileName, Session["CurrentUserID"].ToString());
                uploadFile.SaveAs(filePath + sFileName);
                //hoang.nguyen removed 2012.01.02.0316
                //usr.UserPicture =physicalPath + sFileName;
                //hoang.nguyen added 2012.01.02.0316
                usr.UserAvatarUpload = physicalPath + sFileName;
                ctx.SaveChanges();
                //hoang.nguyen removed 2012.01.03.1646
                //delete old file
                //if (!oldName.Contains("none.jpg"))
                //{
                //    FileInfo info = new FileInfo(oldName);
                //    Utilities.DeleteFile(Request, "~/Images/Users", oldName);
                //}
                ViewData["AvatarMessage"] = "Hình đại diện của bạn đã được hệ thống ghi nhận, chờ duyệt! Ảnh đại diện của bạn sẽ được hiển thị sau khi đã được duyệt";
                //return RedirectToAction("Avatar", "MemberProfile", new { id = id });
                return View(usr);
                   
                

            }
            catch
            {
                return RedirectToAction("Avatar","MemberProfile",new{id=id});
            }
        }
        #endregion
        #region--change password--
        public ActionResult ChangePassword(int id)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                Models.User user = ctx.Users.Single(p => p.UserID == id);
                return View(user);
            }
            catch
            {
                return View();
            }
        }
        //change password
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChangePassword(int id, FormCollection collection)
        {
            try
            {
                if (Session["CurrentUserID"] == null)
                    return RedirectToAction("Index", "Home");
                if (String.IsNullOrWhiteSpace(collection["Password"].ToString()))
                    return RedirectToAction("ChangePassword", new RouteValueDictionary { { "id", id } });
                EnCrypto encpt = new EnCrypto();
                String oldPassword = collection["OldPassWord"].ToString();
                String newPassword = collection["Password"].ToString();
                Models.User usr = ctx.Users.Single(us => us.UserID == id);
                if (usr != null)
                {
                    if (encpt.Encrypt(oldPassword) == usr.Password)
                    {
                        usr.Password = encpt.Encrypt(newPassword);
                        ctx.SaveChanges();
                        ViewData["PasswordMessage"] = " Mật khẩu của bạn đã được thay đổi!";
                        return View(usr);
                    }
                    else
                    {
                        ViewData["PasswordMessage"]="Mật khẩu cũ không chính xác";
                        return View(usr);
                        //return RedirectToAction("ChangePassword", new RouteValueDictionary { { "id", id } });
                    }
                }
                //
                return RedirectToAction("ChangePassword", "MemberProfile");
            }
            catch
            {
                return View();
            }
        }
        

        #endregion

        public ActionResult MemberProfileBasic(int id)
        {
            int guestUserID = id;
            Session["GuestUserID"] = guestUserID;
            try
            {
                GetUserByID_Result userInfor = ctx.GetUserByID(guestUserID).Single(p => p.UserID == guestUserID);
                if (userInfor != null)
                    return View(userInfor);
                else
                    return View();
            }
            catch
            { return View(); }
        }
    }
}
