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
    public partial class AgregarAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.Perfil.ADMIN))
            {
                Session.Add("error", "Acceso denegado, perfil no autorizado");
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionarUsuariosAdmin.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
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

                usuarioNegocioAux.agregar2(nuevoUser);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalAgregar();", true);

            }
        }
    }
}