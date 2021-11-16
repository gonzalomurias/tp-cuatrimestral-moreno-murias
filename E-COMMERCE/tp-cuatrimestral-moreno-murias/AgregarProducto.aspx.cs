using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace tp_cuatrimestral_moreno_murias
{
    public partial class AgregarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaneg = new MarcaNegocio();
            CategoriaNegocio categorianeg = new CategoriaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    ddlMarcas.DataSource = marcaneg.listar();
                    ddlMarcas.DataBind();
                    ddlCategorias.DataSource = categorianeg.listar();
                    ddlCategorias.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

        }
    }
}