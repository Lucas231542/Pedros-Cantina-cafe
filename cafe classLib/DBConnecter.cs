using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.UserSecrets;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;


namespace cafe_classLib
{
    public class DBConnecter
    {

        SqlConnection _conn;

       

        public SqlConnection GetConnection()
        {
        var config = new ConfigurationBuilder()
        .AddUserSecrets(Assembly.GetExecutingAssembly())
        .Build();

            String ConnectionString = config["LucasConnectionString"];
            return new SqlConnection(ConnectionString);
        }

        public void ConnectToDB()
        {


            //Create a new SqlConnection object
            var config = new ConfigurationBuilder()

                .AddUserSecrets(Assembly.GetExecutingAssembly(), optional: true)
                .Build();
            var connectionString = config["LucasConnectionString"]; // Use the connection string from user secrets

            _conn = new SqlConnection(connectionString);


            try
            {
                // Open the connection
                _conn.Open();
                Console.WriteLine("Connection to the database established successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while connecting to the database: {ex.Message}");
            }
        }

        public void DisconnectFromDB()
        {
            _conn.Close();
        }

    }
}
