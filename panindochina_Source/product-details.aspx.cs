using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class product_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsProductSameCategory.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
            {
                var oProduct = new Product();
                var oProductCategory = new ProductCategory();
                var dv = oProduct.ProductSelectOne(Request.QueryString["pi"]).DefaultView;
                var dv1 = oProductCategory.ProductCategorySelectOne(Request.QueryString["pci"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductNameEn"].ToString());
                strDescription = Server.HtmlDecode(row["DescriptionEn"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittleEn"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());

                hdnlinkprodetails.Value = progressTitle(dv1[0]["ProductCategoryNameEn"].ToString()) + "-pci-" + dv1[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Products";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblTitle.Text = strTitle;
            lblTitle1.Text = strTitle;
            lblProductTitle.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}