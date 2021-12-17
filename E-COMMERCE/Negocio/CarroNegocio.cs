using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class CarroNegocio
    {

        public List<Carro> listar(int IDPedido)
        {
            List<Carro> lista = new List<Carro>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select P.Nombre as Nombre, IC.Cantidad AS Cantidad, IC.Talle as Talle, P.Precio as Precio, P.URL_Imagen as URL_Imagen from CARRITO C INNER JOIN ITEMCARRITO IC ON C.IDItemCarrito = IC.ID INNER JOIN PRODUCTOS P ON IC.IDProducto = P.ID INNER JOIN PEDIDOS PS ON PS.ID = C.IDPedido WHERE  C.IDPedido = " + IDPedido + "");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Carro carro = new Carro();

                    carro.producto = new ItemCarrito();
                    carro.producto.Producto = new Producto();
                    
                    
                    carro.producto.Producto.Nombre = (string)datos.Lector["Nombre"];
                    carro.producto.Cantidad = (int)datos.Lector["Cantidad"];
                    carro.producto.Talle = (string)datos.Lector["Talle"];
                    carro.producto.Producto.UrlImagen = (string)datos.Lector["URL_Imagen"];
                    
                    carro.producto.Producto.Precio = (decimal)datos.Lector["Precio"];
                    lista.Add(carro);
                }
                return lista;
            }
            catch (Exception)
            {

                throw;
            }

        }
        public void guardar(Carro aux)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO CARRITO (IDItemCarrito, IDPedido) VALUES (@IDItemCarrito, @IDPedido) ");
                datos.setearParametro("@IDItemCarrito", aux.producto.ID);
                datos.setearParametro("@IDPedido", aux.pedido.ID);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
