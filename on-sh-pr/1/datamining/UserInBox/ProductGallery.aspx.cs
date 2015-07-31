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
using System.Web.Caching;
using System.Data.SqlClient;

public partial class UserInBox_ProductGallery : System.Web.UI.Page
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
            GetProductNames();
            GetAllProducts();
        }
    }

    private void GetProductNames()
    {
        ds = new DataSet();
        ds = WebService.GetProducts();
        if (ds.Tables.Count > 0 && ds.Tables["tbl_products"].Rows.Count > 0)
        {
            DropDownList1.DataSource = ds.Tables["tbl_products"].DefaultView;
            DropDownList1.DataTextField = "productname";
            DropDownList1.DataValueField = "pid";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "---Select---");
        }
    }

    private void GetProductItemFor(int pid)
    {
        if (DropDownList1.SelectedIndex > 0)
        {
            ds = new DataSet();
            ds = WebService.GetProductItemFor(pid);
            if (ds.Tables.Count > 0 && ds.Tables["tbl_itemsofp"].Rows.Count > 0)
            {
                DropDownList2.DataSource = ds.Tables["tbl_itemsofp"].DefaultView;
                DropDownList2.DataTextField = "itemfor";
                DropDownList2.DataValueField = "itemid";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0,"---Select---");
            }
        }        
    }

    private void GetAllProducts()
    {
        //ds = new DataSet();
        //ds = WebService.GetAllProducts();
        //if (ds.Tables.Count > 0 && ds.Tables["tbl_pidetails"].Rows.Count > 0)
        //{
        //    DataList1.DataSource = ds.Tables["tbl_pidetails"].DefaultView;
        //    DataList1.DataBind();
        //}    

        ds = new DataSet();
        ds = (DataSet)Cache["a"];
        if (ds == null)
        {
            ds = WebService.GetAllProducts();
            Cache.Insert("a", ds, null, DateTime.Now.AddSeconds(60), TimeSpan.Zero);
            Label7.Text = "Data from DataBase";
        }
        else
        {
            Label7.Text = "Data from Cache";
        }
        DataList1.DataSource = ds; //.Tables["tbl_pidetails"].DefaultView;
        DataList1.DataBind();
    }

    private void GetProductsOfType(string PType,string ItemFor)
    {
        ds = new DataSet();
        ds = WebService.GetProductsOfItem(PType,ItemFor);
        if (ds.Tables.Count > 0 && ds.Tables["tbl_pitemdetails"].Rows.Count > 0)
        {
            DataList1.DataSource = ds.Tables["tbl_pitemdetails"].DefaultView;
            DataList1.DataBind();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex > 0)
        {
            GetProductItemFor(Convert.ToInt32(DropDownList1.SelectedValue));
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex > 0 && DropDownList2.SelectedIndex > 0)
        {
            GetProductsOfType(DropDownList1.SelectedItem.Text,DropDownList2.SelectedItem.Text);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        GetAllProducts();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "details")
        {
            Response.Redirect("~/UserInBox/ViewItemDetails.aspx?pitemid=" + e.CommandArgument.ToString());
        }
        
        else if (e.CommandName == "Cart")
        {
            //Response.Redirect("~/UserInBox/AddtoCart.aspx?pitemid=" + e.CommandArgument.ToString());

            da = new SqlDataAdapter("select count(*) from tbl_addtocart tatc inner join tbl_login tl on tatc.uid=tl.uid where tatc.pitemdid=" + Convert.ToInt32(e.CommandArgument.ToString()) + " and tl.uid=" + Convert.ToInt32(Session["uid"].ToString()) + " and tatc.uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
            int n = Convert.ToInt32(da.SelectCommand.ExecuteScalar());
            if (n == 1)
            {
                da = new SqlDataAdapter("select tpd.pitemdid,tpd.brandname,tpd.cost,tpd.imagepath,tl.uid,tatc.cartid from tbl_productitemdetails tpd inner join tbl_addtocart tatc on tpd.pitemdid=tatc.pitemdid inner join tbl_login tl on tl.uid=tatc.uid where tatc.pitemdid=" + Convert.ToInt32(e.CommandArgument.ToString()) + " and tl.uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
                ds = new DataSet();
                da.Fill(ds, "tbl_tpd");
                if (ds.Tables.Count > 0 && ds.Tables["tbl_tpd"].Rows.Count > 0)
                {
                    da = new SqlDataAdapter("update tbl_addtocart set uid=" + Convert.ToInt32(Session["uid"].ToString()) + ",pitemdid=" + Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + ",bname='" + ds.Tables[0].Rows[0][1].ToString() + "',imgpath='" + ds.Tables[0].Rows[0][3].ToString() + "',cost=" + Convert.ToDecimal(ds.Tables[0].Rows[0][2].ToString()) + ",cdate=getdate() where pitemdid=" + Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + " and cartid=" + Convert.ToInt32(ds.Tables[0].Rows[0][5].ToString()) + " and uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
                    da.SelectCommand.ExecuteNonQuery();
                }
            }
            else
            {
                da = new SqlDataAdapter("select tpd.pitemdid,tpd.brandname,tpd.cost,tpd.imagepath from tbl_productitemdetails tpd where tpd.pitemdid=" + Convert.ToInt32(e.CommandArgument.ToString()) + " ", con);
                ds = new DataSet();
                da.Fill(ds, "tbl_tpd");
                if (ds.Tables.Count > 0 && ds.Tables["tbl_tpd"].Rows.Count > 0)
                {
                    da = new SqlDataAdapter("insert into tbl_addtocart(uid,pitemdid,bname,imgpath,cost,qty,totcost,cdate)values(" + Convert.ToInt32(Session["uid"].ToString()) + "," + Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) + ",'" + ds.Tables[0].Rows[0][1].ToString() + "','" + ds.Tables[0].Rows[0][3].ToString() + "'," + Convert.ToDecimal(ds.Tables[0].Rows[0][2].ToString()) + ",1,"+ Convert.ToDecimal(ds.Tables[0].Rows[0][2].ToString()) +",getdate())", con);
                    da.SelectCommand.ExecuteNonQuery();
                }
            }

        }
    }
}
