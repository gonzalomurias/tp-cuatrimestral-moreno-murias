﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public enum Perfil
    {
        CLIENTE = 1,
        ADMIN = 2
    }
    public class Usuario
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string DNI { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public string Pass { get; set; }
        public Perfil Perfil { get; set; }
        public bool Estado { get; set; }
        
      
    }
}
