using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
public partial class Admin_addsalesman : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert into tbl_newemp values('" + txtname.Text + "','" + txtphno.Text + "','" + txtdoj.Text + "','" + txtemail.Text + "','" + txtlogin.Text + "','" + txtpwd.Text + "')", con);
        con.Open();
        int k = cmd.ExecuteNonQuery();
        con.Close();
        if (k == 1)
        {
            Response.Write("<script>alert('Employee Details Added')</script>");
        }
        else
        {
            Response.Write("<script>alert('Error Occured')</script>");
        }
    }
}
