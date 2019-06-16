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
    public partial class Relasi : System.Web.UI.Page
    {
        configdb accesscon;
        private OleDbDataAdapter mySqlDataAdapter;
        string queryS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            accesscon = new configdb();
            TablePenyuplaiBind();
            TabelKlienBind();
        }

        protected void TablePenyuplaiBind()
        {
            queryS = "SELECT * from penyuplai";
            try
            {
                accesscon.OpenConnection();
                OleDbCommand com = new OleDbCommand(queryS, accesscon.koneksi);
                mySqlDataAdapter = new OleDbDataAdapter(com);
                DataSet DS = new DataSet();
                mySqlDataAdapter.Fill(DS);

                TabelPenyuplai.DataSource = DS.Tables[0];
                TabelPenyuplai.DataBind();
                accesscon.CloseConnection();
            }
            catch (OleDbException)
            {
                Response.Write("Gagal Terkoneksi!");
            }
            catch (Exception)
            {
                Response.Write("Terjadi kesalahan!");
            }
        }

        protected void TabelKlienBind()
        {
            queryS = "SELECT * from klien";
            try
            {
                accesscon.OpenConnection();
                OleDbCommand com = new OleDbCommand(queryS, accesscon.koneksi);
                mySqlDataAdapter = new OleDbDataAdapter(com);
                DataSet DS = new DataSet();
                mySqlDataAdapter.Fill(DS);

                TabelKlien.DataSource = DS.Tables[0];
                TabelKlien.DataBind();
                accesscon.CloseConnection();
            }
            catch (OleDbException)
            {
                Response.Write("Gagal terkoneksi!");
            }
            catch (Exception)
            {
                Response.Write("Terjadi kesalahan!");
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("INSERT INTO penyuplai(id,nama) VALUES" +
                                    "('{0}','{1}')",
                                    idnama.Text, Nama.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }

        protected void AddButton2_Click(object sender, EventArgs e)
        {
            queryS = String.Format("INSERT INTO klien(id,namaDepan,namaBelakang) VALUES" +
                                    "('{0}','{1}','{2}')",
                                    idnama.Text, Nama.Text, Belakang.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }

        protected void EditButton2_Click(object sender, EventArgs e)
        {
            queryS = String.Format("UPDATE klien SET namaDepan='{0}',namaBelakang='{1}' where id='{2}'",
                                    Nama.Text, Belakang.Text, idnama.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("UPDATE penyuplai SET nama='{0}' where id='{1}'",
                                    Nama.Text, idnama.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }

        protected void HapusButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("DELETE FROM penyuplai WHERE id='{0}'", idnama.Text);

            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }
        protected void HapusButton2_Click(object sender, EventArgs e)
        {
            queryS = String.Format("DELETE FROM klien WHERE id='{0}'", idnama.Text);

            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }
    }
}