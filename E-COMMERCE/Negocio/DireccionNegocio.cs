using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class DireccionNegocio
    {
        public void guardar(Direccion nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into DIRECCIONES (Calle, Numero, CP, Ciudad, Provincia, Pais)values( @Calle, @Numero, @CP, @Ciudad, @Provincia, @Pais)");
                datos.setearParametro("@Calle", nuevo.Calle);
                datos.setearParametro("@Numero", nuevo.Numero);
                datos.setearParametro("@CP", nuevo.CP);
                datos.setearParametro("@Ciudad", nuevo.Ciudad);
                datos.setearParametro("@Provincia", nuevo.Provincia);
                datos.setearParametro("@Pais", nuevo.Pais);
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
