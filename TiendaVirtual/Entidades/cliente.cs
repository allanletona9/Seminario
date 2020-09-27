using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class cliente
    {
        string _idcliente;
        string _idusuario;
        string _nombre;
        string _apellido;
        string _telefono;
        string _identificacion;
        string _email;
        string _fechaInicio;
        string _nit;
        string _estado;

        public string idcliente
        {
            get
            {
                return _idcliente;
            }
            set
            {
                _idcliente = value;
            }
        }

        public string idusuario
        {
            get
            {
                return _idusuario;
            }
            set
            {
                _idusuario = value;
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

        public string apellido
        {
            get
            {
                return _apellido;
            }
            set
            {
                _apellido = value;
            }
        }
        public string telefono
        {
            get
            {
                return _telefono;
            }
            set
            {
                _telefono = value;
            }
        }
        public string identificacion
        {
            get
            {
                return _identificacion;
            }
            set
            {
                _identificacion = value;
            }
        }
        public string email
        {
            get
            {
                return _email;
            }
            set
            {
                _email = value;
            }
        }
        public string fechaInicio
        {
            get
            {
                return _fechaInicio;
            }
            set
            {
                _fechaInicio = value;
            }
        }
        public string nit
        {
            get
            {
                return _nit;
            }
            set
            {
                _nit = value;
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
