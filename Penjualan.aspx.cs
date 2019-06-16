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
    public partial class PenjualanBarang : System.Web.UI.Page
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
            TableBind();
            if (!IsPostBack)
            {
                BarangBind();
                KlienBind();
            }
        }

        protected void TableBind()
        {
            queryS = "SELECT jualbarang.id as id,stokbarang.id as idBarang,klien.id as idKlien, jualbarang.tanggal, stokbarang.nama, stokbarang.jenis, klien.namaDepan, klien.namaBelakang, jualbarang.jumlah FROM (jualbarang INNER JOIN stokbarang ON jualbarang.idBarang = stokbarang.id) INNER JOIN klien ON jualbarang.idKlien = klien.id; ";
            accesscon.OpenConnection();
            OleDbCommand com = new OleDbCommand(queryS, accesscon.koneksi);
            mySqlDataAdapter = new OleDbDataAdapter(com);
            DataSet DS = new DataSet();
            mySqlDataAdapter.Fill(DS);

            TabelPenjualanbarang.DataSource = DS.Tables[0];
            TabelPenjualanbarang.DataBind();
            accesscon.CloseConnection();
        }

        protected void BarangBind()
        {
            queryS = "select id, id & ' | ' & nama AS m from stokbarang";
            accesscon.OpenConnection();
            IdBarang.DataSource = accesscon.openQuerySQL(queryS);
            IdBarang.DataValueField = "id";
            IdBarang.DataTextField = "m";
            IdBarang.DataBind();
            accesscon.CloseConnection();
        }

        protected void KlienBind()
        {
            queryS = "SELECT id,namaDepan & ' ' & namaBelakang as nama from klien";
            accesscon.OpenConnection();
            IdKlien.DataSource = accesscon.openQuerySQL(queryS);
            IdKlien.DataValueField = "id";
            IdKlien.DataTextField = "nama";
            IdKlien.DataBind();
            accesscon.CloseConnection();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            //update record
            queryS = String.Format("INSERT INTO jualbarang(idBarang,idKlien,jumlah,tanggal)" +
                                    "VALUES('{0}','{1}',{2},'{3}')",
                                    IdBarang.SelectedValue, IdKlien.SelectedValue, Jumlah.Text, Tanggal.Text);

            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Penjualan.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            //update record
            queryS = String.Format("update jualbarang set idBarang='{0}',idKlien='{1}',jumlah={2},tanggal='{3}' " +
                                        "where id={4}", IdBarang.SelectedValue, IdKlien.SelectedValue, Jumlah.Text, Tanggal.Text, IdTransaksi.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Penjualan.aspx");
        }

        protected void DelButton_Click(object sender, EventArgs e)
        {
            //update record
            queryS = String.Format("delete from jualbarang where id={0}",IdTransaksiDel.Text);
            accesscon.OpenConnection();
            accesscon.openQuerySQL(queryS);
            accesscon.CloseConnection();

            Response.Redirect("Penjualan.aspx");
        }
    }
}