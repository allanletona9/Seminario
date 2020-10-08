using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class pedidos
    {
        string _idpedido;
        string _fechapedido;
        string _nombre;
        string _direccion;
        string _estado;

        public string idpedido
        {
            get
            {
                return _idpedido;
            }
            set
            {
                _idpedido = value;
            }
        }

        public string fechapedido
        {
            get
            {
                return _fechapedido;
            }
            set
            {
                _fechapedido = value;
            }
        }
        public string nombre
        {
            get
            {
                return _nombre;
            }
            set
            {
                _nombre = value;
            }
        }

        public string direccion
        {
            get
            {
                return _direccion;
            }
            set
            {
                _direccion = value;
            }
        }


        public string estado
        {
            get
            {
                return _estado;
            }
            set
            {
                _estado = value;
            }
        }
    }
}
