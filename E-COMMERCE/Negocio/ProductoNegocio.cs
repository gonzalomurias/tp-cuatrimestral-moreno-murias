using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class ProductoNegocio
    {

        public List<Producto> listar()

        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("Select P.Estado, P.ID, C.ID as IDCat, C.Nombre as Categoria, M.ID as IDMar, M.Nombre as Marca, P.Nombre, P.Descripcion, P.Precio, P.URL_Imagen from Productos as P, Marcas as M, Categorias as C where P.IDMarca = M.ID and P.IDCategoria = C.ID");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();

                    aux.Estado = (bool)datos.Lector["Estado"];

                    if (aux.Estado == true)
                    {
                        aux.ID = (int)datos.Lector["ID"];

                        aux.Categoria = new Categoria();
                        aux.Categoria.ID = (int)datos.Lector["IDCat"];
                        aux.Categoria.Nombre = (string)datos.Lector["Categoria"];

                        aux.Marca = new Marca();
                        aux.Marca.ID = (int)datos.Lector["IDMar"];
                        aux.Marca.Nombre = (string)datos.Lector["Marca"];


                        if (!(datos.Lector["Nombre"] is DBNull))
                            aux.Nombre = (string)datos.Lector["Nombre"];

                        if (!(datos.Lector["Descripcion"] is DBNull))
                            aux.Descripcion = (string)datos.Lector["Descripcion"];

                        if (!(datos.Lector["Precio"] is DBNull))
                            aux.Precio = (decimal)datos.Lector["Precio"];

                        if (!(datos.Lector["URL_Imagen"] is DBNull))
                            aux.UrlImagen = (string)datos.Lector["URL_Imagen"];

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

        public void agregar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into PRODUCTOS (Nombre, Descripcion, IDMarca, IDCategoria, URL_Imagen, Precio)values( @Nombre, @Descripcion, @idMarca, @idCategoria, @URL_Imagen, @Precio)");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@IDMarca", nuevo.Marca.ID);
                datos.setearParametro("@IDCategoria", nuevo.Categoria.ID);
                datos.setearParametro("@URL_Imagen", nuevo.UrlImagen);
                datos.setearParametro("@Precio", nuevo.Precio);
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

        public Producto listar2(int idP)

        {
            Producto aux = new Producto();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                
                datos.setearConsulta("Select P.ID, C.ID as IDCat, C.Nombre as Categoria, M.ID as IDMar, M.Nombre as Marca, P.Nombre, P.Descripcion, P.Precio, P.URL_Imagen, P.IDMarca, P.IDCategoria from Productos as P, Marcas as M, Categorias as C where P.IDMarca = M.ID and P.IDCategoria = C.ID and P.ID =" + @idP + "");
                datos.setearParametro("@ID", idP);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    

                    aux.ID = (int)datos.Lector["ID"];

                    //aux.Talle = new Talle();
                    //aux.Talle.ID = (int)datos.Lector["IDTa"];
                    //aux.Talle.Numero = (int)datos.Lector["Talle"];
                    //aux.Talle.Stock = (int)datos.Lector["Stock"];

                    if (!(datos.Lector["Nombre"] is DBNull))
                        aux.Nombre = (string)datos.Lector["Nombre"];

                    if (!(datos.Lector["Descripcion"] is DBNull))
                        aux.Descripcion = (string)datos.Lector["Descripcion"];

                    if (!(datos.Lector["Precio"] is DBNull))
                        aux.Precio = (decimal)datos.Lector["Precio"];

                    if (!(datos.Lector["URL_Imagen"] is DBNull))
                        aux.UrlImagen = (string)datos.Lector["URL_Imagen"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.ID = (int)datos.Lector["IDCat"];
                    aux.Categoria.Nombre = (string)datos.Lector["Categoria"];

                    aux.Marca = new Marca();
                    aux.Marca.ID = (int)datos.Lector["IDMar"];
                    aux.Marca.Nombre = (string)datos.Lector["Marca"];


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

        public void modificar(Producto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE PRODUCTOS SET Nombre=@Nombre, Descripcion=@Descripcion, IDMarca=@idMarca, IDCategoria=@idCategoria, URL_Imagen=@URL_Imagen, Precio=@Precio where ID=@ID");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@IDMarca", nuevo.Marca.ID);
                datos.setearParametro("@IDCategoria", nuevo.Categoria.ID);
                datos.setearParametro("@URL_Imagen", nuevo.UrlImagen);
                datos.setearParametro("@Precio", nuevo.Precio);
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
                datos.setearConsulta("UPDATE PRODUCTOS SET Estado=@Estado where ID="+ idCapturado + "");
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


        public List<Producto> listar3(string cadena)

        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("Select P.Estado, P.ID, C.ID as IDCat, C.Nombre as Categoria, M.ID as IDMar, M.Nombre as Marca, P.Nombre, P.Descripcion, P.Precio, P.URL_Imagen from Productos as P inner join MARCAS M on M.ID = P.IDMarca inner join CATEGORIAS C on C.ID = P.IDCategoria where P.Nombre like '%" + @cadena + "%' or M.Nombre like '%" + @cadena + "%' or P.Descripcion like '%" + @cadena + "%' or C.Nombre like '%" + @cadena + "%'");
                datos.setearParametro("@cadena", cadena);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();

                    aux.Estado = (bool)datos.Lector["Estado"];

                    if (aux.Estado == true)
                    {
                        aux.ID = (int)datos.Lector["ID"];

                        aux.Categoria = new Categoria();
                        aux.Categoria.ID = (int)datos.Lector["IDCat"];
                        aux.Categoria.Nombre = (string)datos.Lector["Categoria"];

                        aux.Marca = new Marca();
                        aux.Marca.ID = (int)datos.Lector["IDMar"];
                        aux.Marca.Nombre = (string)datos.Lector["Marca"];

     
                        if (!(datos.Lector["Nombre"] is DBNull))
                            aux.Nombre = (string)datos.Lector["Nombre"];

                        if (!(datos.Lector["Descripcion"] is DBNull))
                            aux.Descripcion = (string)datos.Lector["Descripcion"];

                        if (!(datos.Lector["Precio"] is DBNull))
                            aux.Precio = (decimal)datos.Lector["Precio"];

                        if (!(datos.Lector["URL_Imagen"] is DBNull))
                            aux.UrlImagen = (string)datos.Lector["URL_Imagen"];

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

        public List<Producto> listar4(string cadena)

        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("Select P.Estado, P.ID, C.ID as IDCat, C.Nombre as Categoria, M.ID as IDMar, M.Nombre as Marca, P.Nombre, P.Descripcion, P.Precio, P.URL_Imagen from Productos as P inner join MARCAS M on M.ID = P.IDMarca inner join CATEGORIAS C on C.ID = P.IDCategoria where C.Nombre = '" + @cadena + "'");
                datos.setearParametro("@cadena", cadena);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();

                    aux.Estado = (bool)datos.Lector["Estado"];

                    if (aux.Estado == true)
                    {
                        aux.ID = (int)datos.Lector["ID"];

                        aux.Categoria = new Categoria();
                        aux.Categoria.ID = (int)datos.Lector["IDCat"];
                        aux.Categoria.Nombre = (string)datos.Lector["Categoria"];

                        aux.Marca = new Marca();
                        aux.Marca.ID = (int)datos.Lector["IDMar"];
                        aux.Marca.Nombre = (string)datos.Lector["Marca"];


                        if (!(datos.Lector["Nombre"] is DBNull))
                            aux.Nombre = (string)datos.Lector["Nombre"];

                        if (!(datos.Lector["Descripcion"] is DBNull))
                            aux.Descripcion = (string)datos.Lector["Descripcion"];

                        if (!(datos.Lector["Precio"] is DBNull))
                            aux.Precio = (decimal)datos.Lector["Precio"];

                        if (!(datos.Lector["URL_Imagen"] is DBNull))
                            aux.UrlImagen = (string)datos.Lector["URL_Imagen"];

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

        public List<Producto> listar5(string cadena)

        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("Select P.Estado, P.ID, C.ID as IDCat, C.Nombre as Categoria, M.ID as IDMar, M.Nombre as Marca, P.Nombre, P.Descripcion, P.Precio, P.URL_Imagen from Productos as P inner join MARCAS M on M.ID = P.IDMarca inner join CATEGORIAS C on C.ID = P.IDCategoria where M.Nombre = '" + @cadena + "'");
                datos.setearParametro("@cadena", cadena);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();

                    aux.Estado = (bool)datos.Lector["Estado"];

                    if (aux.Estado == true)
                    {
                        aux.ID = (int)datos.Lector["ID"];

                        aux.Categoria = new Categoria();
                        aux.Categoria.ID = (int)datos.Lector["IDCat"];
                        aux.Categoria.Nombre = (string)datos.Lector["Categoria"];

                        aux.Marca = new Marca();
                        aux.Marca.ID = (int)datos.Lector["IDMar"];
                        aux.Marca.Nombre = (string)datos.Lector["Marca"];


                        if (!(datos.Lector["Nombre"] is DBNull))
                            aux.Nombre = (string)datos.Lector["Nombre"];

                        if (!(datos.Lector["Descripcion"] is DBNull))
                            aux.Descripcion = (string)datos.Lector["Descripcion"];

                        if (!(datos.Lector["Precio"] is DBNull))
                            aux.Precio = (decimal)datos.Lector["Precio"];

                        if (!(datos.Lector["URL_Imagen"] is DBNull))
                            aux.UrlImagen = (string)datos.Lector["URL_Imagen"];

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
