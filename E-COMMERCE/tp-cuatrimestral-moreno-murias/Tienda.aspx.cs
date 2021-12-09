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
    public partial class Tienda : System.Web.UI.Page
    {
        public List<Producto> listaProductos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();

            string capturaBusqueda = Request.QueryString["search"];

            if (capturaBusqueda == null)
            {
                lblNoProducto.Visible = false;
                listaProductos = negocio.listar();
            }
            else
            {
                lblNoProducto.Visible = false;
                listaProductos = negocio.listar3(capturaBusqueda);
                if (listaProductos.Count <= 0)
                {
                    lblNoProducto.Visible = true;
                }
            }

        }
    }
}