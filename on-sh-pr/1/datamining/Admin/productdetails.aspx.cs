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


public partial class Admin_productdetails : System.Web.UI.Page
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
            Getproductdetails();
        }
    }

    private void Getproductdetails()
    {
        da = new SqlDataAdapter("select pitemdid,brandname,imagepath,cost,description,cdate from tbl_productitemdetails", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_pidetails");
        GridView1.DataSource = ds.Tables["tbl_pidetails"].DefaultView;
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label itemid = new Label();

        itemid = (Label)GridView1.Rows[e.RowIndex].Cells[1].FindControl("itemid");
        if (itemid.Text != "")
        {
            da = new SqlDataAdapter("delete from tbl_productitemdetails where pitemdid=" + Convert.ToInt32(itemid.Text) + " ", con);
            int n = da.SelectCommand.ExecuteNonQuery();
            if (n == 1)
            {
                Getproductdetails();
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Getproductdetails();
    }
}
