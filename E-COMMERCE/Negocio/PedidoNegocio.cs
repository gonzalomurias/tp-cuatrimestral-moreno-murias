﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class PedidoNegocio
    {
        public void agregar(Pedido nuevo)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Insert into PEDIDOS (IDDireccion, IDUsuario, IDFormaPago, FechaPedido, Total) VALUES (@IDDIR, @IDUSER, @IDFP, GETDATE(), @Total)");
                datos.setearParametro("@IDDIR", nuevo.Direccion.ID);
                datos.setearParametro("@IDUSER", nuevo.User.ID);
                datos.setearParametro("@IDFP", nuevo.FPago.ID);
                datos.setearParametro("@Total", nuevo.Total);

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
