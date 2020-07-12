using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class SqlDataProvider
    {
        public static string strConStr = System.Configuration.ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        public static SqlConnection connection;
        public SqlDataProvider()
        {
            if (connection == null)
            {
                connection = new SqlConnection(strConStr);
            }
        }
        public static SqlConnection GetConnection()
        {
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
                return connection;
            }
            else
            {
                return connection;
            }
        }
    }
}
