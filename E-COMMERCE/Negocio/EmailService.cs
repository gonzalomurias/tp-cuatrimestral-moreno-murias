using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using Dominio;

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

        public void armarCorreoUsuario(string emailDestino, Pedido pedido)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@quickstrike.com");
            email.To.Add(emailDestino);
            email.Subject = "CONFIRMACION PEDIDO N°" + pedido.ID;
            email.IsBodyHtml = true;  
            email.Body = "<h1> CONFIRMACIÓN DE PEDIDO #" + pedido.ID + "</h1>" +
                "<hr/>" +
                "<h2>¡Hola " + pedido.User.Nombre + ", gracias por tu compra! </h2>"+
                "<h4>DETALLE DEL PEDIDO</h4>"+
                 "Total: " + pedido.Total + "<br/>" +
                " Medio de pago: " +pedido.FPago.Nombre+ "<br/><br/>" +
                "<hr/>"+
                "Si elegiste TRANSFERENCIA BANCARIA recuerda enviar el comprobante. </br>"+
                " <h6>BANCO SANTADER RÍO  </h6>" +
                " <h6> CBU: 0720480188000000592662  </h6>" +
                " <h6>Alias: quickstrike.store  </h6>" +
                " <h6> TIPO DE CUENTA: Cuenta Corriente  </h6>" +
                " <h6>NRO DE CUENTA: 5962 / 04  </h6>" +
                " <h6> SUCURSAL: 480  </h6>" +
                " <h6>TITULARES: QUICKSTRIKE STORE </h6>" +
                "<br/>" +
                " Si elegiste otro medio de pago en las próximas horas te enviaremos un link de pago. <br/> <br/>" +
                " <img src=\"https://i.ibb.co/nM3b0Xp/Recurso-1.png\" width =\"200\" > ";
        }

        public void armarCorreoEmpresa(Pedido pedido)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@quickstrike.com");
            email.To.Add("e.quickstrike@gmail.com");
            email.Subject = "NUEVO PEDIDO - #" + pedido.ID;
            email.IsBodyHtml = true;
            email.Body = "<h1> NUEVO PEDIDO #" + pedido.ID + "</h1>" +
                "<hr/>" +
                "<h4>DETALLE DEL PEDIDO</h4>" +
                "Usuario: " + pedido.User.Email +"<br/>" +
                "Fecha: " + pedido.FechaPedido + "<br/>" +
                "Total: " + pedido.Total + "<br/>" +
                "Medio de pago: " + pedido.FPago.Nombre + "<br/>" +
                "Entrega en: " + pedido.Direccion.Calle + " " + pedido.Direccion.Numero + ", "+ pedido.Direccion.Ciudad +", "+pedido.Direccion.Provincia+ " <br/><br/>"+

                " <img src=\"https://i.ibb.co/nM3b0Xp/Recurso-1.png\" width =\"200\" > ";
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
