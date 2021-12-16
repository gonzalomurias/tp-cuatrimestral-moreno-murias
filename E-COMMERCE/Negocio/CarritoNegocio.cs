using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class CarritoNegocio
    {
        public List<Carrito> listar()
        {
            List<Carrito> lista = new List<Carrito>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                   
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

        


    }



}

