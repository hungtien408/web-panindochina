﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;

public partial class ad_single_productdownloadofsame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridCommandItem)
        {
            GridCommandItem commandItem = (e.Item as GridCommandItem);
            PlaceHolder container = (PlaceHolder)commandItem.FindControl("PlaceHolder1");
            Label label = new Label();
            label.Text = "&nbsp;&nbsp;";

            container.Controls.Add(label);

            for (int i = 65; i <= 65 + 25; i++)
            {
                LinkButton linkButton1 = new LinkButton();

                LiteralControl lc = new LiteralControl("&nbsp;&nbsp;");

                linkButton1.Text = "" + (char)i;

                linkButton1.CommandName = "alpha";
                linkButton1.CommandArgument = "" + (char)i;

                container.Controls.Add(linkButton1);
                container.Controls.Add(lc);
            }

            LiteralControl lcLast = new LiteralControl("&nbsp;");
            container.Controls.Add(lcLast);

            LinkButton linkButtonAll = new LinkButton();
            linkButtonAll.Text = "Tất cả";
            linkButtonAll.CommandName = "NoFilter";
            container.Controls.Add(linkButtonAll);
        }
    }

    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "QuickUpdate")
        {
            string ProductDownloadOfSameID, Priority, IsAvailable;
            var oProductDownloadOfSame = new ProductDownloadOfSame();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProductDownloadOfSameID = item.GetDataKeyValue("ProductDownloadOfSameID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProductDownloadOfSame.ProductDownloadOfSameQuickUpdate(
                    ProductDownloadOfSameID,
                    Priority,
                    IsAvailable
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var ProductDownloadOfSame = new ProductDownloadOfSame();

            string errorList = "", FileName = "";

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                try
                {
                    var ProductDownloadOfSameID = item.GetDataKeyValue("ProductDownloadOfSameID").ToString();
                    FileName = item["FileName"].Text;
                    ProductDownloadOfSame.ProductDownloadOfSameDelete(ProductDownloadOfSameID);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                    if (ex.Message == ((int)ErrorNumber.ConstraintConflicted).ToString())
                        errorList += ", " + FileName;
                }
            }
            if (!string.IsNullOrEmpty(errorList))
            {
                e.Canceled = true;
                string strAlertMessage = "Bài viết <b>\"" + errorList.Remove(0, 1).Trim() + " \"</b> đang chứa thư viện ảnh hoặc file download .<br /> Xin xóa ảnh hoặc file trong sản phẩm này hoặc thiết lập hiển thị = \"không\".";
                lblError.Text = strAlertMessage;
            }
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            string errorList = "", FileName = "";
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var oProductDownloadOfSame = new ProductDownloadOfSame();

            var RadGrid2 = (RadGrid)row.FindControl("RadGrid2");
            foreach (GridDataItem item in RadGrid2.SelectedItems)
            {
                var ProductDownloadID = item.GetDataKeyValue("ProductDownloadID").ToString();
                FileName = item["FileName"].Text;
                oProductDownloadOfSame.ProductDownloadOfSameInsert(ProductDownloadID, "1", "", string.IsNullOrEmpty(Request.QueryString["pi"]) ? "" : Request.QueryString["pi"]);
                //try
                //{
                    
                //    //oProductOfSame.ProductOfSameInsert(ProductID, "1", "", "90");
                //}
                //catch (Exception ex)
                //{
                //    lblError.Text = ex.Message;
                //    if (ex.Message == ((int)ErrorNumber.ConstraintConflicted).ToString())
                //        errorList += ", " + ProductName;
                //}
            }
            
            RadGrid1.Rebind();
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
    }
    protected void RadGrid2_ItemCommand(object sender, GridCommandEventArgs e)
    {

    }
}