using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class gioi_thieu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["tri"]))
            {
                var oArticle = new Article();
                var oArticleCategory = new ArticleCategory();
                var dv = oArticleCategory.ArticleCategorySelectOne(Request.QueryString["tri"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ArticleCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                hdnlinkgt.Value = progressTitle(row["ArticleCategoryName"].ToString()) + "-tci-" + row["ParentID"] + "-tri-" + row["ArticleCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Giới Thiệu";
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