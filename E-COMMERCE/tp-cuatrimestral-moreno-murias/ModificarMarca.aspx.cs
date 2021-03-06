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
    public partial class ModificarMarca : System.Web.UI.Page
    {
        MarcaNegocio negocio = new MarcaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).Perfil == Dominio.Perfil.ADMIN))
            {
                Session.Add("error", "Acceso denegado, perfil no autorizado");
                Response.Redirect("Error.aspx", false);
            }
            if (txtBuscar.Text == "")
            {
                AllData();
            }
            else
            {
                AllData2();
            }
        }

        private void AllData()
        {
            lblSinProductos.Visible = false;
            var lista = negocio.listar();
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

        private void AllData2()
        {
            lblSinProductos.Visible = false;
            var lista = negocio.listar3(txtBuscar.Text);
            if (lista.Count <= 0)
            {
                lblSinProductos.Visible = true;
            }
            gvList.DataSource = lista;
            gvList.DataBind();

            gvList.UseAccessibleHeader = true;
            gvList.HeaderRow.TableSection = TableRowSection.TableHeader;
            gvList.FooterRow.TableSection = TableRowSection.TableFooter;


        }

        protected void btn_Editar_Click(object sender, EventArgs e)
        {

            int var = Convert.ToInt32((sender as Button).CommandArgument);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);


            MarcaNegocio negocio = new MarcaNegocio();
            Marca prod = new Marca();
            prod = negocio.listar2(var);
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            txtNombre.Text = prod.Nombre;

            Session.Add("id", var);

            
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            int var = Convert.ToInt32((sender as Button).CommandArgument);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEliminacion();", true);
            Session.Add("id", var);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdmin.aspx");
        }

        protected void btnAceptar2_Click(object sender, EventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            try
            {
                Marca prod = new Marca();

                prod.Nombre = txtNombre.Text;
                prod.ID = Convert.ToInt32(Session["id"].ToString());

                negocio.modificar(prod);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);



            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnAceptarEliminacion_Click(object sender, EventArgs e)
        {
            int idCapturado = Convert.ToInt32(Session["id"].ToString());
            MarcaNegocio negocioaux = new MarcaNegocio();

            negocioaux.eliminar(idCapturado);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEliminacionOK();", true);
        }
    }
}