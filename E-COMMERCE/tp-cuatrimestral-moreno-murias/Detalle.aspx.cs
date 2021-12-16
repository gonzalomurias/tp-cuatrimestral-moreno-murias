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

        private List<ItemCarrito> carrito { get; set; }


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
                    PrecioDetalle.InnerText = prod.Precio.ToString("N2");
                    Session.Add("Url_Imagen", prod.UrlImagen);


                }
                else
                {

                }

                listaProductos = negocio.listar();
                Session.Add("listaProductos", listaProductos);

                if (Session["carrito"] == null)
                {
                    carrito = new List<ItemCarrito>();
                    Session.Add("carrito", carrito);

                }


            }


        }

        protected void btnAddCarrito_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {

                string id = Request.QueryString["id"].ToString();
                carrito = (List<ItemCarrito>)Session["carrito"];
                listaProductos = (List<Producto>)Session["listaProductos"];

                Producto prod = new Producto();
                prod = listaProductos.Find(x => x.ID == int.Parse(id));
                
                ItemCarrito item = new ItemCarrito();

                if (carrito.Count() == 0)
                {
                    item.ID = carrito.Count() + 1;
                    item.Producto = prod;
                    item.Talle = ddlTalles.SelectedItem.Text;
                    item.Cantidad = int.Parse(txtCantidad.Text);
                }

                foreach (ItemCarrito aux in carrito)
                {
                    int i = 0;
                    int index = 0;

                    item.ID = carrito.Count() + 1;
                    item.Producto = prod;
                    item.Talle = ddlTalles.SelectedItem.Text;

                    if (aux.Producto.ID == item.Producto.ID && aux.Talle == item.Talle)
                    {
                        
                        item.Cantidad = int.Parse(txtCantidad.Text)+aux.Cantidad;

                        index = i;

                        i++;
                        carrito.RemoveAt(index);
                        break;
                    }
                    else
                    {
                        
                        item.Cantidad = int.Parse(txtCantidad.Text);
                    }
                }

                
                carrito.Add(item);
                Session.Add("carrito", carrito);


                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalAgregado();", true);


            }

        }

        protected void ddlTalles_SelectedIndexChanged(object sender, EventArgs e)
        {

            StockProductoNegocio negocio = new StockProductoNegocio();

            int idp = int.Parse(Request.QueryString["id"]);
            int idtalle = int.Parse(ddlTalles.SelectedItem.Value);
            int cantidad = int.Parse(txtCantidad.Text);



            if (!negocio.validarStock(idp, idtalle, cantidad))
            {
                btnAddCarrito.Text = "NO HAY STOCK";
                btnAddCarrito.Enabled = false;
            }
            else
            {
                if (cantidad != 0)
                {
                    btnAddCarrito.Text = "AGREGAR AL CARRITO";
                    btnAddCarrito.Enabled = true;
                }
                else
                {
                    btnAddCarrito.Text = "NO HAY STOCK";
                    btnAddCarrito.Enabled = false;
                }
            }

        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            StockProductoNegocio negocio = new StockProductoNegocio();
            int idp = int.Parse(Request.QueryString["id"]);
            int idtalle = int.Parse(ddlTalles.SelectedItem.Value);
            int cantidad = int.Parse(txtCantidad.Text);

            if (!negocio.validarStock(idp, idtalle, cantidad))
            {
                btnAddCarrito.Text = "NO HAY STOCK";
                btnAddCarrito.Enabled = false;
            }
            else
            {
                if (cantidad != 0)
                {
                    btnAddCarrito.Text = "AGREGAR AL CARRITO";
                    btnAddCarrito.Enabled = true;
                }
                else
                {
                    btnAddCarrito.Text = "NO HAY STOCK";
                    btnAddCarrito.Enabled = false;
                }
            }
        }
    }
}