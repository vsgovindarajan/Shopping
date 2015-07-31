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

public partial class UserInBox_Order : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count > 0)
        {
            if (Page.IsPostBack != true)
            {
            }
        }

        //if (Request.QueryString.Count > 0 && Session.Count>0)
        //{
        //    int pitemid = Convert.ToInt32(Request.QueryString["pitemid"].ToString());
        //    if (pitemid != 0)
        //    {
        //        GetProductItemdetails(pitemid);
        //    }
        //}
    }

    private void GetProductItemdetails(int pid)
    {
        ds = new DataSet();
        ds = WebService.GetselectedProductDetails(pid);
        if (ds.Tables.Count > 0 && ds.Tables["tbl_pidetails"].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables["tbl_pidetails"].DefaultView;
            GridView1.DataBind();

            Session["pitemdid"] = ds.Tables["tbl_pidetails"].Rows[0][0].ToString();
            Session["productname"] = ds.Tables["tbl_pidetails"].Rows[0][1].ToString();
            Session["itemfor"] = ds.Tables["tbl_pidetails"].Rows[0][2].ToString();
            Session["imagepath"] = ds.Tables["tbl_pidetails"].Rows[0][5].ToString();
            Session["bname"] = ds.Tables["tbl_pidetails"].Rows[0][3].ToString();
            Session["cost"] = ds.Tables["tbl_pidetails"].Rows[0][6].ToString();
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == true)
        {
            string s = RadioButton1.Text;
            Response.Redirect("~/UserInBox/creditordebitcard.aspx?card=" + s.ToString());
        }

        if (RadioButton2.Checked == true)
        {
            string s = RadioButton2.Text;
            Response.Redirect("~/UserInBox/draftorcheck.aspx?draft=" + s.ToString());
        }
    }
}
