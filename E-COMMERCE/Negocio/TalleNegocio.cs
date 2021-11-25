using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class TalleNegocio
    {
        public List<Talle> listar()

        {
            List<Talle> lista = new List<Talle>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id, Numero from Talles"); // falta stock
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Talle aux = new Talle();
                    aux.ID = (int)datos.Lector["Id"];
                    aux.Numero = (int)datos.Lector["Numero"];
                    //aux.Stock = (int)datos.Lector["Stock"];
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


    }
}
