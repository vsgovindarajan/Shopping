using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class UserLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Focus();

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            da = new SqlDataAdapter("select count(*) from tbl_login where uname='" + TextBox1.Text + "' and password='" + TextBox2.Text + "' and status='Activate' ", con);
            int n = Convert.ToInt32(da.SelectCommand.ExecuteScalar());
            if (n == 1)
            {
                da = new SqlDataAdapter("select uid from tbl_login where uname='" + TextBox1.Text + "' and password='" + TextBox2.Text + "' ", con);
                ds = new DataSet();
                da.Fill(ds, "tbl_login");
                if (ds.Tables["tbl_login"].Rows.Count>0 && ds.Tables.Count>0)
                {
                    Session.Add("uid", ds.Tables["tbl_login"].Rows[0][0].ToString());
                    Response.Redirect("~/UserInBox/CustomerProfile.aspx");
                }
                else
                {
                    Label1.Text = "Invalid userid and password.";
                }               
            }
            else
            {
                Label1.Text = "Invalid userid and password.Its Deactivated by Admin.Try Agian!.";
                TextBox1.Text = "";
            }
        }
    }
}
