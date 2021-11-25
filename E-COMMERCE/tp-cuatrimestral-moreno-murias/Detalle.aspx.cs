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
        protected void Page_Load(object sender, EventArgs e)
        {
            TalleNegocio talleNegocio = new TalleNegocio();

            ddlTalles.DataSource = talleNegocio.listar();
            ddlTalles.DataTextField = "Numero";
            ddlTalles.DataValueField = "ID";
            ddlTalles.DataBind();
                    
             
            Producto prod = new Producto();
            ProductoNegocio negocio = new ProductoNegocio();

            if (Request.QueryString["id"] != null){
                int id = int.Parse(Request.QueryString["id"]);
                prod = negocio.listar2(id);

                NombreDetalle.InnerText = prod.Nombre;
                DescripcionDetalle.InnerText = prod.Descripcion;
                PrecioDetalle.InnerText = prod.Precio.ToString();

                
               

                

            }
            else
            {

            }

        }

        protected void btnAddCarrito_Click(object sender, EventArgs e)
        {

        }
    }
}