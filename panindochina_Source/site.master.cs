using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TLLib;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("-pci-"))
                activePage = "product.aspx";
            else if (page.Contains("chi-tiet-tin-tuc.aspx?id="))
                activePage = "tin-tuc.aspx";
            else if (page.Contains("-dci-"))
                activePage = "customer-faq.aspx";
            else if (page.Contains("-ti-"))
                activePage = "careers.aspx";
            else if (page.Contains("-tci-") || page.Contains("-ti-") || page.Contains("careers.aspx") || page.Contains("events.aspx") || page.Contains("news.aspx"))
                activePage = "gioi-thieu.aspx";
            else if (page.Contains("-sci-"))
                activePage = "services.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }
    }

    protected void btnVN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Path.GetFileName(Request.Url.AbsolutePath);
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        //Response.Redirect("~/vn/" + path);
        Response.Redirect("~/" + path);
    }
    protected void btnEN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Path.GetFileName(Request.Url.AbsolutePath);
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        Response.Redirect("~/" + path);
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
    protected void btnTimKiem_Click(object sender, EventArgs e)
    {
        Response.Redirect("tim-kiem.aspx?kw=" + searchTextBox.Text.Trim());
        //Response.Redirect("tim-kiem.aspx?dm=" + DropDownList1.SelectedValue + "&kw=" + searchTextBox.Text.Trim());
    }
    protected void btnTimKiem2_Click(object sender, EventArgs e)
    {
        Response.Redirect("tim-kiem.aspx?kw=" + searchTextBox2.Text.Trim());
        //Response.Redirect("tim-kiem.aspx?dm=" + DropDownList1.SelectedValue + "&kw=" + searchTextBox.Text.Trim());
    }
}
