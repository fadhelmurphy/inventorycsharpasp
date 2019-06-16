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
    public partial class RestokBarang : System.Web.UI.Page
    {
        public configdb oledb;
        public OleDbDataAdapter mySqlDataAdapter;
        string queryS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            oledb = new configdb();
            TableBind();
            if (!IsPostBack)
            {
                DropdownBind();
            }
        }

        protected void TableBind()
        {
            queryS = "SELECT restokbarang.id,stokbarang.id as idBarang ,penyuplai.id as idPenyuplai, restokbarang.tanggal as tanggal,stokbarang.nama AS nama,stokbarang.jenis,penyuplai.nama AS penyuplai,restokbarang.jumlah FROM"
+"(restokbarang INNER JOIN penyuplai ON restokbarang.idPenyuplai = penyuplai.id)"
+"INNER JOIN stokbarang ON restokbarang.idBarang = stokbarang.id";
            oledb.OpenConnection();
            OleDbCommand com = new OleDbCommand(queryS, oledb.koneksi);
            mySqlDataAdapter = new OleDbDataAdapter(com);
            DataSet DS = new DataSet();
            mySqlDataAdapter.Fill(DS);

            TabelRestokbarang.DataSource = DS.Tables[0];
            TabelRestokbarang.DataBind();
            oledb.CloseConnection();
        }

        protected void DropdownBind()
        {
            queryS = "SELECT id, id & ' | ' & nama as m from stokbarang";
            oledb.OpenConnection();
            IdBarang.DataSource = oledb.openQuerySQL(queryS);
            IdBarang.DataValueField = "id";
            IdBarang.DataTextField = "m";
            IdBarang.DataBind();
            oledb.CloseConnection();

            queryS = "SELECT id, nama from penyuplai";
            oledb.OpenConnection();
            IdPenyuplai.DataSource = oledb.openQuerySQL(queryS);
            IdPenyuplai.DataValueField = "id";
            IdPenyuplai.DataTextField = "nama";
            IdPenyuplai.DataBind();
            oledb.CloseConnection();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("INSERT INTO restokbarang(idBarang,idPenyuplai,jumlah,tanggal)VALUES" +
                                    "('{0}','{1}',{2},'{3}')",
                                    IdBarang.SelectedValue, IdPenyuplai.SelectedValue, Jumlah.Text, Tanggal.Text);
            oledb.OpenConnection();
            oledb.openQuerySQL(queryS);
            oledb.CloseConnection();

            Response.Redirect("Restok.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            queryS = String.Format("update restokbarang set idBarang='{0}',idPenyuplai='{1}',jumlah={2},tanggal='{3}' where id={4}",
                                   IdBarang.SelectedValue, IdPenyuplai.SelectedValue, Jumlah.Text, Tanggal.Text, IdPenyetokan.Text);
            oledb.OpenConnection();
            oledb.openQuerySQL(queryS);
            oledb.CloseConnection();

            Response.Redirect("Restok.aspx");
        }

        protected void DelButton_Click(object sender, EventArgs e)
        {
            //update record
            queryS = String.Format("delete from restokbarang where id={0}", IdPenyetokanDel.Text);
            oledb.OpenConnection();
            oledb.openQuerySQL(queryS);
            oledb.CloseConnection();

            Response.Redirect("RestokBarang.aspx");
        }
    }
}