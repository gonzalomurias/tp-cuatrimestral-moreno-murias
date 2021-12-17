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
    public partial class MisCompras : System.Web.UI.Page
    {
        PedidoNegocio pedidoNegocio = new PedidoNegocio();
        List<Pedido> listaPedidos = new List<Pedido>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "Acceso denegado, perfil no autorizado");
                Response.Redirect("Error.aspx", false);
            }
            else
            {
                int IDUsuario;
                IDUsuario = ((Dominio.Usuario)Session["usuario"]).ID;
                listaPedidos = pedidoNegocio.listarPedidos(IDUsuario);
                gvPedidos.DataSource = listaPedidos;
                gvPedidos.DataBind();
            }
            
        }

        protected void btnDetallePedido_Click(object sender, EventArgs e)
        {
            int IDPedido = Convert.ToInt32((sender as Button).CommandArgument);
            Response.Redirect("DetallePedido.aspx?ID=" + IDPedido, false);
        }
    }
}