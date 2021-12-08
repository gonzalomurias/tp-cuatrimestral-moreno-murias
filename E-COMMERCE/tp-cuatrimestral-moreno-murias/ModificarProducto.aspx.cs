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
    public partial class ModificarProducto : System.Web.UI.Page
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

        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            int var = Convert.ToInt32((sender as Button).CommandArgument);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);


            ProductoNegocio negocio = new ProductoNegocio();
            Producto prod = new Producto();
            prod = negocio.listar2(var);

            MarcaNegocio marcaNegocio = new MarcaNegocio();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            ddlMarcas.DataSource = marcaNegocio.listar();
            ddlMarcas.DataTextField = "Nombre";
            ddlMarcas.DataValueField = "ID";
            ddlMarcas.DataBind();
            ddlCategorias.DataSource = categoriaNegocio.listar();
            ddlCategorias.DataTextField = "Nombre";
            ddlCategorias.DataValueField = "ID";
            ddlCategorias.DataBind();
            txtNombre.Text = prod.Nombre;
            txtDescripcion.Text = prod.Descripcion;
            txtPrecio.Text = prod.Precio.ToString();
            txtUrlImagen.Text = prod.UrlImagen;
            ddlMarcas.SelectedValue = prod.Marca.ID.ToString();
            ddlCategorias.SelectedValue = prod.Categoria.ID.ToString();

            Session.Add("id", var);

        }

        protected void btnAceptar2_Click(object sender, EventArgs e)
        {

            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                Producto prod = new Producto();

                prod.Nombre = txtNombre.Text;
                prod.Descripcion = txtDescripcion.Text;
                prod.Precio = decimal.Parse(txtPrecio.Text);
                prod.UrlImagen = txtUrlImagen.Text;
                Marca Mar = new Marca();
                Mar.ID = int.Parse(ddlMarcas.SelectedItem.Value);
                Mar.Nombre = ddlMarcas.SelectedItem.Text;
                prod.Marca = Mar;
                Categoria Cate = new Categoria();
                Cate.ID = int.Parse(ddlCategorias.SelectedItem.Value);
                Cate.Nombre = ddlCategorias.SelectedItem.Text;
                prod.Categoria = Cate;
                prod.ID = Convert.ToInt32(Session["id"].ToString());

                negocio.modificar(prod);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);

                

            }
            catch (Exception)
            {

                throw;
            }

        }
        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            int var = Convert.ToInt32((sender as Button).CommandArgument);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEliminacion();", true);
            Session.Add("id", var);

        }

        protected void btnAceptarEliminacion_Click(object sender, EventArgs e)
        {
            int idCapturado = Convert.ToInt32(Session["id"].ToString());
            ProductoNegocio negocioaux = new ProductoNegocio();

            negocioaux.eliminar(idCapturado);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEliminacionOK();", true);


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