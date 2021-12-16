using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int ID { get; set; }

        public Usuario User { get; set; }

        public Direccion Direccion { get; set; }

        public FormaPago FPago { get; set; }

        public DateTime FechaPedido { get; set; }

        public decimal Total { get; set; }

        public bool Despachado { get; set; }

        public bool Estado { get; set; }

        
    }
}
