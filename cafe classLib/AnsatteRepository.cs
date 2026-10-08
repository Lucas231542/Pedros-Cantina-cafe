using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;

namespace cafe_classLib
{
    public class AnsatteRepository
    {
        private readonly DBConnecter _db = new DBConnecter();

     
              


        public AnsatteRepository() { }

    



        public void Create(string Navn, int Tlf, bool ErRask, bool ErLeder)
        {

            using (SqlConnection conn = _db.GetConnection())
            {
                conn.Open();
                string sql = $"INSERT INTO Ansatte (Navn, Tlf, ErRask, ErLeder) VALUES (@Navn, @Tlf, @ErRask, @ErLeder)";
                SqlCommand cmd = new SqlCommand(sql, conn);

            
                cmd.Parameters.AddWithValue("@Navn", Navn);
                cmd.Parameters.AddWithValue("@Tlf", Tlf);
                cmd.Parameters.AddWithValue("@ErRask", ErRask);
                cmd.Parameters.AddWithValue("@ErLeder", ErLeder);
                cmd.ExecuteNonQuery();


            }
        }


        public List<Ansatte> ReadAll()
        {
            List<Ansatte> anasatteListe = new List<Ansatte>();
            using (SqlConnection conn = _db.GetConnection())
            {

                conn.Open();

                string sql = $"SELECT AnsatteID, Navn, Tlf, ErRask, ErLeder FROM Ansatte";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader r =cmd.ExecuteReader();
       
              

              

              while(r.Read())
                {
                   Ansatte ansatte = new Ansatte
                    {
                      AnsatteID = r.GetInt32(0),
                      Navn = r.GetString(1),
                      Tlf = r.GetInt32(2),
                      ErRask = r.GetBoolean(3),
                      ErLeder = r.GetBoolean(4)
                    };
                    anasatteListe.Add(ansatte);
                }

            
                return anasatteListe;


            }
        }


        public void Update(int AnsatteID, string Navn, int Tlf, bool ErRask, bool ErLeder)
        {
            using (SqlConnection conn =_db.GetConnection())
            {
                conn.Open();
                string sql = $"UPDATE Ansatte SET Navn = @Navn, Tlf = @Tlf, ErRask = @ErRask, ErLeder = @ErLeder WHERE AnsatteID = @AnsatteID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@AnsatteID", AnsatteID);
                cmd.Parameters.AddWithValue("@Navn", Navn);
                cmd.Parameters.AddWithValue("@Tlf", Tlf);
                cmd.Parameters.AddWithValue("@ErRask", ErRask);
                cmd.Parameters.AddWithValue("@ErLeder", ErLeder);
                cmd.ExecuteNonQuery();

            }
        }

        public void Delete(int AnsatteID)
        {
            using (SqlConnection conn = _db.GetConnection())
            {
                conn.Open();
                string sql = $"DELETE FROM Ansatte WHERE AnsatteID = @AnsatteID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@AnsatteID", AnsatteID);
                cmd.ExecuteNonQuery();
            }
        }


    }
}

          
       
       