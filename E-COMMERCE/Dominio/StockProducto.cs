using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class StockProducto
    {

        public int ID { get; set; }

        public Producto Producto { get; set; }

        public Talle Talle { get; set; }

        public int Cantidad { get; set; }
    }
}
