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
    public partial class ModificarProducto : System.Web.UI.Page
    {
        ProductoNegocio negocio = new ProductoNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            AllData();
        }

        private void AllData()
        {
            var lista = negocio.listar();
            if(lista.Count <= 0)
            {
                return;
            }
            gvList.DataSource = lista;
            gvList.DataBind();

            gvList.UseAccessibleHeader = true;
            gvList.HeaderRow.TableSection = TableRowSection.TableHeader;
            gvList.FooterRow.TableSection = TableRowSection.TableFooter;


        }

        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AgregarProducto");
        }

        protected void btn_Editar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("/AgregarProducto");
        }
    }
    
}