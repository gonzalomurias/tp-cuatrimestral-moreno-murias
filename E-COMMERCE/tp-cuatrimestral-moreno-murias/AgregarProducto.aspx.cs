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
                    ddlMarcas.DataTextField = "NOMBRE";
                    ddlMarcas.DataValueField = "ID";
                    ddlMarcas.DataBind();
                    ddlCategorias.DataSource = categorianeg.listar();
                    ddlCategorias.DataTextField = "NOMBRE";
                    ddlCategorias.DataValueField = "ID";
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
            ProductoNegocio negocio = new ProductoNegocio();

            try
            {
                Producto prod = new Producto();

                prod.Nombre = txtNombre.Text;
                prod.Descripcion = txtDescripcion.Text;
                prod.Precio = decimal.Parse(txtPrecio.Text);
                prod.UrlImagen = txtUrlImagen.Text;
                prod.Marca = ddlMarcas.SelectedItem.Value;
                prod.Categoria = ddlCategorias.SelectedItem.Value;

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}