﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_cuatrimestral_moreno_murias
{
    public partial class Carrito : System.Web.UI.Page
    {

        public List<ItemCarrito> carrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["carrito"] == null )
            {
                lblCarritoVacio.Visible = true;
                lblTotal.Visible = false;
                lblTotal1.Visible = false;
            }
            else
            {
                AllDataCarrito();
          
            }
           
        }

        private void AllDataCarrito()
        {
            lblCarritoVacio.Visible = false;
            lblTotal.Visible = true;
            lblTotal1.Visible = true;

            var lista = Session["carrito"];

            gvCarrito.DataSource = lista;
            gvCarrito.DataBind();
            gvCarrito.UseAccessibleHeader = true;
            gvCarrito.HeaderRow.TableSection = TableRowSection.TableHeader;
            gvCarrito.FooterRow.TableSection = TableRowSection.TableFooter;
            decimal total = 0;
            for (int i = 0; i < gvCarrito.Rows.Count; i++)
            {
                total += (Convert.ToDecimal(gvCarrito.Rows[i].Cells[4].Text) * Convert.ToDecimal(gvCarrito.Rows[i].Cells[5].Text));
            }
            lblTotal.Text = "$ "+ total.ToString("N2");
        }

        protected void iBtn_EliminarDelCarrito_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton button = sender as ImageButton;
            ItemCarrito Item = new ItemCarrito();
            try
            {
                
                Item.ID = Convert.ToInt32(button.CommandArgument);
                carrito = (List<ItemCarrito>)Session["carrito"];
                int i = 0;
                int index = 0;
                foreach (Dominio.ItemCarrito item in carrito)
                {
                    if (Item.ID == item.ID)
                    {
                        index = i;
                    }
                    i++;
                }
                carrito.RemoveAt(index);
                Session.Add("carrito", carrito);
                if (carrito.Count() == 0)
                {
                    Session["carrito"] = null;

                }
                Response.Redirect("Carrito.aspx");
            }
            catch (Exception)
            {

                throw;
            }
            
        }
    }
}