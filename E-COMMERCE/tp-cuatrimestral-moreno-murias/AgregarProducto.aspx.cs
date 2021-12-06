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
            if (!(Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.Perfil.ADMIN))
            {
                Session.Add("error", "Acceso denegado, perfil no autorizado");
                Response.Redirect("Error.aspx", false);
            }

            MarcaNegocio marcaneg = new MarcaNegocio();
            CategoriaNegocio categorianeg = new CategoriaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    ddlMarcas.DataSource = marcaneg.listar();
                    ddlMarcas.DataTextField = "Nombre";
                    ddlMarcas.DataValueField = "ID";
                    ddlMarcas.DataBind();
                    ddlCategorias.DataSource = categorianeg.listar();
                    ddlCategorias.DataTextField = "Nombre";
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
                Marca Mar = new Marca();
                Mar.ID=int.Parse(ddlMarcas.SelectedItem.Value);
                Mar.Nombre = ddlMarcas.SelectedItem.Text;
                prod.Marca = Mar;
                Categoria Cate = new Categoria();
                Cate.ID= int.Parse(ddlCategorias.SelectedItem.Value);
                Cate.Nombre = ddlCategorias.SelectedItem.Text;
                prod.Categoria = Cate;

                
                negocio.agregar(prod);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalAgregar();", true);

            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdmin.aspx");
        }
    }
}