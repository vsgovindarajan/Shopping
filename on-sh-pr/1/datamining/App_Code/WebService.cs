using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for WebService
/// </summary>
/// 

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public class WebService : System.Web.Services.WebService 
{
    static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    static SqlDataAdapter da;
    static DataSet ds;
    static SqlCommand cmd;

    public WebService () 
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
           
    [WebMethod]

    public static DataSet GetProducts()
    {
        da = new SqlDataAdapter("select pid,productname from tbl_products", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_products");
        return ds;
    }

    [WebMethod]
    public static DataSet GetProductItemFor(int pid)
    {
        da = new SqlDataAdapter("select itemid,itemfor from tbl_itemsofproduct tip inner join tbl_products tp on tip.pid=tp.pid where tip.pid="+pid+" ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_itemsofp");
        return ds;
    }

    [WebMethod]
    public static DataSet GetAllProducts()
    {
        da = new SqlDataAdapter("select tpid.pitemdid,tp.productname,tiop.itemfor,tpid.brandname,tpid.imagepath,tpid.cost,tpid.description,tpid.cdate from tbl_productitemdetails tpid inner join tbl_products tp on tpid.pid=tp.pid inner join tbl_itemsofproduct tiop on tp.pid=tiop.pid where tpid.itemid=tiop.itemid", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_pidetails");
        return ds;
    }

    [WebMethod]
    public static DataSet GetProductsOfItem(string ptype, string itemfor)
    {
        da = new SqlDataAdapter("select tpid.pitemdid,tp.productname,tiop.itemfor,tpid.brandname,tpid.imagepath,tpid.cost,tpid.description,tpid.cdate from tbl_productitemdetails tpid inner join tbl_products tp on tpid.pid=tp.pid inner join tbl_itemsofproduct tiop on tp.pid=tiop.pid where tpid.itemid=tiop.itemid and tp.productname='" + ptype.ToString() + "' and tiop.itemfor='" + itemfor.ToString() + "' ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_pitemdetails");
        return ds;
    }

    [WebMethod]
    public static DataSet GetselectedProductDetails(int pid)
    {
        da = new SqlDataAdapter("select tpid.pitemdid,tp.productname,tiop.itemfor,tpid.brandname,tpid.description,tpid.imagepath,tpid.cost,tpid.cdate from tbl_productitemdetails tpid inner join tbl_products tp on tpid.pid=tp.pid inner join tbl_itemsofproduct tiop on tp.pid=tiop.pid where tpid.itemid=tiop.itemid and tpid.pitemdid=" + pid + " ", con);
        ds = new DataSet();
        da.Fill(ds, "tbl_pidetails");
        return ds;
    }
}

