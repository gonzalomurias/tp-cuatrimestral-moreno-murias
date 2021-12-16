using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class PedidoNegocio
    {
        public void agregar(Pedido nuevo)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into PEDIDOS (IDDireccion, IDUsuario, IDFormaPago, FechaPedido, Total) VALUES (@IDDIR, @IDUSER, @IDFP, @DATE, @Total)");
                datos.setearParametro("@IDDIR", nuevo.Direccion.ID);
                datos.setearParametro("@IDUSER", nuevo.User.ID);
                datos.setearParametro("@IDFP", nuevo.FPago.ID);
                datos.setearParametro("@DATE", nuevo.FechaPedido);
                datos.setearParametro("@Total", nuevo.Total);
                

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


        public Pedido buscarID(Pedido aux)
        {
            
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT ID FROM PEDIDOS WHERE IDUsuario = " + aux.User.ID + " AND FechaPedido = " + aux.FechaPedido + "");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    aux.ID = (int)datos.Lector["ID"];

                }


                return aux;

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
