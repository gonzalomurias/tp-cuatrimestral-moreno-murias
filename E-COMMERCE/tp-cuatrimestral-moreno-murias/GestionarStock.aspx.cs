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
    public partial class GestionarStock : System.Web.UI.Page
    {
        ProductoNegocio negocio = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            AllData();
        }

        private void AllData()
        {
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

        protected void btn_Stock_Click(object sender, EventArgs e)
        {
            int var = Convert.ToInt32((sender as Button).CommandArgument);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalStock();", true);

            Producto prod = new Producto();
            ProductoNegocio negocio = new ProductoNegocio();


            prod = negocio.listar2(var);
            txtNombreStock.Enabled = false;
            txtNombreStock.Text = prod.Nombre;

            TalleNegocio talleNegocio = new TalleNegocio();
            ddlTallesStock.DataSource = talleNegocio.listar();
            ddlTallesStock.DataTextField = "Numero";
            ddlTallesStock.DataValueField = "ID";
            ddlTallesStock.DataBind();

            txtStockActual.Enabled = false;
        }

        protected void btnAceptarStock_Click(object sender, EventArgs e)
        {

        }
    }
}