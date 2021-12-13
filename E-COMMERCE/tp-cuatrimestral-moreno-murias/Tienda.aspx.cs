using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using X.PagedList;

namespace tp_cuatrimestral_moreno_murias
{
    public partial class Tienda : System.Web.UI.Page
    {
        public List<Producto> listaProductos { get; set; }
        public List<Categoria> listaCategorias { get; set; }

        public List<Marca> listaMarcas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            CategoriaNegocio negocioCategoria = new CategoriaNegocio();
            MarcaNegocio negocioMarca = new MarcaNegocio();

            listaCategorias = negocioCategoria.listar();
            listaMarcas = negocioMarca.listar();

            string capturaBusqueda = Request.QueryString["search"];

            string capturaCategoria = Request.QueryString["categoria"];

            string capturaMarca = Request.QueryString["marca"];

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

            if (capturaCategoria != null)
            {
                lblNoProducto.Visible = false;
                listaProductos = negocio.listar4(capturaCategoria);
                if (listaProductos.Count <= 0)
                {
                    lblNoProducto.Visible = true;
                }
            }

            if (capturaMarca != null)
            {
                lblNoProducto.Visible = false;
                listaProductos = negocio.listar5(capturaMarca);
                if (listaProductos.Count <= 0)
                {
                    lblNoProducto.Visible = true;
                }
            }

        }

        


    }
}