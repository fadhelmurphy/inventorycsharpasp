using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SistemBarang
{
    public partial class register : System.Web.UI.Page
    {
        configdb con = new configdb();
        OleDbDataReader hasil;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["user"] != null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            String query = String.Format("INSERT INTO login ([username],[password]) VALUES('{0}','{1}');", UserName.Text, Password.Text);
            this.hasil = con.openQuerySQL(query);
            Response.Cookies["user"].Value = UserName.Text;
            Response.Cookies["user"].Expires = DateTime.Today.AddDays(1); // add expiry time
            Response.Redirect("login.aspx");
            con.koneksi.Close();
        }
    }
}