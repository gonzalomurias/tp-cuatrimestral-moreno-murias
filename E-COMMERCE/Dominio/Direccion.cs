﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Direccion
    {

        public int ID { get; set; }
        public string Calle { get; set; }
        public string Numero { get; set; }
        public string CP { get; set; }

        public string Ciudad { get; set; }
        public string Provincia { get; set; }
        public string Pais { get; set; }
    }
}
