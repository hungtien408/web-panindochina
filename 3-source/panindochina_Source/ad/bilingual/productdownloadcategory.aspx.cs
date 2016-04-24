using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;

public partial class ad_single_productdownload : System.Web.UI.Page
{
    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteFile(string strFileName)
    {
        if (!string.IsNullOrEmpty(strFileName))
        {
            var strFilePath = Server.MapPath("~/res/product/download/" + strFileName);

            if (File.Exists(strFilePath))
                File.Delete(strFilePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "QuickUpdate")
        {
            string ProductDownloadCategoryID, Priority, IsShowOnMenu, IsShowOnHomePage, IsAvailable;
            var oProductDownloadCategory = new ProductDownloadCategory();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProductDownloadCategoryID = item.GetDataKeyValue("ProductDownloadCategoryID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsShowOnMenu = ((CheckBox)item.FindControl("chkIsShowOnMenu")).Checked.ToString();
                IsShowOnHomePage = ((CheckBox)item.FindControl("chkIsShowOnHomePage")).Checked.ToString();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProductDownloadCategory.ProductDownloadCategoryQuickUpdate(
                    ProductDownloadCategoryID,
                    IsShowOnMenu,
                    IsShowOnHomePage,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;

            string strIsShowOnMenu = ((CheckBox)row.FindControl("chkIsShowOnMenu")).Checked.ToString();
            string strIsShowOnHomePage = ((CheckBox)row.FindControl("chkIsShowOnHomePage")).Checked.ToString();
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();

            if (e.CommandName == "PerformInsert")
            {
                var dsInsertParam = ObjectDataSource1.InsertParameters;

                dsInsertParam["IsShowOnMenu"].DefaultValue = strIsShowOnMenu;
                dsInsertParam["IsShowOnHomePage"].DefaultValue = strIsShowOnHomePage;
                dsInsertParam["IsAvailable"].DefaultValue = strIsAvailable;
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;

                dsUpdateParam["IsShowOnMenu"].DefaultValue = strIsShowOnMenu;
                dsUpdateParam["IsShowOnHomePage"].DefaultValue = strIsShowOnHomePage;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;   
            } 
        }
    }
    #endregion
    
}