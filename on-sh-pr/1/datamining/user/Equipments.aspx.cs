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

public partial class user_Equipments : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetProductEquipments();
            GetItemsFor();
        }
    }

    private void GetProductEquipments()
    {
        da = new SqlDataAdapter("select tpid.pitemdid,tp.productname,tiop.itemfor,tpid.brandname,tpid.imagepath,tpid.cost,tpid.description,tpid.cdate from tbl_productitemdetails tpid inner join tbl_products tp on tpid.pid=tp.pid inner join tbl_itemsofproduct tiop on tp.pid=tiop.pid where tpid.itemid=tiop.itemid and tp.productname='Equipments' ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_pidetails");
        DataList1.DataSource = ds.Tables["tbl_pidetails"].DefaultView;
        DataList1.DataBind();
    }

    private void GetItemsFor()
    {
        da = new SqlDataAdapter("select tpi.itemfor,tpi.itemid from tbl_itemsofproduct tpi inner join tbl_products tp on tpi.pid=tp.pid where tp.productname='Equipments' ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_tpif");
        if (ds.Tables.Count > 0 && ds.Tables["tbl_tpif"].Rows.Count > 0)
        {
            DropDownList1.DataSource = ds.Tables["tbl_tpif"];
            DropDownList1.DataTextField = "itemfor";
            DropDownList1.DataValueField = "itemid";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "---Select---");
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            Response.Redirect("~/user/ViewFullImage.aspx?imgid=" + e.CommandArgument.ToString());
        }
        else if (e.CommandName == "details")
        {
            Response.Redirect("~/user/ViewDetails.aspx?pitemid=" + e.CommandArgument.ToString());
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex > 0)
        {
            da = new SqlDataAdapter("select tpid.pitemdid,tp.productname,tiop.itemfor,tpid.brandname,tpid.imagepath,tpid.cost,tpid.description,tpid.cdate from tbl_productitemdetails tpid inner join tbl_products tp on tpid.pid=tp.pid inner join tbl_itemsofproduct tiop on tp.pid=tiop.pid where tpid.itemid=tiop.itemid and tp.productname='Equipments' and tiop.itemfor='" + DropDownList1.SelectedItem.ToString() + "' ", con);
            ds = new DataSet();
            da.Fill(ds, "tbl_pidetails");
            DataList1.DataSource = ds.Tables["tbl_pidetails"].DefaultView;
            DataList1.DataBind();
        }
    }
}
