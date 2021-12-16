using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ItemCarritoNegocio
    {
        public List<ItemCarrito> listar()
        {
            List<ItemCarrito> lista = new List<ItemCarrito>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select IC.ID as IDIC, P.ID AS IDP, IC.Cantidad AS CANTIDAD, IC.Talle AS TALLE from ITEMCARRITO IC inner join PRODUCTOS P on  IC.ID=P.ID");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    ItemCarrito itemCarrito = new ItemCarrito();

                    itemCarrito.ID = (int)datos.Lector["IDIC"];
                    itemCarrito.Producto = new Producto();
                    itemCarrito.Producto.ID = (int)datos.Lector["IDP"];
                    itemCarrito.Cantidad = (int)datos.Lector["CANTIDAD"];
                    itemCarrito.Talle = (string)datos.Lector["TALLE"];

                    lista.Add(itemCarrito);
                }

                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();

            }
            
        }

        public void guardar(ItemCarrito item)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO ITEMCARRITO(IDProducto, Cantidad, Talle) VALUES (@IDProducto, @Cantidad, @Talle");
                datos.setearParametro("@IDProducto", item.Producto.ID);
                datos.setearParametro("@Cantidad", item.Cantidad);
                datos.setearParametro("Talle", item.Talle);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();

            }
        }


    }

    
}
