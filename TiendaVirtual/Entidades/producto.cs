using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class producto
    {
        string _idarticulo;
        string _idproveedor;
        string _nombre;
        string _descripcion;
        string _ruta;
        string _stock;
        string _otro;
        string _estado;

        public string idarticulo
        {
            get
            {
                return _idarticulo;
            }
            set
            {
                _idarticulo = value;
            }
        }

        public string idproveedor
        {
            get
            {
                return _idproveedor;
            }
            set
            {
                _idproveedor = value;
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

        public string descripcion
        {
            get
            {
                return _descripcion;
            }
            set
            {
                _descripcion = value;
            }
        }
        public string ruta
        {
            get
            {
                return _ruta;
            }
            set
            {
                _ruta = value;
            }
        }
        public string stock
        {
            get
            {
                return _stock;
            }
            set
            {
                _stock = value;
            }
        }
        public string otro
        {
            get
            {
                return _otro;
            }
            set
            {
                _otro = value;
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
