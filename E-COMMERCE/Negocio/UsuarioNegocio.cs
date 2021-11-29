using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public bool IniciarSesion(Usuario usuario)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select ID, Nombre, Apellido, DNI, Telefono, Estado, Perfil from USUARIOS where Email = @email and Pass = @pass ");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.ID = (int)datos.Lector["ID"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuario.DNI = (string)datos.Lector["DNI"];
                    usuario.Telefono = (string)datos.Lector["Telefono"];
                    usuario.Estado = (bool)datos.Lector["Estado"];
                    usuario.Perfil = (int)(datos.Lector["Perfil"]) == 2 ? Perfil.ADMIN : Perfil.CLIENTE;
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

        public bool validar(string mail)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select Email from USUARIOS where Email = @mail ");
                datos.setearParametro("@mail", mail);
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

        public void agregar(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into USUARIOS (Nombre, Apellido, DNI, Email, Telefono, Pass)values(@Nombre, @Apellido, @DNI, @Email, @Telefono, @Pass)");
                datos.setearParametro("@Nombre", user.Nombre);
                datos.setearParametro("@Apellido", user.Apellido);
                datos.setearParametro("@DNI", user.DNI);
                datos.setearParametro("@Email", user.Email);
                datos.setearParametro("@Telefono", user.Telefono);
                datos.setearParametro("@Pass", user.Pass);
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
