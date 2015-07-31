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


public partial class Admin_AddItemType : System.Web.UI.Page
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
            GetItemTypes();
        }

    }

    private void GetItemTypes()
    {
        da = new SqlDataAdapter("select pid,productname,cdate from tbl_products", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_product");
        GridView1.DataSource = ds.Tables["tbl_product"].DefaultView;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("insert into tbl_products(productname,cdate)values('" + TextBox1.Text + "',getdate())", con);
        int n= da.SelectCommand.ExecuteNonQuery();
        if (n == 1)
        {
            GetItemTypes();
            TextBox1.Text = "";
        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {       
        Label pid = new Label();

        pid = (Label)GridView1.Rows[e.RowIndex].Cells[1].FindControl("pid");
        if (pid.Text != "")
        {
            da = new SqlDataAdapter("delete from tbl_products where pid=" + Convert.ToInt32(pid.Text) + " ", con);
            int n = da.SelectCommand.ExecuteNonQuery();
            if (n == 1)
            {
                GetItemTypes();
            }
        }

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetItemTypes();
    }
}
