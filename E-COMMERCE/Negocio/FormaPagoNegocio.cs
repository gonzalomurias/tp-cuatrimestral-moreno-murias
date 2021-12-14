using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class FormaPagoNegocio
    {
        public List<FormaPago> listar()
        {
            List<FormaPago> lista = new List<FormaPago>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select ID, Nombre, Estado from FORMASPAGO");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    FormaPago aux = new FormaPago();
                    aux.Estado = (bool)datos.Lector["Estado"];

                    if (aux.Estado == true)
                    {
                        aux.ID = (int)datos.Lector["ID"];

                        if (!(datos.Lector["Nombre"] is DBNull))
                            aux.Nombre = (string)datos.Lector["Nombre"];
                        lista.Add(aux);
                    }


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
