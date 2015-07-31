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

public partial class UserInBox_ViewItemDetails : System.Web.UI.Page
{
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

    private void GetProductItemdetails(int pid)
    {
        ds = new DataSet();
        ds = WebService.GetselectedProductDetails(pid);
        if (ds.Tables.Count > 0 && ds.Tables["tbl_pidetails"].Rows.Count > 0)
        {
            FormView1.DataSource = ds.Tables["tbl_pidetails"].DefaultView;
            FormView1.DataBind();
        }
    }
}
