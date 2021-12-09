using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_moreno_murias
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["carrito"] == null)
            {
                lblCarritoVacio.Visible = true;
            }
            else
            {
                AllDataCarrito();
                //lblCarritoVacio.Visible = false;
                //gvCarrito.DataSource = Session["carrito"];
                //gvCarrito.DataBind();
                ////gvCarrito.Columns[6].Visible = false;
            }
           
        }

        private void AllDataCarrito()
        {
            lblCarritoVacio.Visible = false;
            var lista = Session["carrito"];

            gvCarrito.DataSource = lista;
            gvCarrito.DataBind();
            gvCarrito.UseAccessibleHeader = true;
            gvCarrito.HeaderRow.TableSection = TableRowSection.TableHeader;
            gvCarrito.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        protected void iBtn_EliminarDelCarrito_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}