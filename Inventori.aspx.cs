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
    public partial class Inventori : System.Web.UI.Page
    {
        configdb accesscon;
        private OleDbDataAdapter OleDbDataAdapter;
        string queryS,aquery, aquery2;
        int counter;
        OleDbDataReader hasil;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            accesscon = new configdb();
            TableBind();
        }

        protected void TableBind()
        {
            //update Table
            /*queryS = "UPDATE stokbarang " +
                        "SET stokbarang.jumlahDirestok = (SELECT SUM(restokbarang.jumlah) FROM restokbarang " +
                        "where restokbarang.idBarang = stokbarang.id)," +
                        "stokbarang.jumlahDijual = (SELECT SUM(jualbarang.jumlah) FROM jualbarang " +
                        "where jualbarang.idBarang = stokbarang.id);";
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();*/

            /*queryS = "SELECT stokbarang.id, stokbarang.nama, stokbarang.label, stokbarang.jumlahDitangan, Sum(restokbarang.jumlah) AS SumOfjumlah, Sum(jualbarang.jumlah) AS SumOfjumlah1, stokbarang.jumlahMinimal"
                + " FROM (stokbarang INNER JOIN restokbarang ON stokbarang.id = restokbarang.idBarang) INNER JOIN jualbarang ON stokbarang.id = jualbarang.idBarang"
                + " where restokbarang.idBarang = stokbarang.id and jualbarang.idBarang = stokbarang.id"
                + " GROUP BY stokbarang.id, stokbarang.nama, stokbarang.label, stokbarang.jumlahDitangan, stokbarang.jumlahMinimal";*/
            queryS = "select * from stokbarang";
            accesscon.OpenConnection();
            OleDbCommand com = new OleDbCommand(queryS, accesscon.koneksi);
            OleDbDataAdapter = new OleDbDataAdapter(com);
            DataSet DS = new DataSet();
            OleDbDataAdapter.Fill(DS);

            counter = DS.Tables[0].Rows.Count;
            accesscon.CloseConnection();
            for (int i = 0;i < counter; i++)
            {
                //update Table
                /*queryS = "UPDATE stokbarang " +
                            "SET stokbarang.jumlahDirestok = (SELECT SUM(restokbarang.jumlah) FROM restokbarang " +
                            "where restokbarang.idBarang = '"+ DS.Tables[0].Rows[i]["id"].ToString() + "')," +
                            "stokbarang.jumlahDijual = (SELECT SUM(jualbarang.jumlah) FROM jualbarang " +
                            "where jualbarang.idBarang = '"+ DS.Tables[0].Rows[i]["id"].ToString() + "');";
                accesscon.OpenConnection();
                accesscon.openQuerySQL(queryS);
                accesscon.CloseConnection();*/
                queryS = "SELECT SUM(restokbarang.jumlah) FROM restokbarang " +
                            "where restokbarang.idBarang = '" + DS.Tables[0].Rows[i]["id"].ToString() + "';";
                accesscon.OpenConnection();
                this.hasil = accesscon.openQuerySQL(queryS);
                this.hasil.Read();
                aquery = this.hasil[0].ToString();
                accesscon.CloseConnection();
                queryS = "SELECT SUM(jualbarang.jumlah) FROM jualbarang " +
                            "where jualbarang.idBarang = '" + DS.Tables[0].Rows[i]["id"].ToString() + "';";
                accesscon.OpenConnection();
                this.hasil = accesscon.openQuerySQL(queryS);
                this.hasil.Read();
                aquery2 = this.hasil[0].ToString();
                accesscon.CloseConnection();
                //update Table
                if (aquery.LongCount() > 0 && aquery2.LongCount() > 0)
                {
                queryS = "UPDATE stokbarang " +
                            "SET stokbarang.jumlahDirestok = "+aquery+"," +
                            "stokbarang.jumlahDijual = "+aquery2+ ",status = 'tersedia' where stokbarang.id = '" + DS.Tables[0].Rows[i]["id"].ToString() + "';";
                accesscon.OpenConnection();
                accesscon.openQuerySQL(queryS);
                accesscon.CloseConnection();
                }
                else
                {
                    queryS = "UPDATE stokbarang " +
                            "SET stokbarang.jumlahDirestok = 0," +
                            "stokbarang.jumlahDijual = 0,status = 'kosong' where stokbarang.id = '" + DS.Tables[0].Rows[i]["id"].ToString() + "';";
                    accesscon.OpenConnection();
                    accesscon.openQuerySQL(queryS);
                    accesscon.CloseConnection();
                }
            }
            TabelStokbarang.DataSource = DS.Tables[0];
            TabelStokbarang.DataBind();
        }


        protected void AddButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("INSERT INTO stokbarang(id,nama,jenis,jumlahMinimal)VALUES" +
                                    "('{0}','{1}','{2}',{3})",
                                    addIdBarang.Text, addNama.Text, addLabel.Text, addJumMin.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("UPDATE stokbarang SET id='{0}',nama='{1}',jenis='{2}',jumlahMinimal={3} where id='{4}'",
                                    addIdBarang.Text, addNama.Text, addLabel.Text, addJumMin.Text,idBarangTarget.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }

        protected void HapusButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("DELETE FROM stokbarang WHERE id='{0}'", delIdBarang.Text);

            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Inventori.aspx");
        }
    }
}