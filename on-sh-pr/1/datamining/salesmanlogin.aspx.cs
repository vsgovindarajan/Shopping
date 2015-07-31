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

public partial class salesmanlogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select eid from tbl_newemp where login='" + TextBox1.Text + "'and pwd='" + TextBox2.Text + "'", con);
        ds = new DataSet();
        da.Fill(ds, "table");
        if (ds.Tables["table"].Rows.Count > 0)
        {
            Session.Add("n", ds.Tables["table"].Rows[0][0].ToString());

            Response.Redirect("~/salesman/Customers.aspx");
        }

        else
        {

            Response.Write("You Are Not Valid User");
        }
    }
}
