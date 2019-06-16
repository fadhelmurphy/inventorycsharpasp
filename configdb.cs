using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace SistemBarang
{
    public class configdb
    //aim : create sql connection, run a query,
    {
        public OleDbConnection koneksi;
        public configdb()
        {
            this.koneksi = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|tugasweb.accdb");
        }

        public void OpenConnection()
        {
            try
            {
                this.koneksi.Open();
                System.Diagnostics.Debug.WriteLine("BERHASIL TERKONEKSI!");
            }
            catch (InvalidOperationException)
            {
                System.Diagnostics.Debug.WriteLine("GAGAL TERKONEKSI!");
            }

        }

        public void CloseConnection()
        {
            try
            {
                this.koneksi.Close();
            }
            catch (InvalidOperationException)
            {
                System.Diagnostics.Debug.WriteLine("Koneksi sudah tidak terhubung");
            }
        }

        public OleDbDataReader openQuerySQL(string queryF)
        {
            //Membuat SQLCommand menggunakan Query dan Koneksi yang telah ditentukan
            OleDbCommand comm = new OleDbCommand(queryF, this.koneksi);

            //Menghubungkan Koneksi tersebut
            this.OpenConnection();

            //Mengexecute SQLCommand dan me-Retrieve data 
            OleDbDataReader resultsF = comm.ExecuteReader();

            //Jika Ada Data(Ketemu)}

            return resultsF;
        }


    }
}