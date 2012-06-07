using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.Configuration;
using System.Net.Configuration;
using System.Configuration;
using CVLK2011.Models;
using System.Net.Mail;
using System.Text;
namespace CVLK2011.HtmlHelpers
{
    public class MailHelper
    {

        public static bool Send(String mailSubject, String mailcontent, params String[] MailTo)
        {
            try
            {
                DBContainer ctx = new DBContainer();
                String mailFrom = String.Empty;
                String mailTo1 = String.Empty;
                String mailTo2 = String.Empty;
                String pwdMailFrom = String.Empty;
                String userName = String.Empty;
                int port = 0;
                String host = String.Empty;
                GetEmailConfigSupport_Result support = ctx.GetEmailConfigSupport().FirstOrDefault<GetEmailConfigSupport_Result>();
                if (support != null)
                {
                    EnCrypto cript = new EnCrypto();
                    mailFrom = support.OSEmailFrom.Trim();
                    pwdMailFrom =cript.Decrypt(support.OSPwdEmailFrom).Trim();
                    port = Convert.ToInt32(support.OSPort.Trim());
                    host = support.OSHost.Trim();
                    //userName = mailFrom.Substring(0, mailFrom.IndexOf("@"));
                    userName = mailFrom;


                }
                else
                {
                    Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                    MailSettingsSectionGroup setting = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");
                    port = Convert.ToInt32(setting.Smtp.Network.Port.ToString());
                    host = setting.Smtp.Network.Host;
                    string username = setting.Smtp.Network.UserName;
                    pwdMailFrom = setting.Smtp.Network.Password.Trim();
                    mailFrom = setting.Smtp.From;
                }

                //mail message
                MailMessage mailmsg = new MailMessage();
                //mail address
                MailAddress mailAddr = new MailAddress(mailFrom);
                mailmsg.From = mailAddr;
                foreach (String mailto in MailTo)
                {
                    mailmsg.To.Add(mailto);
                }
                //mail subject
                mailmsg.Subject = mailSubject;
                //create mail body
                StringBuilder sbBody = new StringBuilder();
                sbBody.Append("\n");
                sbBody.Append(mailcontent);
                sbBody.Append("\n");
                mailmsg.Body = sbBody.ToString();
                mailmsg.IsBodyHtml = false;
               // mailmsg.BodyEncoding = System.Text.Encoding.Unicode;
                //client 
                SmtpClient stmp = new SmtpClient();
                stmp.DeliveryMethod = SmtpDeliveryMethod.Network;
                stmp.Host = host;
                stmp.Port = port;
                stmp.UseDefaultCredentials = false;
                stmp.Credentials = new NetworkCredential(userName, pwdMailFrom);
                stmp.EnableSsl = true;
                stmp.Send(mailmsg);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Receive(String mailSubject, String mailcontent)
        {

            try
            {
                DBContainer ctx = new DBContainer();
                String mailFrom = String.Empty;
                String mailTo1 = String.Empty;
                String mailTo2 = String.Empty;
                String pwdMailFrom = String.Empty;
                String userName = String.Empty;
                int port = 0;
                String host = String.Empty;
                GetEmailConfigSupport_Result support = ctx.GetEmailConfigSupport().FirstOrDefault<GetEmailConfigSupport_Result>();
                if (support != null)
                {

                    EnCrypto cript = new EnCrypto();
                    mailFrom = support.OSEmailFrom.Trim();
                    pwdMailFrom = cript.Decrypt(support.OSPwdEmailFrom).Trim();
                    mailTo1 = support.OSEmailTo1.Trim();
                    if(!String.IsNullOrEmpty(support.OSEmailTo2))
                         mailTo2 = support.OSEmailTo2.Trim();
                    port = Convert.ToInt32(support.OSPort.Trim());
                    host = support.OSHost.Trim();
                    //userName = mailFrom.Substring(0, mailFrom.IndexOf("@"));
                    userName = mailFrom;

                }
                else
                {
                    Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                    MailSettingsSectionGroup setting = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");
                    port = Convert.ToInt32(setting.Smtp.Network.Port.ToString());
                    host = setting.Smtp.Network.Host;
                    string username = setting.Smtp.Network.UserName;
                    pwdMailFrom = setting.Smtp.Network.Password.Trim();
                    mailFrom = setting.Smtp.From;
                }

                //mail message
                MailMessage mailmsg = new MailMessage();
                //mail address
                MailAddress mailAddr = new MailAddress(mailFrom);
                mailmsg.From = mailAddr;
                mailmsg.To.Add(mailTo1);
                if (!String.IsNullOrEmpty(mailTo2))
                    mailmsg.To.Add(mailTo2);
                //mail subject
                mailmsg.Subject = mailSubject;
                //create mail body
                StringBuilder sbBody = new StringBuilder();
                sbBody.Append("\n");
                sbBody.Append(mailcontent);
                sbBody.Append("\n");
                mailmsg.Body = sbBody.ToString();
                mailmsg.IsBodyHtml = false;
                //mailmsg.BodyEncoding = System.Text.Encoding.Unicode;
                //client 
                SmtpClient stmp = new SmtpClient();
                stmp.DeliveryMethod = SmtpDeliveryMethod.Network;
                stmp.Host = host;
                stmp.Port = port;
                stmp.UseDefaultCredentials = false;
                stmp.Credentials = new NetworkCredential(userName, pwdMailFrom);
                stmp.EnableSsl = true;
                stmp.Send(mailmsg);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool ReceiveByEmail(String mailSubject, String mailcontent,String mailto)
        {

            try
            {
                DBContainer ctx = new DBContainer();
                String mailFrom = String.Empty;
                String mailTo1 = String.Empty;
                String mailTo2 = String.Empty;
                String pwdMailFrom = String.Empty;
                String userName = String.Empty;
                int port = 0;
                String host = String.Empty;
                GetEmailConfigSupport_Result support = ctx.GetEmailConfigSupport().FirstOrDefault<GetEmailConfigSupport_Result>();
                if (support != null)
                {

                    EnCrypto cript = new EnCrypto();
                    mailFrom = support.OSEmailFrom.Trim();
                    pwdMailFrom = cript.Decrypt(support.OSPwdEmailFrom).Trim();
                    //mailTo1 = support.OSEmailTo1.Trim();
                    //mailTo2 = support.OSEmailTo2.Trim();
                    port = Convert.ToInt32(support.OSPort.Trim());
                    host = support.OSHost.Trim();
                    //userName = mailFrom.Substring(0, mailFrom.IndexOf("@"));
                    userName = mailFrom;

                }
                else
                {
                    Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                    MailSettingsSectionGroup setting = (MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");
                    port = Convert.ToInt32(setting.Smtp.Network.Port.ToString());
                    host = setting.Smtp.Network.Host;
                    string username = setting.Smtp.Network.UserName;
                    pwdMailFrom = setting.Smtp.Network.Password.Trim();
                    mailFrom = setting.Smtp.From;
                }

                //mail message
                MailMessage mailmsg = new MailMessage();
                //mail address
                mailTo1 = mailto.Trim();
                MailAddress mailAddr = new MailAddress(mailFrom);
                mailmsg.From = mailAddr;
                mailmsg.To.Add(mailTo1);
                if (!String.IsNullOrEmpty(mailTo2))
                    mailmsg.To.Add(mailTo2);
                //mail subject
                mailmsg.Subject = mailSubject;
                //create mail body
                StringBuilder sbBody = new StringBuilder();
                sbBody.Append("\n");
                sbBody.Append(mailcontent);
                sbBody.Append("\n");
                mailmsg.Body = sbBody.ToString();
                mailmsg.IsBodyHtml = false;
                //mailmsg.BodyEncoding = System.Text.Encoding.Unicode;
                //client 
                SmtpClient stmp = new SmtpClient();
                stmp.DeliveryMethod = SmtpDeliveryMethod.Network;
                stmp.Host = host;
                stmp.Port = port;
                stmp.UseDefaultCredentials = false;
                stmp.Credentials = new NetworkCredential(userName, pwdMailFrom);
                stmp.EnableSsl = true;
                stmp.Send(mailmsg);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}