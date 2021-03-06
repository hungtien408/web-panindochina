﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using TLLib;

public partial class events_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strTitle1, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["si"]))
            {
                var oService = new Service();
                var oServiceCategory = new ServiceCategory();
                var dv = oServiceCategory.ServiceCategorySelectOne(Request.QueryString["sci"]).DefaultView;
                var dv1 = oService.ServiceSelectOne(Request.QueryString["si"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                if (dv1 != null && dv1.Count <= 0) return;
                var row1 = dv1[0];

                strTitle = Server.HtmlDecode(row1["ServiceTitle"].ToString());
                strDescription = Server.HtmlDecode(row1["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row1["MetaTittle"].ToString());
                strMetaDescription = Server.HtmlDecode(row1["MetaDescription"].ToString());

                strTitle1 = Server.HtmlDecode(row["ServiceCategoryName"].ToString());
                hdnlinkserdetails.Value = progressTitle(dv[0]["ServiceCategoryName"].ToString()) + "-sci-" + dv[0]["ServiceCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strTitle1 = strMetaTitle = "Service";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblTitle.Text = strTitle;
            lblTitle1.Text = strTitle1;
            lblTitle2.Text = strTitle1;
            lblTitle3.Text = strTitle1;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}