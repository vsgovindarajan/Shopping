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

public partial class Admin_AddItems : System.Web.UI.Page
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

        if (Page.IsPostBack!=true)
        {
            GetItemType();
            Getitemsfor();
        }
    }

    private void GetItemType()
    {
        da = new SqlDataAdapter("select pid,productname from tbl_products", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_product");
        if (ds.Tables.Count > 0 && ds.Tables["tbl_product"].Rows.Count > 0)
        {
            DropDownList1.DataSource = ds.Tables["tbl_product"];
            DropDownList1.DataTextField = "productname";
            DropDownList1.DataValueField = "pid";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "--select--");
        }
    }

    private void Getitemsfor()
    {
        da = new SqlDataAdapter("select tip.itemid,tp.productname,tip.itemfor,tip.cdate from tbl_itemsofproduct tip inner join tbl_products tp on tip.pid=tp.pid", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_tip");
        GridView1.DataSource = ds.Tables["tbl_tip"].DefaultView;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            da = new SqlDataAdapter("insert into tbl_itemsofproduct(pid,itemfor,cdate)values(" + Convert.ToInt32(DropDownList1.SelectedValue.ToString()) + ",'" + TextBox1.Text + "',getdate())", con);
            int n = da.SelectCommand.ExecuteNonQuery();
            if (n == 1)
            {
                Getitemsfor();
                TextBox1.Text = "";
                DropDownList1.SelectedIndex = 0;

            }
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        Label itemid = new Label();

        itemid = (Label)GridView1.Rows[e.RowIndex].Cells[1].FindControl("itemid");
        if (itemid.Text != "")
        {
            da = new SqlDataAdapter("delete from tbl_itemsofproduct where itemid=" + Convert.ToInt32(itemid.Text) + " ", con);
            int n = da.SelectCommand.ExecuteNonQuery();
            if (n == 1)
            {
                Getitemsfor();
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Getitemsfor();
    }
}
