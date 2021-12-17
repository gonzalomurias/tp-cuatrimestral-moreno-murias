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
    public partial class AdministrarPedidos : System.Web.UI.Page
    {
        PedidoNegocio pedidoNegocio = new PedidoNegocio();
        List<Pedido> listaPedidos = new List<Pedido>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.Perfil.ADMIN))
            {
                Session.Add("error", "Acceso denegado, perfil no autorizado");
                Response.Redirect("Error.aspx", false);
            }
            else
            {
                AllData();
            }
        }

        private void AllData()
        {
            lblSinPedidos.Visible = false;
            var lista = pedidoNegocio.listarPedidos2();
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



        protected void btnDetallePedido_Click(object sender, EventArgs e)
        {
            int IDPedido = Convert.ToInt32((sender as Button).CommandArgument);
            Response.Redirect("DetallePedido2.aspx?ID=" + IDPedido, false);
        }

        protected void btn_Despachar_Click(object sender, EventArgs e)
        {
            PedidoNegocio negocio = new PedidoNegocio();
            Pedido venta = new Pedido();
            Button button = sender as Button;
            try
            {
                venta.ID = Convert.ToInt32(button.CommandArgument);

                negocio.despachar(venta);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            Response.Redirect("AdministrarPedidos.aspx", false);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdmin.aspx");
        }
    }
}