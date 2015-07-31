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

public partial class Admin_Customers : System.Web.UI.Page
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
            Getcustomers();
        }
    }

    private void Getcustomers()
    {
        da = new SqlDataAdapter("select uid,uname,status,cdate from tbl_login", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_login");
        GridView1.DataSource = ds.Tables["tbl_login"].DefaultView;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Getcustomers();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Artist")
        {
            da = new SqlDataAdapter("select status from tbl_login where uid=" + Convert.ToInt32(e.CommandArgument.ToString()) + " ", con);
            ds = new DataSet();
            da.Fill(ds, "tbl_login");
            if (ds.Tables.Count > 0 && ds.Tables["tbl_login"].Rows.Count > 0)
            {
                if (ds.Tables["tbl_login"].Rows[0][0].ToString() == "Activate")
                {
                    da = new SqlDataAdapter("update tbl_login set status='Deactivate' where uid=" + Convert.ToInt32(e.CommandArgument.ToString()) + " ", con);
                    int n = da.SelectCommand.ExecuteNonQuery();
                    if (n == 1)
                    {
                        Getcustomers();
                    }
                }
                else if (ds.Tables["tbl_login"].Rows[0][0].ToString() == "Deactivate")
                {
                    da = new SqlDataAdapter("update tbl_login set status='Activate' where uid=" + Convert.ToInt32(e.CommandArgument.ToString()) + " ", con);
                    int n = da.SelectCommand.ExecuteNonQuery();
                    if (n == 1)
                    {
                        Getcustomers();
                    }
                }
            }
        }
        else if (e.CommandName == "sview")
        {
            Response.Redirect("~/salesman/CustomerSoldProducts.aspx?uid=" + e.CommandArgument.ToString());
        }
        else if (e.CommandName == "cview")
        {
            Response.Redirect("~/salesman/CustomerCardDetails.aspx?uid=" + e.CommandArgument.ToString());
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label uid = new Label();

        uid = (Label)GridView1.Rows[e.RowIndex].Cells[1].FindControl("uid");

        if (uid.Text != "")
        {
            da = new SqlDataAdapter("delete from tbl_login where uid=" + Convert.ToInt32(uid.Text) + " ", con);
            int res = da.SelectCommand.ExecuteNonQuery();
            if (res == 1)
            {
                Getcustomers();
            }
        }
    }
}
