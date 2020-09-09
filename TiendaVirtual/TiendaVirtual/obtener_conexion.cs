using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Entidades;

namespace TiendaVirtual
{
    public class obtener_conexion
    {
        public static conexion_entidad obtenerConexion()
        {
            try
            {
                conexion_entidad conexion = new conexion_entidad();
                conexion.database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                conexion.server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                return conexion;
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error en la conexion: " + ex.Message);
                return null;
            }
            
        } 
    }
}