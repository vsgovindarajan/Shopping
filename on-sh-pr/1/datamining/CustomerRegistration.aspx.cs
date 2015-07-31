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

public partial class CustomerRegistration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        Label16.Text = Guid.NewGuid().ToString().Substring(0, 6);

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
    }
    protected void TextBox9_TextChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select count(uname) from tbl_login where uname='" + TextBox9.Text + "' ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_login");

        if (ds.Tables["tbl_login"].Rows.Count == 1 && ds.Tables["tbl_login"].Rows[0][0].ToString() == "1")
        {
            Label17.Text = "Username is not Available.";
            Label17.BackColor = System.Drawing.Color.Red;
            TextBox9.Focus();
        }
        else
        {
            Label17.Text = "Username is Available.";
            Label17.BackColor = System.Drawing.Color.Green;
            TextBox10.Focus();
        }
    }

    private int GetUid(string uname)
    {
        da = new SqlDataAdapter("select uid from tbl_login where uname='" + uname.ToString() + "' ", con);
        return Convert.ToInt32(da.SelectCommand.ExecuteScalar());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Label17.Text == "Username is Available.")
        {
            da = new SqlDataAdapter("insert into tbl_login(uname,password,securitycode,status,cdate)values('" + TextBox9.Text + "','" + TextBox10.Text + "','" + TextBox11.Text + "','Activate',getdate())", con);
            da.SelectCommand.ExecuteNonQuery();
            int uid = GetUid(TextBox9.Text);
            if (uid > 0)
            {
                da = new SqlDataAdapter("insert into tbl_contact(uid,fname,lname,gender,email,city,state,country,mobileno,cdate)values(" + uid + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "',getdate())", con);
                int n=da.SelectCommand.ExecuteNonQuery();
                if (n == 1)
                {
                    Response.Redirect("~/Userlogin.aspx");
                }
            }            
        }
        else
        {
            Label1.Text = "The Username is already taken.Choose another Name.";
            Label1.BackColor = System.Drawing.Color.Red;
        }
    }
}
