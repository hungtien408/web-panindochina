using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class customer_catalogue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //lstDownloadCategory.DataSource = odsDowloadCategoryAll;
            //lstDownloadCategory.DataBind();
        }
    }
    protected void dropListBrand_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lstDownloadCategory.DataSource = odsDowloadCategory;
        //lstDownloadCategory.DataBind();
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}