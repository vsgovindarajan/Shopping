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

public partial class UserInBox_SoldProducts : System.Web.UI.Page
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

        if (Session.Count > 0)
        {
            if (!Page.IsPostBack)
            {
                GetCustomersoldArts(Convert.ToInt32(Session["uid"].ToString()));
            }
        }
    }

    private void GetCustomersoldArts(int uid)
    {
        da = new SqlDataAdapter("select tsp.spid,tsp.brandname,tsp.cost,tsp.imgpath,tsp.cdate from tbl_soldproducts tsp inner join tbl_login tl on tl.uid=tsp.uid where tl.uid=" + uid + " ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_tsp");
        GridView1.DataSource = ds.Tables["tbl_tsp"].DefaultView;
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetCustomersoldArts(Convert.ToInt32(Session["uid"].ToString()));
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label spid = new Label();

        spid = (Label)GridView1.Rows[e.RowIndex].Cells[1].FindControl("spid");
        if (spid.Text != "")
        {
            da = new SqlDataAdapter("delete from tbl_soldproducts where spid=" + Convert.ToInt32(spid.Text) + " ", con);
            int n = da.SelectCommand.ExecuteNonQuery();
            if (n == 1)
            {
                GetCustomersoldArts(Convert.ToInt32(Session["uid"].ToString()));
            }
        }
    }
}
