using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace tp_cuatrimestral_moreno_murias
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            UsuarioNegocio userNegocio = new UsuarioNegocio();
            if (userNegocio.validar(txtEmailReg.Text))
            {
                Session.Add("error", "Email ya registrado");
                Response.Redirect("Error.aspx");
            }
            else
            {
                Usuario nuevoUser = new Usuario();
                nuevoUser.Nombre = txtNombreReg.Text;
                nuevoUser.Apellido = txtApellidoReg.Text;
                nuevoUser.DNI = txtDniReg.Text;
                nuevoUser.Email = txtEmailReg.Text;
                nuevoUser.Telefono = txtTelefonoReg.Text;
                nuevoUser.Pass = txtPasswordReg.Text;

                UsuarioNegocio usuarioNegocioAux = new UsuarioNegocio();

                usuarioNegocioAux.agregar(nuevoUser);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalRegistrarse();", true);


            }
        }
    }
}