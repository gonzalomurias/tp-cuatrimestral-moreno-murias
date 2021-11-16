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
                datos.setearConsulta("Select P.ID, C.ID as IDCat, C.Nombre as Categoria, M.ID as IDMar, M.Nombre as Marca, T.ID as IDTa, T.Numero as Talle, P.Nombre, P.Descripcion, P.Precio, P.URL_Imagen, T.Stock from Productos as P, Marcas as M, Categorias as C, Talles as T where P.IDMarca = M.ID and P.IDCategoria = C.ID and P.IDTalle = T.ID");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();

                    aux.ID = (int)datos.Lector["ID"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.ID = (int)datos.Lector["IDCat"];
                    aux.Categoria.Nombre = (string)datos.Lector["Categoria"];

                    aux.Marca = new Marca();
                    aux.Marca.ID = (int)datos.Lector["IDMar"];
                    aux.Marca.Nombre = (string)datos.Lector["Marca"];

                    aux.Talle = new Talle();
                    aux.Talle.ID = (int)datos.Lector["IDTa"];
                    aux.Talle.Numero = (int)datos.Lector["Talle"];
                    aux.Talle.Stock = (int)datos.Lector["Stock"];

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
                datos.setearConsulta("Insert into PRODUCTOS (Nombre, Descripcion, IdMarca, IdCategoria, UrlImagen, Precio)values(@Codigo, @Nombre, @Descripcion, @idMarca, @idCategoria, @UrlImagen, @Precio)");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@idMarca", nuevo.Marca.ID);
                datos.setearParametro("@idCategoria", nuevo.Categoria.ID);
                datos.setearParametro("@ImagenUrl", nuevo.UrlImagen);
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
    }
}
