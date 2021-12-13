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
    public partial class GestionarUsuariosAdmin : System.Web.UI.Page
    {
        UsuarioNegocio negocio = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.Perfil.ADMIN))
            {
                Session.Add("error", "Acceso denegado, perfil no autorizado");
                Response.Redirect("Error.aspx", false);
            }

                AllData();
            
        }

        private void AllData()
        {
            lblSinProductos.Visible = false;
            var lista = negocio.listar();
            if (lista.Count <= 0)
            {
                return;
            }
            gvList.DataSource = lista;
            gvList.DataBind();

            gvList.UseAccessibleHeader = true;
            gvList.HeaderRow.TableSection = TableRowSection.TableHeader;
            gvList.FooterRow.TableSection = TableRowSection.TableFooter;


        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            int var = Convert.ToInt32((sender as Button).CommandArgument);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEliminacion();", true);
            Session.Add("id", var);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdmin.aspx");
        }


        protected void btnAceptarEliminacion_Click(object sender, EventArgs e)
        {
            int idCapturado = Convert.ToInt32(Session["id"].ToString());
            UsuarioNegocio negocioaux = new UsuarioNegocio();

            negocioaux.eliminar(idCapturado);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEliminacionOK();", true);
        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("AgregarAdmin.aspx");
        }
    }
}