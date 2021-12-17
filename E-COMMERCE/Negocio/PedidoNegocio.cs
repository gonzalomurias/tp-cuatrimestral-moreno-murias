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
                datos.setearConsulta("Select TOP 1 ID from PEDIDOS WHERE IDUsuario = "+aux.User.ID+" ORDER BY FechaPedido DESC");
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

        public List<Pedido> listarPedidos(int IDUsuario)
        {
            List<Pedido> lista = new List<Pedido>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT ID, Total, FechaPedido, Despachado FROM PEDIDOS WHERE IDUsuario = " + IDUsuario + "");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Pedido aux = new Pedido();

                    aux.ID = (int)datos.Lector["ID"];
                    aux.Total = (decimal)datos.Lector["Total"];
                    aux.FechaPedido = (DateTime)datos.Lector["FechaPedido"];
                    aux.Despachado = (bool)datos.Lector["Despachado"];

                    lista.Add(aux);
                }
                return lista;
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

        public List<Pedido> listarPedidos2()
        {
            List<Pedido> lista = new List<Pedido>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT P.ID as ID, P.Total as Total, P.FechaPedido as FechaPedido, P.Despachado as Despachado, U.ID as UID, U.Email AS Usuario FROM PEDIDOS P INNER JOIN USUARIOS U ON P.IDUSUARIO = U.ID ");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Pedido aux = new Pedido();

                    aux.ID = (int)datos.Lector["ID"];
                    aux.Total = (decimal)datos.Lector["Total"];
                    aux.FechaPedido = (DateTime)datos.Lector["FechaPedido"];
                    aux.Despachado = (bool)datos.Lector["Despachado"];
                    aux.User = new Usuario();
                    aux.User.ID = (int)datos.Lector["UID"];
                    aux.User.Email = (string)datos.Lector["Usuario"];

                    lista.Add(aux);
                }
                return lista;
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
        public void despachar(Pedido aux)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE PEDIDOS SET Despachado = 1 WHERE ID = @ID");
                datos.setearParametro("@ID", aux.ID);
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
