using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace Negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("e.quickstrike@gmail.com", "quickstrike123");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void armarCorreo(string emailDestino, string Asunto, string Cuerpo, string emailRemitente, string telefono)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@quickstrike.com");
            email.To.Add(emailDestino);
            email.Subject = Asunto;
            email.IsBodyHtml = true;
            email.Body = Cuerpo + "<br/>" + "Contacto: <br/>" + "Email: " + emailRemitente + "<br/>" + "Teléfono: " + telefono + "";
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }



    }
}
