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

        public Direccion buscarID(string calle, string numero, string ciudad, string provincia, string cp, string pais)
        {
            Direccion aux = new Direccion();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID From Direcciones where Calle = '" + calle + "' and Numero = '" + numero + "' and CP = '" + cp + "' and Ciudad = '" + ciudad + "' and Provincia = '" + provincia + "' and Pais = '" + pais + "'");
                datos.ejecutarLectura();


                while (datos.Lector.Read())
                {
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Calle = calle;
                    aux.Numero = numero;
                    aux.Ciudad = ciudad;
                    aux.CP = cp;
                    aux.Provincia = provincia;
                    aux.Pais = pais;

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
