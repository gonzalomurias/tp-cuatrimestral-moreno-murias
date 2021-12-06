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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPass.Text;

                if (negocio.IniciarSesion(usuario))
                {
                    Session.Add("usuario", usuario);
                    if (usuario.Perfil == Dominio.Perfil.ADMIN)
                    {
                        Response.Redirect("HomeAdmin.aspx");
                    }
                    else
                    {
                        Response.Redirect("Tienda.aspx");
                    }
                    
                }
                else
                {
                    Session.Add("error", "Usuario o Contraseña incorrectos.");
                    Response.Redirect("Error.aspx");
                        
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                throw ex;
            }
        }
    }
}