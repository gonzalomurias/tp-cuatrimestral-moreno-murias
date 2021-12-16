using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {
        public int ID { get; set; }

        public Pedido Pedido { get; set; }
        public List<ItemCarrito> Productos { get; set; }
    }
}
