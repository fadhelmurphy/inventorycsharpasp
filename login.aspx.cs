using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SistemBarang
{
    public partial class login : System.Web.UI.Page
    {
        configdb con = new configdb();
        OleDbDataReader hasil;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["user"] != null)
            {
                Response.Redirect("Inventori.aspx");
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            String query = String.Format("SELECT * FROM login where username='{0}' and password='{1}'", UserName.Text, Password.Text);
            this.hasil = con.openQuerySQL(query);
            if (this.hasil.Read() == true)
            {
                if (HttpContext.Current.Request.Cookies["user"] == null)
                {
                    Response.Cookies["user"].Value = this.hasil[1].ToString();
                    Response.Cookies["user"].Expires = DateTime.Today.AddDays(1); // add expiry time
                    Response.Redirect("Inventori.aspx");
                }
            }
            else
            {
                Literal1.Text = "Invalid credentials";
            }
            con.koneksi.Close();

        }
    }
}