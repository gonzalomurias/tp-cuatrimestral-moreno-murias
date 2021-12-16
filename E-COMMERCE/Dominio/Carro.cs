using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carro
    {
        public int ID { get; set; }
        public Pedido pedido { get; set; }

        public ItemCarrito producto { get; set; }
    }
}
