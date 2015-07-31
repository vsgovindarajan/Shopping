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


public partial class user_draftorcheck : System.Web.UI.Page
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
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ArrayList arr = new ArrayList();
        if (Session.Count > 0)
        {
            da = new SqlDataAdapter("select cartid from tbl_addtocart where uid=" + Convert.ToInt32(Session["uid"].ToString()) + " ", con);
            ds = new DataSet();
            da.Fill(ds, "tbl_tatc");
            if (ds.Tables["tbl_tatc"].Rows.Count > 0 && ds.Tables.Count > 0)
            {
                for (int i = 0; i < ds.Tables["tbl_tatc"].Rows.Count; i++)
                {
                    arr.Add(ds.Tables["tbl_tatc"].Rows[i][0].ToString());
                }
                if (arr.Count > 0)
                {
                    for (int j = 0; j < arr.Count; j++)
                    {
                        da = new SqlDataAdapter("select bname,imgpath,cost from tbl_addtocart where cartid=" + arr[j] + " ", con);
                        ds = new DataSet();
                        da.Fill(ds, "tbl_tatc");
                        if (ds.Tables.Count > 0 && ds.Tables["tbl_tatc"].Rows.Count > 0)
                        {
                            da = new SqlDataAdapter("insert into tbl_soldproducts(uid,brandname,imgpath,cost,cdate)values(" + Convert.ToInt32(Session["uid"].ToString()) + ",'" + ds.Tables["tbl_tatc"].Rows[0][0].ToString() + "','" + ds.Tables["tbl_tatc"].Rows[0][1].ToString() + "'," + Convert.ToDecimal(ds.Tables["tbl_tatc"].Rows[0][2].ToString()) + ",getdate())", con);
                            da.SelectCommand.ExecuteNonQuery();
                        }
                    }

                    da = new SqlDataAdapter("insert into tbl_shipping(uid,fname,lname,gender,email,city,state,country,mobileno,cdate)values(" + Convert.ToInt32(Session["uid"].ToString()) + ",'" + Session["fname"].ToString() + "','" + Session["lname"].ToString() + "','" + Session["gender"].ToString() + "','" + Session["email"].ToString() + "','" + Session["city"].ToString() + "','" + Session["state"].ToString() + "','" + Session["country"].ToString() + "','" + Session["mobileno"].ToString() + "',getdate())", con);
                    da.SelectCommand.ExecuteNonQuery();

                    // da = new SqlDataAdapter("insert into tbl_soldproducts(uid,pitemdid,productname,itemfor,brandname,imgpath,cost,cdate)values(" + Convert.ToInt32(Session["uid"].ToString()) + "," + Convert.ToInt32(Session["pitemdid"].ToString()) + ",'" + Session["productname"].ToString() + "','" + Session["itemfor"].ToString() + "','" + Session["bname"].ToString() + "','" + Session["imagepath"].ToString() + "'," + Convert.ToDecimal(Session["cost"].ToString()) + ",getdate())", con);
                    // da.SelectCommand.ExecuteNonQuery();

                    da = new SqlDataAdapter("insert into tbl_cardtype(uid,cardname,cdate)values(" + Convert.ToInt32(Session["uid"].ToString()) + ",'DraftorCheck',getdate())", con);
                    da.SelectCommand.ExecuteNonQuery();
                    string s = "your artconfirmation is successfully completed.";
                    Response.Redirect("~/UserInBox/Productconfirmation.aspx?confirm=" + s.ToString());

                }
            }
        }
    }
}
