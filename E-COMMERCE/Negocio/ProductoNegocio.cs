using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
                datos.setearConsulta("Select P.ID, C.Nombre as Categoria, M.Nombre as Marca, T.Numero as Talle, P.Nombre, P.Descripcion, P.Precio, P.URL_Imagen, P.Stock from Productos as P, Marcas as M, Categorias as C, Talles as T where P.IDMarca = M.ID and P.IDCategoria = C.ID and P.IDTalle = T.ID");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto aux = new Producto();

                    aux.ID = (int)datos.Lector["ID"];

                    aux.Marca = new Marca();
                    aux.Marca.ID = (int)datos.Lector["IDMarca"];
                    aux.Marca.Nombre = (string)datos.Lector["Marca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.ID = (int)datos.Lector["IDCategoria"];
                    aux.Categoria.Nombre = (string)datos.Lector["Categoria"];

                    aux.Talle = new Talle();
                    aux.Talle.ID = (int)datos.Lector["IDTalle"];
                    aux.Talle.Numero = (int)datos.Lector["Talle"];

                    if (!(datos.Lector["Nombre"] is DBNull))
                        aux.Nombre = (string)datos.Lector["Nombre"];

                    if (!(datos.Lector["Descripcion"] is DBNull))
                        aux.Descripcion = (string)datos.Lector["Descripcion"];

                    if (!(datos.Lector["URL_Imagen"] is DBNull))
                        aux.UrlImagen = (string)datos.Lector["URL_Imagen"];

                    if (!(datos.Lector["Precio"] is DBNull))
                        aux.Precio = (decimal)datos.Lector["Precio"];

                    if (!(datos.Lector["Stock"] is DBNull))
                        aux.Stock = (int)datos.Lector["Stock"];

                    

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
