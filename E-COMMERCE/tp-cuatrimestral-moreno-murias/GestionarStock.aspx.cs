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
            if (!(Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.Perfil.ADMIN))
            {
                Session.Add("error", "Acceso denegado, perfil no autorizado");
                Response.Redirect("Error.aspx", false);
            }
            if (txtBuscar.Text == "")
            {
                AllData();
            }
            else
            {
                AllData2();
            }
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

        private void AllData2()
        {
            lblSinProductos.Visible = false;
            var lista = negocio.listar3(txtBuscar.Text);
            if (lista.Count <= 0)
            {
                lblSinProductos.Visible = true;
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

            Session.Add("idproducto", prod.ID);

            Session.Add("prod", prod);
            

            txtNombreStock.Enabled = false;
            txtNombreStock.Text = prod.Nombre;

            int idProdAux = prod.ID;

            TalleNegocio talleNegocio = new TalleNegocio();
            ddlTallesStock.DataSource = talleNegocio.listar();
            ddlTallesStock.DataTextField = "Numero";
            ddlTallesStock.DataValueField = "ID";
            ddlTallesStock.DataBind();

            int idTalleAux = int.Parse(ddlTallesStock.SelectedItem.Value);
            txtStockActual.Enabled = false;
            StockProducto stockProductoAux = new StockProducto();
            StockProductoNegocio stockProductoNegocioAux = new StockProductoNegocio();
            stockProductoAux = stockProductoNegocioAux.listar(idProdAux, idTalleAux);
            txtStockActual.Text = stockProductoAux.Cantidad.ToString();

        }

        protected void btnAceptarStock_Click(object sender, EventArgs e)
        {
            StockProductoNegocio negocio = new StockProductoNegocio();

            try
            {
                if (txtStockNuevo.Text != "")
                {
                    StockProducto stock = new StockProducto();
                    Producto prod = new Producto();
                    prod = (Dominio.Producto)Session["prod"];
                    stock.Producto = prod;
                    Talle talle = new Talle();
                    talle.ID = int.Parse(ddlTallesStock.SelectedItem.Value);
                    talle.Numero = int.Parse(ddlTallesStock.SelectedItem.Text);
                    stock.Talle = talle;
                    stock.Cantidad = int.Parse(txtStockNuevo.Text);

                    negocio.grabarStock(stock);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalconfStock();", true);
                }
                
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        protected void ddlTallesStock_SelectedIndexChanged(object sender, EventArgs e)
        {

            int Idaux = Convert.ToInt32(Session["idproducto"].ToString());

            int idTalleAux = int.Parse(ddlTallesStock.SelectedItem.Value);
            txtStockActual.Enabled = false;
            StockProducto stockProductoAux = new StockProducto();
            StockProductoNegocio stockProductoNegocioAux = new StockProductoNegocio();
            stockProductoAux = stockProductoNegocioAux.listar(Idaux, idTalleAux);
            txtStockActual.Text = stockProductoAux.Cantidad.ToString();

        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdmin.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }
    }
}