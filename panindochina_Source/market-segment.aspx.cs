using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class market_segment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["mi"]))
            {
                var oArticle = new Article();
                var oArticleCategory = new ArticleCategory();
                var dv = oArticle.ArticleSelectOne(Request.QueryString["mi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ArticleTitleEn"].ToString());
                strDescription = Server.HtmlDecode(row["DescriptionEn"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittleEn"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());

                hdnlinkms.Value = progressTitle(row["ArticleTitleEn"].ToString()) + "-tci-" + row["ArticleCategoryID"] + "-mi-" + row["ArticleID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Market Segment";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            //var dv2 = (DataView)odsTinTucNoiBat.Select();
            //hdnArticleID.Value = dv2[0]["ArticleID"].ToString();
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