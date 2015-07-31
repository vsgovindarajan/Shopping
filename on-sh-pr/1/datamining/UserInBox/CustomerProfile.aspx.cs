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

public partial class UserInBox_CustomerProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        if (Page.IsPostBack != true)
        {
            if (Session.Count > 0)
            {
                GetArtistProfile(Convert.ToInt32(Session["uid"].ToString()));
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
    }

    private void GetArtistProfile(int uid)
    {
        da = new SqlDataAdapter("select fname,lname,gender,email,city,state,country,mobileno from tbl_contact where uid=" + uid + " ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_contact");
        if (ds.Tables.Count > 0 && ds.Tables["tbl_contact"].Rows.Count > 0)
        {
            TextBox1.Text = ds.Tables["tbl_contact"].Rows[0][0].ToString();
            TextBox2.Text = ds.Tables["tbl_contact"].Rows[0][1].ToString();
            TextBox3.Text = ds.Tables["tbl_contact"].Rows[0][2].ToString();
            TextBox4.Text = ds.Tables["tbl_contact"].Rows[0][3].ToString();
            TextBox5.Text = ds.Tables["tbl_contact"].Rows[0][4].ToString();
            TextBox6.Text = ds.Tables["tbl_contact"].Rows[0][5].ToString();
            TextBox7.Text = ds.Tables["tbl_contact"].Rows[0][6].ToString();
            TextBox8.Text = ds.Tables["tbl_contact"].Rows[0][7].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("update tbl_contact set fname='" + TextBox1.Text + "',lname='" + TextBox2.Text + "',gender='" + TextBox3.Text + "',email='" + TextBox4.Text + "',city='" + TextBox5.Text + "',state='" + TextBox6.Text + "',country='" + TextBox7.Text + "',mobileno='" + TextBox8.Text + "' where uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
        da.SelectCommand.ExecuteNonQuery();
        GetArtistProfile(Convert.ToInt32(Session["uid"].ToString()));
    }
}
