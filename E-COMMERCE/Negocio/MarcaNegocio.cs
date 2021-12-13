using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> listar()

        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select Id, Nombre, Estado from MARCAS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Marca aux = new Marca();
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

        public void agregar(Marca nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into MARCAS (Nombre)values(@Nombre)");
                datos.setearParametro("@Nombre", nuevo.Nombre);
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

        public Marca listar2(int idM)

        {
            Marca aux = new Marca();
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("Select ID, Nombre from Marcas where ID=" + @idM + "");
                datos.setearParametro("@ID", idM);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {


                    aux.ID = (int)datos.Lector["ID"];

                    if (!(datos.Lector["Nombre"] is DBNull))
                        aux.Nombre = (string)datos.Lector["Nombre"];

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

        public List<Marca> listar3(string cadena)

        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("Select ID, Nombre, Estado from Marcas where Nombre like '%" + @cadena + "%'");
                datos.setearParametro("@cadena", cadena);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Marca aux = new Marca();

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

        public void modificar(Marca nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE MARCAS SET Nombre=@Nombre where ID=@ID");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@ID", nuevo.ID);
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

        public void eliminar(int idCapturado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE MARCAS SET Estado=@Estado where ID=" + idCapturado + "");
                datos.setearParametro("@Estado", 0);
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
