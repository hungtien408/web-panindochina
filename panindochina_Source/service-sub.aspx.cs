using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TLLib;
using System.Web.UI.HtmlControls;

public partial class service_sub : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsService.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["sci"]))
            {
                var oService = new Service();
                var oServiceCategory = new ServiceCategory();
                var dv = oServiceCategory.ServiceCategorySelectOne(Request.QueryString["sci"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ServiceCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                hdnlinkser.Value = progressTitle(row["ServiceCategoryName"].ToString()) + "-sci-" + row["ServiceCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Service";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblTitle.Text = strTitle;
            lblTitle1.Text = strTitle;
            lblTitle2.Text = strTitle;
            lblTitle3.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}