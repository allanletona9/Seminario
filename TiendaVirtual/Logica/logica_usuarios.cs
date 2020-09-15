using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Logica
{
    public class logica_usuarios
    {
        public static conexion_entidad obtenerUsuario(conexion_entidad cn_entidad)
        {
            try
            {
                return datos_usuarios.obtenerUsuario(cn_entidad);
            }catch(Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
        
        public static bool insertar_usuario(conexion_entidad cn_conexion, usuarios user)
        {
            try
            {
                return datos_usuarios.insertar_usuario(cn_conexion, user);
            }catch(Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

    }
}
