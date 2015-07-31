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


public partial class user_billingandshopping : System.Web.UI.Page
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

        if (!Page.IsPostBack)
        {
            GetBillingDetails(Convert.ToInt32(Session["uid"].ToString()));           
        }
    }

    private void GetBillingDetails(int uid)
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
            TextBox9.Text = ds.Tables["tbl_contact"].Rows[0][7].ToString();
        } 
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            if (TextBox10.Text != "")
            {
                Session["fname"] = TextBox10.Text;
                Session["lname"] = TextBox11.Text;
                Session["gender"] = TextBox12.Text;
                Session["email"] = TextBox13.Text;
                Session["city"] = TextBox14.Text;
                Session["state"] = TextBox15.Text;
                Session["country"] = TextBox16.Text;
                Session["mobileno"] = TextBox18.Text;
                if (Session.Count > 0) /// && Request.QueryString.Count>0)
                {
                   // int artid = Convert.ToInt32(Request.QueryString["pitemid"].ToString());
                    Response.Redirect("~/UserInBox/Order.aspx");  ////?pitemid=" + artid.ToString());
                }
            }
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            da = new SqlDataAdapter("select fname,lname,gender,email,city,state,country,mobileno from tbl_contact where uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
            ds = new DataSet();
            da.Fill(ds, "tbl_contact");
            if (ds.Tables.Count > 0 && ds.Tables["tbl_contact"].Rows.Count > 0)
            {
                TextBox10.Text = ds.Tables["tbl_contact"].Rows[0][0].ToString();
                TextBox11.Text = ds.Tables["tbl_contact"].Rows[0][1].ToString();
                TextBox12.Text = ds.Tables["tbl_contact"].Rows[0][2].ToString();
                TextBox13.Text = ds.Tables["tbl_contact"].Rows[0][3].ToString();
                TextBox14.Text = ds.Tables["tbl_contact"].Rows[0][4].ToString();
                TextBox15.Text = ds.Tables["tbl_contact"].Rows[0][5].ToString();
                TextBox16.Text = ds.Tables["tbl_contact"].Rows[0][6].ToString();
                TextBox18.Text = ds.Tables["tbl_contact"].Rows[0][7].ToString();
            } 
        }
        else
        {
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            TextBox15.Text = "";
            TextBox16.Text = "";
            TextBox18.Text = "";
        }
    }
}
