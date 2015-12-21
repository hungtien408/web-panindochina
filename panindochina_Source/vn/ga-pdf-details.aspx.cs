using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;
using System.Web.UI.HtmlControls;

public partial class ga_pdf_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["fi"]))
            {
                var oDownload = new Download();
                var oDownloadCategory = new DownloadCategory();
                var dv = oDownload.DownloadSelectOne(Request.QueryString["fi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["DownloadName"].ToString());
                strDescription = Server.HtmlDecode(row["DownloadName"].ToString());
                strMetaTitle = Server.HtmlDecode(row["DownloadName"].ToString());
                strMetaDescription = Server.HtmlDecode(row["DownloadName"].ToString());
            }
            else
            {
                strTitle = strMetaTitle = "PDF";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblTitle.Text = strTitle;
        }
    }
}