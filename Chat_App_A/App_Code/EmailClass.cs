using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for EmailClass
/// </summary>
public class EmailClass
{
    public static void SendEmailId(string ToEmail, string Subj, string Message)
    {
        MailMessage mailMessage = new MailMessage();
        mailMessage.From = new MailAddress("chatapp029@gmail.com", Subj);

        string[] Multi = ToEmail.Split(',');

        foreach (string multiemailid in Multi)
        {
            mailMessage.To.Add(new MailAddress(multiemailid));
        }

        mailMessage.Subject = Subj;
        mailMessage.Body = Message;
        mailMessage.IsBodyHtml = true;

        //Adding Multiple recipient email id logic


        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new System.Net.NetworkCredential("chatapp029@gmail.com", "Chat@12345"); // for password based authentiction schemes
        smtp.EnableSsl = true;
        smtp.Send(mailMessage);
    }
}