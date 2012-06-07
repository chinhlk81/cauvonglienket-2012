using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Net;
using System.Management;
using System.Net.Sockets;
using System.Net.NetworkInformation;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
namespace CVLK2011.Models
{
    public class Utilities
    {
        public static String cstApprove = "Approve";
        public static String cstHot = "Hot";
        public static String cstUnApprove = "UnApprove";
        public static String cstNewStatus = "New";
        public static String cstDeleteStatus = "Delete";
        public static String cstUserVIP = "VIP";
        public static String cstUerNormal = "Thành viên thường";
        public static String ctsAgree = "Agree";
        public static String cstDisagree = "Disagree";
        public static String cstVisible = "Visible";
        public static String cstInvisible = "Invisible";
        public static string cstActive = "Active";
        public static string cstDeActivate = "DeActivate";
        public static string cstAlbumTypeShare = "Share";
        public static string cstAlbumTypeMember = "Member";
        public static string cstAlbumTypeEvent = "Event";
        public static string cstAlbumTypeAdmin = "Admin";
        public static string cstCommentTypeWall = "Wall";
        public static string cstCommentTypeEvent = "Event";
        public static string cstCommentTypeBlog = "Blog";
        public static string cstUserTypeNone = "None";
        public static string cstUserTypeCouples = "Couples";
        public static string cstUserTypePerfectCouple = "PerfectCouple";
        public static string cstUserTypeWaitingReply = "WaitingReply";
        public static string cstUserTypeWaitngAppointment = "WaitingAppointment";
        public static string cstUserTypeOther = "Other";
        public static string cstUserTypeNoContacted = "NoContacted";
        public static string cstUserTypeMet = "Met";
        public static string cstUserTypePotential = "Potential";
        public static string cstUserTypeNoSerious = "NoSerious";
        public static string cstUSerTypeReview = "Review";
        public static string cstTypeAdmin = "Admin";
        public static string cstTypeCustomer = "Customer";
        public static string cstOnHomePage = "HomePage";
        public static string cstOnDetailPage = "DetailPage";
        public static string cstPositionRightPage = "RightPage";
        public static string cstPositionBottomPage = "BottomPage";
        public static string cstCommentTypeGame = "Game";
        public static string cstCommentTypeVideo = "Video";
        public static string cstCommentTypeNews = "News";
        public static string cstCommentTypePhoto = "Photo";
        public static int IDefaultPhoto;
        public static int IDefaultVideo;
        public static int IDefaultUser;
        public static int IDefaultComment;
        public static int IDefaultEvent;
        public static int IDefaultBlog;
        public static Dictionary<String, String> AliasDictionary { get; set; }

        DBContainer ctx = new DBContainer();
        public Utilities()
        {
            AliasDictionary = new Dictionary<string, string>();
            AliasDictionary.Add("Member", "Album của thành viên");
            AliasDictionary.Add("Event", "Album của sự kiện");
            AliasDictionary.Add("Admin", "Quản trị");
            AliasDictionary.Add("Share", "Album chia sẽ");
            AliasDictionary.Add("Male", "Nam");
            AliasDictionary.Add("Female", "Nữ");
            AliasDictionary.Add("None", "Chưa phân loại");
            AliasDictionary.Add("Couples", "Cặp đôi đang tìm hiểu");
            AliasDictionary.Add("PerfectCouple", "Cặp đôi hoàn hảo");
            AliasDictionary.Add("WaitingAppointment", "Chờ hẹn riêng");
            AliasDictionary.Add("WaitingReply", "Chờ trả lời");
            AliasDictionary.Add("Other", "Chương trình khác");
            AliasDictionary.Add("NoContacted", "Chưa liên lạc được");
            AliasDictionary.Add("Met", "Đã hẹn riêng");
            AliasDictionary.Add("Potential", "TV tiềm năng");
            AliasDictionary.Add("NoSerious", "Không thành ý");
            AliasDictionary.Add("Review", "Cần xem lại");
            AliasDictionary.Add("Customer", "Tư Vấn Viên");
            AliasDictionary.Add("Active","Hoạt động");
            AliasDictionary.Add("DeActivate", "Không hoạt động");
            AliasDictionary.Add("New", "Mới");
            AliasDictionary.Add("Visible","Hiển thị");
            AliasDictionary.Add("Invisible", "Ẩn");
            AliasDictionary.Add("Hot","Hot");
            AliasDictionary.Add(cstOnHomePage, "Trang chủ");
            AliasDictionary.Add(cstOnDetailPage, "Trang chi tiết");
            AliasDictionary.Add(cstPositionBottomPage, "Cuối trang");
            AliasDictionary.Add(cstPositionRightPage, "Bên phải");
            IDefaultUser = GetDefaultUser();
            IDefaultEvent = GetDefaultEvent();
            IDefaultComment = GetDefaultComment();
        }
        public  int GetDefaultUser()
        {
            return Convert.ToInt32(ctx.GetDefaultUser().FirstOrDefault());
            
        }
        public int GetDefaultBlog()
        {
            return Convert.ToInt32(ctx.GetDefaultBlog().FirstOrDefault());
        }
        public  int GetDefaultEvent()
        {
           
            return Convert.ToInt32(ctx.GetDefaultEvent().FirstOrDefault());
        }
        public int GetDefaultComment()
        {
            return Convert.ToInt32(ctx.GetDefaultComment().FirstOrDefault());
        }
        //
        public static bool IsImageFile(string fileName)
        {
            FileInfo info = new FileInfo(fileName);
            string extention = info.Extension.ToLower();
            if (extention == ".jpg" || extention == ".gif" || extention == ".png")
                return true;
            else
                return false;
        }
        public static bool IsVideo(string fileName)
        {
            FileInfo info = new FileInfo(fileName);
            string extention = info.Extension.ToLower();
            if (extention == ".flv")
                return true;
            else
                return false;
        }
        // Delete file
        public static void DeleteFile(HttpRequestBase requestBase,String virtualPath, String fileName)
        {
            String Name = System.IO.Path.GetFileName(fileName);
            String virtualFullPath = virtualPath + "/" + Name;
            String filePath = Path.Combine(requestBase.MapPath(virtualFullPath));
            FileInfo info = new FileInfo(filePath);
            if (info.Exists)
                info.Delete();
        }
        public static String GenerateImageName(HttpRequestBase requestBase, String virtualPath, String fileName, String userID)
        {
            
            FileInfo fileInfo = new FileInfo(fileName);
            //get extension file
            String extension = fileInfo.Extension;
            //gen name with user id
            fileName = "Images"+userID;
            String sFileName =fileName+extension;
            int file_append = 0;
            //while (System.IO.File.Exists(physicalPath +"/"+ sFileName))
            //{
            //    file_append++;
            //   // sFileName = System.IO.Path.GetFileNameWithoutExtension(fileName) + file_append.ToString() + extention;
            //    sFileName = fileName + file_append.ToString() + extension;
            //}
            //string test = virtualPath + "/" + sFileName;
            //string com = Path.Combine(requestBase.MapPath(virtualPath + "/" + sFileName));
            //FileInfo info = new FileInfo(com);
            //if (info.Exists)
            //{
            //}

            while (System.IO.File.Exists(Path.Combine(requestBase.MapPath( virtualPath + "/" + sFileName))))
            {
                file_append++;
                sFileName = fileName + file_append.ToString() + extension;
            }
            return sFileName;
        }

        //public static string GetLocalMachineIPAddress()
        //{

        //    // Query for all the enabled network adapters
        //    // case 1:
        //    ManagementObjectSearcher objSearcher = new ManagementObjectSearcher("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = 'TRUE'");
        //    ManagementObjectCollection objCollection = objSearcher.Get();
        //    //case 2:
        //    ManagementClass objMC = new ManagementClass("Win32_NetworkAdapterConfiguration");
        //    ManagementObjectCollection objMOC = objMC.GetInstances();
        //    string ipAddress = string.Empty;
        //    foreach (ManagementObject objMO in objMOC)
        //    {
        //        if (!(bool)objMO["ipEnabled"])
        //            continue;

        //        string[] ipAddresses = (string[])objMO["IPAddress"];
        //        foreach (string sIP in ipAddresses)
        //        {
        //            IPAddress ip;
        //            if (IPAddress.TryParse(sIP, out ip))
        //            {
        //                if (ip.AddressFamily.Equals(AddressFamily.InterNetwork))
        //                    ipAddress = sIP;
        //            }
        //        }
        //    }
            
        //    ipAddress = Harddisk.FindHardDiskSerialNumber();
        //    NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        //    foreach (NetworkInterface ni in nics)
        //    {
        //        if (ni.OperationalStatus == OperationalStatus.Up)
        //        {
                    
        //            IPAddressCollection ips = ni.GetIPProperties().DnsAddresses;

        //            foreach (System.Net.IPAddress ip in ips)
        //            {
        //                if (ip.AddressFamily == AddressFamily.InterNetwork)
        //                {
        //                    string strDnsHostName = ip.ToString();
        //                    break;
        //                }
        //            }
        //        }
        //    }
        //    return ipAddress;
            


            //string strHost = string.Empty;
            //string strIPAddress = string.Empty;
            ////strHost = "www.cauvonglienket.com";
            //strHost = Dns.GetHostName();
            //IPHostEntry IPHost = Dns.GetHostEntry(strHost); // though Dns to get IP host
            //foreach (IPAddress _address in IPHost.AddressList)
            //{
            //    if (_address.AddressFamily.ToString() == "InterNetwork")
            //        strIPAddress = _address.ToString();
            //}
            //return strIPAddress;
        //}

        public static bool MakeImagesForAFile(string originalFile, string strThumb)
        {
            //Load the file
            System.Drawing.Image img = System.Drawing.Image.FromFile(originalFile);
           Size sizeOriginalImage = img.Size;	//To return as out parameter
            // strThumb += strFName;
            //string strPhoto = "C:\\Users\\hieu\\Documents\\My Web Galleries\\photos" + @"\" + strFName;
            Size sizeThumb = new Size((int)180, (int)180);  //thumbs are actually limited only by height
            ResizeAnImage(ref img, sizeThumb, strThumb, originalFile);
            //Size sizePhoto = new Size((int)720, (int)540); ;
            //bool blnSuccess = ResizeAnImage(ref img, sizePhoto, strPhoto, strFile);
            img.Dispose();
            return true; ;
        }
        //
        private static bool ResizeAnImage(ref System.Drawing.Image img, Size sizeNew, string strFile, string strOriginalFile)
        {
            int intOrigWidth = img.Width;
            int intOrigHeight = img.Height;
            int intNewWidth = sizeNew.Width;
            int intNewHeight = sizeNew.Height;
            if (intOrigWidth < intNewWidth && intOrigHeight < intNewHeight)
            {
                //image is smaller than resized should be, do nothing
                System.IO.File.Copy(strOriginalFile, strFile, true);
                return false;
            }
            else
            {
                float flWidth2Height = (float)intOrigWidth / (float)intOrigHeight;
                float flNewWidth2Height = (float)intNewWidth / (float)intNewHeight;
                if (flWidth2Height > flNewWidth2Height)
                {
                    //Horizontal, make height smaller then in spec
                    //Use width to calc the scale
                    float flScale = (float)intNewWidth / (float)intOrigWidth;
                    intNewHeight = System.Convert.ToInt32(flScale * intOrigHeight);
                }
                else
                {
                    //Vertical, make width smaller then in spec
                    //Use height to calc the scale
                    float flScale = (float)intNewHeight / (float)intOrigHeight;
                    intNewWidth = System.Convert.ToInt32(flScale * intOrigWidth);
                }
                //Make a bitmap for the result
                Image imgNew = new Bitmap(intNewWidth, intNewHeight, img.PixelFormat);
                //Make a Graphics object for the result Bitmap
                Graphics oGraphic = Graphics.FromImage(imgNew);
                oGraphic.CompositingQuality = CompositingQuality.HighQuality;
                oGraphic.SmoothingMode = SmoothingMode.HighQuality;
                oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                Rectangle oRectangle = new Rectangle(0, 0, intNewWidth, intNewHeight);
                oGraphic.DrawImage(img, oRectangle);

                // Encoder parameter for image quality (thanks Dmitry A. Mottl)
                EncoderParameter qualityParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, (long)75);
                // Jpeg image codec
                ImageCodecInfo jpegCodec = GetEncoderInfo("image/jpeg");
                EncoderParameters encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = qualityParam;
                imgNew.Save(strFile, jpegCodec, encoderParams);

                //imgNew.Save(strFile, ImageFormat.Jpeg); 
                imgNew.Dispose();
                return true;
            }
        }
        private static ImageCodecInfo GetEncoderInfo(string mimeType)
        {
            // Get image codecs for all image formats
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();

            // Find the correct image codec
            for (int i = 0; i < codecs.Length; i++)
                if (codecs[i].MimeType == mimeType)
                    return codecs[i];
            return null;
        }
    }
}