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
    public partial class CheckOut : System.Web.UI.Page
    {
        Direccion direc = new Direccion();
        Pedido pedido = new Pedido();
        decimal total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            FormaPagoNegocio formaPagoNegocio = new FormaPagoNegocio();
            try
            {
               if(Session["usuario"] == null)
                {
                    Session.Add("error", "Acceso Denegado");
                    Response.Redirect("Error.aspx", false);
                }
                else
                {

                    AllDataCarrito();

                    if (!IsPostBack)
                    {
                        ddlFormasPago.DataSource = formaPagoNegocio.listar();
                        ddlFormasPago.DataTextField = "Nombre";
                        ddlFormasPago.DataValueField = "ID";
                        ddlFormasPago.DataBind();
                    }


                }

                
            }
            catch (Exception)
            {

                throw;
            }

        }

        private void AllDataCarrito()
        {
            

            var lista = Session["carrito"];

            gvCarrito.DataSource = lista;
            gvCarrito.DataBind();
            gvCarrito.UseAccessibleHeader = true;
            gvCarrito.HeaderRow.TableSection = TableRowSection.TableHeader;
            gvCarrito.FooterRow.TableSection = TableRowSection.TableFooter;
            
            for (int i = 0; i < gvCarrito.Rows.Count; i++)
            {
                total += (Convert.ToDecimal(gvCarrito.Rows[i].Cells[4].Text) * Convert.ToDecimal(gvCarrito.Rows[i].Cells[5].Text));
            }
            lblTotal.Text = "$ " + total.ToString("N2");

        }
        protected void customCheck1_CheckedChanged(object sender, EventArgs e)
        {
            if(cbRetirar.Checked == true)
            {
                txtCalle.Text = " ";
                txtNumero.Text = " ";
                txtCiudad.Text = " ";
                txtCP.Text = " ";
                txtProvincia.Text = " ";
                txtPais.Text = " ";
            }
            
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            if (cbRetirar.Checked == false)
            {
                direc.Calle = txtCalle.Text;
                direc.Numero = txtNumero.Text;
                direc.Ciudad = txtCiudad.Text;
                direc.Provincia = txtProvincia.Text;
                direc.CP = txtCP.Text;
                direc.Pais = txtPais.Text;

            }
            else
            {
                 
                direc.Calle = "Av. Cabildo";
                direc.Numero = "2230";
                direc.Ciudad = "CABA";
                direc.Provincia = "Buenos Aires";
                direc.CP = "C1429";
                direc.Pais = "Argentina";
            }

            FormaPago fp = new FormaPago();
            fp.ID = int.Parse(ddlFormasPago.SelectedItem.Value);
            fp.Nombre = ddlFormasPago.SelectedItem.Text;
            pedido.FPago = fp;
            pedido.Total = total;
            
            PedidoNegocio negocio = new PedidoNegocio();
            negocio.agregar(pedido);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalPedidoOk();", true);
        }
    }
}