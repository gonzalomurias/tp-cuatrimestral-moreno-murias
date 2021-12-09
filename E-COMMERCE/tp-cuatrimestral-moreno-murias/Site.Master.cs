using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_cuatrimestral_moreno_murias
{
    public partial class SiteMaster : MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("Tienda.aspx", false);
        }

        protected void ibtnCarrito_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Carrito.aspx", false);
        }

        protected void btnVerPanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdmin.aspx", false);
        }

        protected void btnBuscarWeb_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tienda.aspx?search=" + txtBuscarWeb.Text + "");
        }
        public TextBox TxtBox
        {
            get { return txtBuscarWeb; }
            set { txtBuscarWeb = value; }
        }
    }
}