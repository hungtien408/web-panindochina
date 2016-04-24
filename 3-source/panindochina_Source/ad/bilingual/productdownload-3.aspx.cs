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


public partial class ad_single_photoalbum : System.Web.UI.Page
{
    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteImage(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            string strOldImagePath = Server.MapPath("~/res/photoalbumcategory/" + strImageName);
            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
        }
    }

    void DeletePhotoAlbum(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/photoalbum/" + strImageName);
            var strThumbImagePath = Server.MapPath("~/res/photoalbum/thumbs/" + strImageName);

            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
            if (File.Exists(strThumbImagePath))
                File.Delete(strThumbImagePath);
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
        else if (e.CommandName == "DeleteSelected")
        {
            var oProductDownload = new ProductDownload();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                string strLinkDownload = ((HiddenField)item.FindControl("hdnLinkDownload")).Value;

                DeleteImage(strLinkDownload);

                //var ProductDownloadCategoryID = item["ProductDownloadCategoryID"].Text;

                var dtProductDownload = oProductDownload.ProductDownloadSelectAll(Request.QueryString["PI"], "True", "", "");

                if (dtProductDownload.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtProductDownload.Rows)
                    {
                        strLinkDownload = dr["LinkDownload"].ToString();
                        DeletePhotoAlbum(strLinkDownload);
                    }
                }
            }
        }
        else if (e.CommandName == "InitInsert" || e.CommandName == "EditSelected" || e.CommandName == "Edit")
        {
            TempImage.Rows.Clear();
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            //var FileImageName = (RadUpload)row.FindControl("FileImageName");

            string ProductDownloadCategoryID = ((HiddenField)row.FindControl("hdnProductDownloadCategoryID")).Value;
            string strProductDownloadCategoryName = ((RadTextBox)row.FindControl("txtProductDownloadCategoryName")).Text.Trim();
            string strProductDownloadCategoryNameEn = ((RadTextBox)row.FindControl("txtProductDownloadCategoryNameEn")).Text.Trim();
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strIsShowOnMenu = ((CheckBox)row.FindControl("chkIsShowOnMenu")).Checked.ToString();
            string strIsShowOnHomePage = ((CheckBox)row.FindControl("chkIsShowOnHomePage")).Checked.ToString();
            string strPriority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();

            var oProductDownloadCategory = new ProductDownloadCategory();

            if (e.CommandName == "PerformInsert")
            {
                oProductDownloadCategory.ProductDownloadCategoryInsert(
                    strProductDownloadCategoryName,
                    strProductDownloadCategoryNameEn,
                    strIsShowOnMenu,
                    strIsShowOnHomePage,
                    strIsAvailable,
                    strPriority
                    );
                //string strFullPath = "~/res/photoalbumcategory/" + strImageName;

                //if (!string.IsNullOrEmpty(strImageName))
                //{
                //    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                //    ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                //}

                ProductDownloadCategoryID = oProductDownloadCategory.ProductDownloadCategoryID;

                //Insert Album's Images
                if (TempImage.Rows.Count > 0)
                {
                    var oProductDownload = new ProductDownload();

                    foreach (DataRow dr in TempImage.Rows)
                        oProductDownload.ProductDownloadInsert(Request.QueryString["PI"], dr["FileName"].ToString(), dr["FileNameEn"].ToString(), dr["LinkDownload"].ToString(), "True", "", ProductDownloadCategoryID);
                }

                RadGrid1.Rebind();
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strProductDownloadCategoryID = row.GetDataKeyValue("ProductDownloadCategoryID").ToString();
                //var strOldImageName = ((HiddenField)row.FindControl("hdnImageName")).Value;
                //var strOldImagePath = Server.MapPath("~/res/photoalbumcategory/" + strOldImageName);

                dsUpdateParam["ProductDownloadCategoryName"].DefaultValue = strProductDownloadCategoryName;
                //dsUpdateParam["ConvertedPhotoAlbumCategoryName"].DefaultValue = strConvertedPhotoAlbumCategoryName;
                //dsUpdateParam["ImageName"].DefaultValue = strImageName;
                dsUpdateParam["IsShowOnMenu"].DefaultValue = strIsShowOnMenu;
                dsUpdateParam["IsShowOnHomePage"].DefaultValue = strIsShowOnHomePage;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;

                //if (!string.IsNullOrEmpty(strImageName))
                //{
                //    var strFullPath = "~/res/photoalbumcategory/" + strConvertedPhotoAlbumCategoryName + "-" + strPhotoAlbumCategoryID + strImageName.Substring(strImageName.LastIndexOf('.'));

                //    if (File.Exists(strOldImagePath))
                //        File.Delete(strOldImagePath);

                //    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                //    ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                //}
            }
        }
        //else if (e.CommandName == "Cancel")
        //{
        //    if (TempImage.Rows.Count > 0)
        //    {
        //        foreach (DataRow row in TempImage.Rows)
        //        {
        //            DeletePhotoAlbum(row["ImageName"].ToString());
        //        }
        //        TempImage.Rows.Clear();
        //    }
        //}
        //else if (e.CommandName == "DeleteImage")
        //{
        //    var oPhotoAlbumCategory = new PhotoAlbumCategory();
        //    var lnkDeleteImage = (LinkButton)e.CommandSource;
        //    var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
        //    var strPhotoAlbumCategoryID = s[0];
        //    var strImageName = s[1];

        //    oPhotoAlbumCategory.PhotoAlbumCategoryImageDelete(strPhotoAlbumCategoryID);
        //    DeleteImage(strImageName);
        //    RadGrid1.Rebind();
        //}
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        //if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        //{
        //    var itemtype = e.Item.ItemType;
        //    var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
        //    var FileImageName = (RadUpload)row.FindControl("FileImageName");

        //    RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileImageName.ClientID));
        //}
    }

    protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView1 = (RadListView)sender;
            var Parent = RadListView1.NamingContainer;
            var OdsProductDownload = (ObjectDataSource)Parent.FindControl("OdsProductDownload");

            if (e.CommandName == "Update")
            {
                var item = e.ListViewItem;
                var dsUpdateParam = OdsProductDownload.UpdateParameters;

                var strOldLinkDownload = ((HiddenField)e.ListViewItem.FindControl("hdnLinkDownload")).Value;
                var strIsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();

                dsUpdateParam["LinkDownload"].DefaultValue = strOldLinkDownload;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
            }
            else if (e.CommandName == "Delete")
            {
                var strOldLinkDownload = ((HiddenField)e.ListViewItem.FindControl("hdnLinkDownload")).Value;
                DeletePhotoAlbum(strOldLinkDownload);
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void RadListView2_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView2 = (RadListView)sender;
            if (e.CommandName == "Delete")
            {
                var Parent = RadListView2.NamingContainer;
                var strOldLinkDownload = ((HiddenField)e.ListViewItem.FindControl("hdnLinkDownload")).Value;
                DeletePhotoAlbum(strOldLinkDownload);

                TempImage.Rows.Cast<DataRow>().Where(c => c["LinkDownload"].ToString() == strOldLinkDownload).Single().Delete();
                RadListView2.DataSource = TempImage;
                RadListView2.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void FileImageAlbum_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        var FileLinkDownload = (RadAsyncUpload)sender;
        var Parent = FileLinkDownload.NamingContainer;
        var ProductDownloadCategoryID = ((HiddenField)Parent.FindControl("hdnProductDownloadCategoryID")).Value;
        var RadListView1 = (RadListView)Parent.FindControl("RadListView1");
        var RadListView2 = (RadListView)Parent.FindControl("RadListView2");

        string targetFolder = "~/res/product/download/";
        string newName = Guid.NewGuid().GetHashCode().ToString("X") + e.File.GetExtension();
        e.File.SaveAs(Server.MapPath(targetFolder + newName));

        //ResizeCropImage.ResizeByCondition(targetFolder + newName, 800, 800);

        //ResizeCropImage.CreateThumbNailByCondition("~/res/photoalbum/", "~/res/photoalbum/thumbs/", newName, 120, 120);

        //if (string.IsNullOrEmpty(ProductDownloadCategoryID))
        //{
        //    TempImage.Rows.Add(new object[] { newName });

        //    RadListView2.DataSource = TempImage;
        //    RadListView2.DataBind();
        //}
        //else
        //{
            var oProductDownload = new ProductDownload();

            oProductDownload.ProductDownloadInsert(Request.QueryString["PI"], "", "", newName, "True", "", ProductDownloadCategoryID);
            RadListView1.Rebind();
        //}
    }
    #endregion

    #region Properties

    private DataTable TempImage
    {
        get { return (DataTable)ViewState["TempImage"]; }
        set { ViewState["TempImage"] = value; }
    }

    #endregion
}