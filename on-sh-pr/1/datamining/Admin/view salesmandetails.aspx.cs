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

public partial class Admin_view_salesmandetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack != true)
        {
            getdetails();

        }
    }
    private void getdetails()
    {
        da = new SqlDataAdapter("select * from tbl_newemp", con);
        ds = new DataSet();
        da.Fill(ds, "newemp");
        GridView1.DataSource = ds.Tables["newemp"];
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label eid = new Label();
        eid = (Label)GridView1.Rows[e.RowIndex].Cells[2].FindControl("eid");
        cmd = new SqlCommand("delete from tbl_newemp where eid=" + eid.Text + "", con);
        con.Open();
        int k = cmd.ExecuteNonQuery();
        con.Close();
        if (k == 1)
        {
            Response.Write("<script>alert('Employee Deleted Successfully')</script>");
            getdetails();
        }
        else
        {
            Response.Write("<script>alert('Error Occured While Deleting')</script>");
            getdetails();
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        getdetails();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label eid = new Label();
        TextBox phno = new TextBox();
        TextBox emailid = new TextBox();
        eid = (Label)GridView1.Rows[e.RowIndex].Cells[2].FindControl("empid1");
        phno = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].FindControl("phno1");
        emailid = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].FindControl("emailid1");
        cmd = new SqlCommand("update  tbl_newemp set phno='" + phno.Text + "', email='" + emailid.Text + "' where eid=" + eid.Text + "", con);
        con.Open();
        int k = cmd.ExecuteNonQuery();
        con.Close();
        if (k == 1)
        {
            Response.Write("<script>alert('Employee Updated Successfully')</script>");
            GridView1.EditIndex = -1;
            getdetails();

        }
        else
        {
            Response.Write("<script>alert('Error Occured While Updating')</script>");
            getdetails();
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        getdetails();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        getdetails();
    }
}
