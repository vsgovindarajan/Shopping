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

public partial class UserInBox_AddtoCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;

    decimal totcost = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        if (Page.IsPostBack != true)
        {
            GetUserSelectedproducts(Convert.ToInt32(Session["uid"].ToString()));
            GetTotal();
        }
    }

    private void GetUserSelectedproducts(int uid)
    {
        da = new SqlDataAdapter("select tatc.cartid,tatc.bname,tatc.imgpath,tatc.cost,tatc.qty,tatc.totcost from tbl_addtocart tatc inner join tbl_login tl on tl.uid=tatc.uid where tatc.uid=" + uid + " ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_tatc");
        GridView1.DataSource = ds.Tables["tbl_tatc"].DefaultView;
        GridView1.DataBind();
    }

    protected void qty_TextChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {
            TextBox qty = (TextBox)gr.Cells[4].FindControl("qty");
            int quantity = Convert.ToInt32(qty.Text);           

            Label cartid = (Label)gr.Cells[0].FindControl("cartid");

            Label cost = (Label)gr.Cells[3].FindControl("cost");
            decimal totcost1 = Convert.ToDecimal(cost.Text);

            totcost1 = totcost1 * quantity;
            gr.Cells[5].Text = totcost1.ToString();

            totcost = totcost + totcost1;

            if (cartid.Text != "")
            {
                da = new SqlDataAdapter("update tbl_addtocart set qty=" + quantity + ",totcost="+totcost1+" where cartid=" + Convert.ToInt32(cartid.Text) + " and uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
                int n = da.SelectCommand.ExecuteNonQuery();
                if (n == 1)
                {
                    GetUserSelectedproducts(Convert.ToInt32(Session["uid"].ToString()));
                }
            }

            
            //gr.Cells[5].Text=
        }

        Label1.Text = totcost.ToString();        
    }


    private void GetTotal()
    {        
        foreach (GridViewRow gr in GridView1.Rows)
        {
            Label tcost = (Label)gr.Cells[5].FindControl("tcost");
            decimal totalcost = Convert.ToDecimal(tcost.Text);
            totcost = totcost+totalcost;
        }
        Label1.Text = totcost.ToString();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label cartid = new Label();
        cartid = (Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("cartid");

        if (cartid.Text != "")
        {
            da = new SqlDataAdapter("delete from tbl_addtocart where cartid=" + Convert.ToInt32(cartid.Text) + " and uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
            int n=da.SelectCommand.ExecuteNonQuery();
            if (n == 1)
            {                
                GetUserSelectedproducts(Convert.ToInt32(Session["uid"].ToString()));
                GetTotal();
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Convert.ToDecimal(Label1.Text)>0)
        {
            Response.Redirect("~/UserInBox/billingandshopping.aspx");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetUserSelectedproducts(Convert.ToInt32(Session["uid"].ToString()));
    }
}
