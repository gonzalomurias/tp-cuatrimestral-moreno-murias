using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace tp_cuatrimestral_moreno_murias
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)

        {

            EmailService emailService = new EmailService();
            emailService.armarCorreo("e.quickstrike@gmail.com", "Nueva consulta de la web de " + txtNombreReg.Text + " " + txtApellidoReg.Text + "", txtMensaje.Text, txtEmailReg.Text, txtTelefonoReg.Text);

            try
            {
                emailService.enviarEmail();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEnviarMensaje();", true);

        }
    }
}