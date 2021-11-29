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
    public partial class Detalle : System.Web.UI.Page
    {
        public List<Producto> listaProductos { get; set; }
        private List<Producto> carrito;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                TalleNegocio talleNegocio = new TalleNegocio();

                ddlTalles.DataSource = talleNegocio.listar();
                ddlTalles.DataTextField = "Numero";
                ddlTalles.DataValueField = "ID";
                ddlTalles.DataBind();

                btnAddCarrito.Enabled = false;

                Producto prod = new Producto();
                ProductoNegocio negocio = new ProductoNegocio();

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    prod = negocio.listar2(id);

                    NombreDetalle.InnerText = prod.Nombre;
                    DescripcionDetalle.InnerText = prod.Descripcion;
                    PrecioDetalle.InnerText = prod.Precio.ToString();
                    Session.Add("Url_Imagen", prod.UrlImagen);


                }
                else
                {

                }

                listaProductos = negocio.listar();
                Session.Add("listaProductos", listaProductos);

                if(Session["carrito"] == null)
                {
                    carrito = new List<Producto>();
                    Session.Add("carrito", carrito);

                }
                
                
            }
            

        }

        protected void btnAddCarrito_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                
                string id = Request.QueryString["id"].ToString();
                carrito = (List<Producto>)Session["carrito"];
                listaProductos = (List<Producto>)Session["listaProducto"];
                carrito.Add(listaProductos.Find(x => x.ID == int.Parse(id)));
                Session.Add("carrito", carrito);
            }

        }

        protected void ddlTalles_SelectedIndexChanged(object sender, EventArgs e)
        {

            StockProductoNegocio negocio = new StockProductoNegocio();

            int idp = int.Parse(Request.QueryString["id"]);
            int idtalle = int.Parse(ddlTalles.SelectedItem.Value);

            if(!negocio.validarStock(idp, idtalle))
            {
                btnAddCarrito.Text = "NO HAY STOCK";
                btnAddCarrito.Enabled = false;
            }
            else
            {
                btnAddCarrito.Text = "AGREGAR AL CARRITO";
                btnAddCarrito.Enabled = true;
            }

        }
    }
}