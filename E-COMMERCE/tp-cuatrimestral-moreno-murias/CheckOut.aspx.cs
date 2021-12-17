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

            decimal envio;

            if (CheckBox2.Checked==false)
            {
                lblTotal.Text = "$ " + total.ToString("N2");
            }
            else
            {
                envio = 500;
                total = total + envio;
                Label2.Text = "$ " + envio.ToString("N2");
                lblTotal.Text = "$ " + total.ToString("N2");
            }

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

            DireccionNegocio dirNeg = new DireccionNegocio();

            if (cbRetirar.Checked == false)
            {
               

                direc.Calle = txtCalle.Text;
                direc.Numero = txtNumero.Text;
                direc.Ciudad = txtCiudad.Text;
                direc.Provincia = txtProvincia.Text;
                direc.CP = txtCP.Text;
                direc.Pais = txtPais.Text;
                dirNeg.guardar(direc);

            }
            else
            {
               

                direc.Calle = "Av. Cabildo";
                direc.Numero = "2230";
                direc.Ciudad = "CABA";
                direc.Provincia = "Buenos Aires";
                direc.CP = "C1429";
                direc.Pais = "Argentina";

                dirNeg.guardar(direc);
            }


            FormaPago fp = new FormaPago();
            fp.ID = int.Parse(ddlFormasPago.SelectedItem.Value);
            fp.Nombre = ddlFormasPago.SelectedItem.Text;
            pedido.FPago = fp;
            pedido.Total = total;
            Direccion dir = new Direccion();
            dir = dirNeg.buscarID(direc.Calle, direc.Numero, direc.Ciudad, direc.Provincia, direc.CP, direc.Pais);
            pedido.Direccion = dir;
            Usuario usuario = new Usuario();

            pedido.User= ((Dominio.Usuario)Session["usuario"]);
            pedido.FechaPedido = DateTime.Now;
            PedidoNegocio negocio = new PedidoNegocio();
            negocio.agregar(pedido);
            List<ItemCarrito> listacarrito = new List<ItemCarrito>();
            listacarrito = (List<ItemCarrito>)Session["carrito"];
            
            pedido = negocio.buscarID(pedido);

            foreach(ItemCarrito item in listacarrito)
            {
                ItemCarritoNegocio itemCarritoNegocio = new ItemCarritoNegocio();
                ItemCarrito itemaux = new ItemCarrito();           
                itemCarritoNegocio.guardar(item);

                itemaux = itemCarritoNegocio.buscarID(item);
                CarroNegocio carroNegocio = new CarroNegocio();
                Carro carro = new Carro();

                carro.pedido = pedido;
                carro.producto = itemaux;

                carroNegocio.guardar(carro);
                
                  


                StockProductoNegocio stocknegocio = new StockProductoNegocio();
                TalleNegocio tallenegocio = new TalleNegocio();
                int id = tallenegocio.buscarID(item.Talle);
                stocknegocio.descontarStock(item.Producto.ID, id, item.Cantidad);
            }

            EmailService emailService = new EmailService();
            emailService.armarCorreoUsuario((((Dominio.Usuario)Session["usuario"]).Email), pedido);
            emailService.enviarEmail();
            emailService.armarCorreoEmpresa(pedido);
            emailService.enviarEmail();
        
            Session.Remove("carrito");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalPedidoOk();", true);
            
            
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked == true)
            {
                txtCalle.ReadOnly = false;
                txtNumero.ReadOnly = false;
                txtCiudad.ReadOnly = false;
                txtCP.ReadOnly = false;
                txtProvincia.ReadOnly = false;
                txtPais.ReadOnly = false;
            }
            else
            {
                txtCalle.ReadOnly = true;
                txtNumero.ReadOnly = true;
                txtCiudad.ReadOnly = true;
                txtCP.ReadOnly = true;
                txtProvincia.ReadOnly = true;
                txtPais.ReadOnly = true;
            }
        }
    }
}