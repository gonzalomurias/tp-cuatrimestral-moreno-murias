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
    public partial class DetallePedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int IDPedido = int.Parse(Request.QueryString["ID"]);
            CarroNegocio negocio = new CarroNegocio();

            List<Carro> lista = new List<Carro>();
            lista = negocio.listar(IDPedido);
            gvDetallePedido.DataSource = lista;
            gvDetallePedido.DataBind();

        }
    }
}