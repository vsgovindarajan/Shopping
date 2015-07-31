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

public partial class user_ViewDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
            int pitemid = Convert.ToInt32(Request.QueryString["pitemid"].ToString());
            if (pitemid != 0)
            {
                GetProductItemdetails(pitemid);
            }
        }
    }

    private void GetProductItemdetails(int pitemdid)
    {
        da = new SqlDataAdapter("select tpid.pitemdid,tp.productname,tiop.itemfor,tpid.brandname,tpid.imagepath,tpid.cost,tpid.description,tpid.cdate from tbl_productitemdetails tpid inner join tbl_products tp on tpid.pid=tp.pid inner join tbl_itemsofproduct tiop on tp.pid=tiop.pid where tpid.itemid=tiop.itemid and tpid.pitemdid="+pitemdid+" ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_pidetails");
        FormView1.DataSource = ds.Tables["tbl_pidetails"].DefaultView;
        FormView1.DataBind();
    }
}
