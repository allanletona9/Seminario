using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class conexion_entidad
    {
        string _usuario;
        string _password;
        string _server;
        string _database;
        string _tipousuario;
        string _estadousuario;
        string _correo;

        public string usuario
        {
            get
            {
                return _usuario;
            }
            set
            {
                _usuario = value;
            }
        }

        public string password
        {
            get
            {
                return _password;
            }
            set
            {
                _password = value;
            }
        }

        public string server
        {
            get
            {
                return _server;
            }
            set
            {
                _server = value;
            }
        }

        public string database
        {
            get
            {
                return _database;
            }
            set
            {
                _database = value;
            }
        }

        public string tipousuario
        {
            get
            {
                return _tipousuario;
            }
            set
            {
                _tipousuario = value;
            }
        }

        public string estado
        {
            get
            {
                return _estadousuario;
            }
            set
            {
                _estadousuario = value;
            }
        }
        public string correo
        {
            get
            {
                return _correo;
            }
            set
            {
                _correo = value;
            }
        }


    }
}
