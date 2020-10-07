using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class logica_articulos
    {
        public static DataTable obtieneArticulos(conexion_entidad cn_conexion)
        {
            try
            {
                return datos_articulos.obtieneArticulos(cn_conexion);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static bool insertar_articulo(conexion_entidad cn_conexion,producto eProducto)
        {
            try
            {
                return datos_articulos.insertar_articulo(cn_conexion, eProducto);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static DataTable obtieneArticuloIndividual(conexion_entidad cn_conexion, producto eProducto)
        {
            try
            {
                return datos_articulos.obtieneArticuloIndividual(cn_conexion, eProducto);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static DataTable obtenerCategorias(conexion_entidad cn_conexion)
        {
            try
            {
                return datos_articulos.obtenerCategorias(cn_conexion);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static bool actualizar_articulo(conexion_entidad cn_conexion, producto eProducto)
        {
            try
            {
                return datos_articulos.actualizar_articulo(cn_conexion, eProducto);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
