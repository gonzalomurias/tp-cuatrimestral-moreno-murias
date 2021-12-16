using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class StockProductoNegocio
    {
        public StockProducto listar(int idProdAux, int idTalleAux)
        {
            StockProducto aux = new StockProducto();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT P.ID as PID, P.NOMBRE as PNOM, T.ID as TID, T.NUMERO as TNUM, ST.ID as STID, ST.CANTIDAD as STCANT FROM PRODUCTOS P INNER JOIN STOCK_X_TALLE ST ON ST.IDProducto = P.ID INNER JOIN TALLES T ON T.ID = ST.IDTalle WHERE P.ID =" + idProdAux + "AND T.ID =" + idTalleAux + "");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {

                    aux.ID = (int)datos.Lector["STID"];
                    aux.Cantidad = (int)datos.Lector["STCANT"];

                    aux.Producto = new Producto();
                    aux.Producto.ID = (int)datos.Lector["PID"];
                    aux.Producto.Nombre = (string)datos.Lector["PNOM"];

                    aux.Talle = new Talle();
                    aux.Talle.ID = (int)datos.Lector["TID"];
                    aux.Talle.Numero = (int)datos.Lector["TNUM"];
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

        public void grabarStock(StockProducto stock)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO STOCK_X_TALLE(IDProducto, IDTalle, Cantidad) VALUES (@IDProducto, @IDTalle, @Cantidad)");
                datos.setearParametro("@IDProducto", stock.Producto.ID);
                datos.setearParametro("@IDTalle", stock.Talle.ID);
                datos.setearParametro("@Cantidad", stock.Cantidad);
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

        public bool validarStock(int idProdAux, int idTalleAux, int cant)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT ST.CANTIDAD as STCANT FROM PRODUCTOS P INNER JOIN STOCK_X_TALLE ST ON ST.IDProducto = P.ID INNER JOIN TALLES T ON T.ID = ST.IDTalle WHERE P.ID =" + idProdAux + "AND T.ID =" + idTalleAux + " and ST.CANTIDAD >= " + cant + "");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    return true;
                }

                return false;
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

        public void descontarStock(int IDProducto, int IDTalle, int cantidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE STOCK_X_TALLE SET Cantidad = Cantidad - " + cantidad + "WHERE IDProducto = " + IDProducto + " AND IDTalle = '" + IDTalle + "'");
                datos.setearParametro("@IDProducto", IDProducto);
                datos.setearParametro("@IDTalle", IDTalle);
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
