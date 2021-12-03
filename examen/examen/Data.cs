using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace examen
{
    public class Data
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public DataTable ListarProductos()
        {
            DataTable table = new DataTable();
            SqlDataReader leerTabla;
            SqlCommand cmd = new SqlCommand("ProductsList", conexion);
            cmd.CommandType=CommandType.StoredProcedure;

            conexion.Open();

            leerTabla = cmd.ExecuteReader();
            table.Load(leerTabla);

            leerTabla.Close();
            conexion.Close();

            return table;
        }
    }
}
