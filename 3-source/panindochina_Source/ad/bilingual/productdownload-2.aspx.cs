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
        if (!IsPostBack)
        {
            TempImage = new DataTable();
            TempImage.Columns.Add("ImageName");
        }
    }

    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "QuickUpdate")
        {
            string ProductDownloadID, Priority, IsAvailable;
            var oProductDownload = new ProductDownload();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProductDownloadID = item.GetDataKeyValue("ProductDownloadID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProductDownload.ProductDownloadQuickUpdate(
                    ProductDownloadID,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            string OldLinkDownload;
            var oProduct = new Product();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                OldLinkDownload = ((HiddenField)item.FindControl("hdnLinkDownload")).Value;
                DeleteFile(OldLinkDownload);
            }
        }
        //else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        //{
        //    var command = e.CommandName;
        //    var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
        //    var FileLinkDownload = (RadUpload)row.FindControl("FileLinkDownload");
        //    string strLinkDownload = FileLinkDownload.UploadedFiles.Count > 0 ? FileLinkDownload.UploadedFiles[0].GetName() : "";
        //    string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();

        //    if (e.CommandName == "PerformInsert")
        //    {
        //        var dsInsertParam = ObjectDataSource1.InsertParameters;

        //        dsInsertParam["LinkDownload"].DefaultValue = strLinkDownload;
        //        dsInsertParam["IsAvailable"].DefaultValue = strIsAvailable;
        //    }
        //    else
        //    {
        //        var dsUpdateParam = ObjectDataSource1.UpdateParameters;
        //        var strOldLinkDownload = ((HiddenField)row.FindControl("hdnLinkDownload")).Value;
        //        var strOldImagePath = Server.MapPath("~/res/product/download/" + strOldLinkDownload);

        //        dsUpdateParam["LinkDownload"].DefaultValue = strLinkDownload;
        //        dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;

        //        if (!string.IsNullOrEmpty(strLinkDownload))
        //            if (File.Exists(strOldImagePath))
        //                File.Delete(strOldImagePath);
        //    }

        //    if (!string.IsNullOrEmpty(strLinkDownload))
        //    {
        //        string strSavePath = Server.MapPath("~/res/product/download/" + strLinkDownload);
        //        FileLinkDownload.UploadedFiles[0].SaveAs(strSavePath);
        //    }
        //}
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileLinkDownload = (RadUpload)row.FindControl("FileLinkDownload");

            //RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileLinkDownload.ClientID));
        }
    }
    protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView1 = (RadListView)sender;
            var Parent = RadListView1.NamingContainer;
            var OdsPhotoAlbum = (ObjectDataSource)Parent.FindControl("OdsPhotoAlbum");

            if (e.CommandName == "Update")
            {
                var item = e.ListViewItem;
                var dsUpdateParam = OdsPhotoAlbum.UpdateParameters;

                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                var strIsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();

                dsUpdateParam["ImageName"].DefaultValue = strOldImageName;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
            }
            else if (e.CommandName == "Delete")
            {
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeleteFile(strOldImageName);
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
    protected void FileDownload_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        var FileDownload = (RadAsyncUpload)sender;
        var Parent = FileDownload.NamingContainer;
        var ProductDownloadCategoryID = ((HiddenField)Parent.FindControl("hdnProductDownloadCategoryID")).Value;
        var RadListView1 = (RadListView)Parent.FindControl("RadListView1");
        var RadListView2 = (RadListView)Parent.FindControl("RadListView2");

        string targetFolder = "~/res/product/download/";
        string newName = Guid.NewGuid().GetHashCode().ToString("X") + e.File.GetExtension();
        e.File.SaveAs(Server.MapPath(targetFolder + newName));

        //if (!string.IsNullOrEmpty(e.File.GetExtension()))
        //{
        //    string strSavePath = Server.MapPath("~/res/product/download/" + e.File.GetExtension());
        //    FileDownload.UploadedFiles[0].SaveAs(strSavePath);
        //}

        if (string.IsNullOrEmpty(ProductDownloadCategoryID))
        {
            TempImage.Rows.Add(new object[] { newName });

            RadListView2.DataSource = TempImage;
            RadListView2.DataBind();
        }
        else
        {
            var oProductDownload = new ProductDownload();

            oProductDownload.ProductDownloadInsert(Request.QueryString["PI"], "", "", newName, "True", "", ProductDownloadCategoryID);

            //var oPhotoAlbum = new PhotoAlbum();

            //oPhotoAlbum.PhotoAlbumInsert(newName, "", "", "", "", "", PhotoAlbumCategoryID, "True",);
            RadListView1.Rebind();
        }

    }
    #endregion

    private DataTable TempImage
    {
        get { return (DataTable)ViewState["TempImage"]; }
        set { ViewState["TempImage"] = value; }
    }
}