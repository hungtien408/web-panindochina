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
using System.Text;

public partial class ad_single_download : System.Web.UI.Page
{

    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    protected void DropDownList_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        var cbo = (RadComboBox)sender;
        if (Convert.ToInt32(cbo.SelectedItem.Value) == 14)
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "$('#question').removeClass('invisible');$('#answer').removeClass('invisible');$('#questionEn').removeClass('invisible');$('#answerEn').removeClass('invisible');", true);
        }
    }

    void DeleteImage(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/download/thumbs/" + strImageName);
            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
        }
    }
    void DeletePhotoCatalogue(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/download/album/" + strImageName);

            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
        }
    }
    void DeleteDownload(string strDownloadName)
    {
        if (!string.IsNullOrEmpty(strDownloadName))
        {
            var strFilePath = Server.MapPath("~/res/download/" + strDownloadName);
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
        if (e.CommandName == "alpha" || e.CommandName == "NoFilter")
        {
            String value = null;
            switch (e.CommandName)
            {
                case ("alpha"):
                    {
                        value = string.Format("{0}%", e.CommandArgument);
                        break;
                    }
                case ("NoFilter"):
                    {
                        value = "%";
                        break;
                    }
            }
            ObjectDataSource1.SelectParameters["DownloadName"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string DownloadID, Priority, IsAvailable;
            var oDownload = new Download();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                DownloadID = item.GetDataKeyValue("DownloadID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oDownload.DownloadQuickUpdate(
                    DownloadID,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            string OldImageName, OldFilePath;
            var oDownload = new Download();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                OldImageName = ((HiddenField)item.FindControl("hdnImageName")).Value;
                OldFilePath = ((HiddenField)item.FindControl("hdnFilePath")).Value;
                DeleteImage(OldImageName);
                DeleteDownload(OldFilePath);
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
            var FileImageName = (RadUpload)row.FindControl("FileImageName");
            var FileFilePath = (RadUpload)row.FindControl("FileFilePath");
            var oDownload = new Download();

            string DownloadID = ((HiddenField)row.FindControl("hdnDownloadID")).Value;
            string OldImageName = ((HiddenField)row.FindControl("hdnOldImageName")).Value;
            string OldFilePath = ((HiddenField)row.FindControl("hdnOldFilePath")).Value;
            string ImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
            string FilePath = FileFilePath.UploadedFiles.Count > 0 ? FileFilePath.UploadedFiles[0].GetName() : "";
            string Priority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();
            string DownloadName = ((TextBox)row.FindControl("txtDownloadName")).Text.Trim();
            string DownloadNameEn = ((TextBox)row.FindControl("txtDownloadNameEn")).Text.Trim();
            string strQuestion = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtQuestion")).Content.Trim()));
            string strAnswer = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtAnswer")).Content.Trim()));
            string strQuestionEn = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtQuestionEn")).Content.Trim()));
            string strAnswerEn = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtAnswerEn")).Content.Trim()));
            string ConvertedDownloadName = Common.ConvertTitle(DownloadName);
            string DownloadCategoryID = "3";//((RadComboBox)row.FindControl("ddlCategory")).SelectedValue;
            //if ("".Equals(DownloadCategoryID))
            //    DownloadCategoryID = "3";
            string IsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();

            if (e.CommandName == "PerformInsert")
            {
                DownloadID = oDownload.DownloadInsert(
                    DownloadName,
                    DownloadNameEn,
                    strQuestion,
                    strAnswer,
                    strQuestionEn,
                    strAnswerEn,
                    ConvertedDownloadName, 
                    ImageName, 
                    FilePath, 
                    DownloadCategoryID, 
                    IsAvailable, 
                    Priority
                ).ToString();

                ImageName = string.IsNullOrEmpty(ImageName) ? "" : (string.IsNullOrEmpty(ConvertedDownloadName) ? "" : ConvertedDownloadName + "-") + DownloadID + Path.GetExtension(FileImageName.UploadedFiles[0].GetName());

                string strFullImagePath = "~/res/download/thumbs/" + ImageName;
                string strFullFilePath = "~/res/download/" + FilePath;

                if (FileFilePath.UploadedFiles.Count > 0)
                {
                    FileFilePath.UploadedFiles[0].SaveAs(Server.MapPath(strFullFilePath));
                }

                if (FileImageName.UploadedFiles.Count > 0)
                {
                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullImagePath));
                    //ResizeCropImage.ResizeByCondition(strFullImagePath, 270, 360);
                    string bgColor = "#ffffff";
                    ResizeCropImage.ResizeWithBackGroundColor(strFullImagePath, 270, 360, bgColor);

                }

                if (TempImage.Rows.Count > 0)
                {
                    var oDownloadImage = new DownloadImage();

                    foreach (DataRow dr in TempImage.Rows)
                    {
                        oDownloadImage.DownloadImageInsert(dr["ImageName"].ToString(), "", "", "", "", "", DownloadID, "True", "");
                    }
                }
                RadGrid1.Rebind();
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strOldImagePath = Server.MapPath("~/res/download/thumbs/" + OldImageName);
                var strOldFilePath = Server.MapPath("~/res/download/" + OldFilePath);

                dsUpdateParam["ConvertedDownloadName"].DefaultValue = ConvertedDownloadName;
                dsUpdateParam["ImageName"].DefaultValue = ImageName;
                dsUpdateParam["FilePath"].DefaultValue = FilePath;
                dsUpdateParam["DownloadCategoryID"].DefaultValue = DownloadCategoryID;
                dsUpdateParam["IsAvailable"].DefaultValue = IsAvailable;

                if (!string.IsNullOrEmpty(FilePath))
                {
                    if (File.Exists(strOldFilePath))
                        File.Delete(strOldFilePath);

                    string strFullPath = "~/res/download/" + FilePath;

                    FileFilePath.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                }

                if (!string.IsNullOrEmpty(ImageName))
                {
                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);

                    ImageName = (string.IsNullOrEmpty(ConvertedDownloadName) ? "" : ConvertedDownloadName + "-") + DownloadID + ImageName.Substring(ImageName.LastIndexOf('.'));

                    string strFullPath = "~/res/download/thumbs/" + ImageName;

                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 270, 360);
                    string bgColor = "#ffffff";
                    ResizeCropImage.ResizeWithBackGroundColor(strFullPath, 270, 360, bgColor);
                }

                
            }
        }
        else if (e.CommandName == "Cancel")
        {
            if (TempImage.Rows.Count > 0)
            {
                foreach (DataRow row in TempImage.Rows)
                {
                    DeletePhotoCatalogue(row["ImageName"].ToString());
                }
                TempImage.Rows.Clear();
            }
        }
        if (e.CommandName == "DeleteImage")
        {
            var oDownload = new Download();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strDownloadID = s[0];
            var ImageName = s[1];

            oDownload.DownloadImageDelete(strDownloadID);
            DeleteImage(ImageName);
            RadGrid1.Rebind();
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");
            var FileFilePath = (RadUpload)row.FindControl("FileFilePath");
            var dv = (DataView)ObjectDataSource1.Select();
            var DownloadID = ((HiddenField)row.FindControl("hdnDownloadID")).Value;
            var ddlCategory = (RadComboBox)row.FindControl("ddlCategory");

            if (!string.IsNullOrEmpty(DownloadID))
            {
                dv.RowFilter = "DownloadID = " + DownloadID;

                if (!string.IsNullOrEmpty(dv[0]["CategoryID"].ToString()))
                    ddlCategory.SelectedValue = dv[0]["CategoryID"].ToString();
            }
            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId1'] = '{0}';", FileImageName.ClientID));
            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId2'] = '{0}';", FileFilePath.ClientID));
        }
    }

    protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView1 = (RadListView)sender;
            var Parent = RadListView1.NamingContainer;
            var OdsDownloadImage = (ObjectDataSource)Parent.FindControl("OdsDownloadImage");

            if (e.CommandName == "Update")
            {
                var item = e.ListViewItem;
                var dsUpdateParam = OdsDownloadImage.UpdateParameters;

                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                var strIsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();

                dsUpdateParam["ImageName"].DefaultValue = strOldImageName;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
            }
            else if (e.CommandName == "Delete")
            {
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeletePhotoCatalogue(strOldImageName);
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
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeletePhotoCatalogue(strOldImageName);

                TempImage.Rows.Cast<DataRow>().Where(c => c["ImageName"].ToString() == strOldImageName).Single().Delete();
                RadListView2.DataSource = TempImage;
                RadListView2.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void FileDownloadImage_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        var FileDownloadImage = (RadAsyncUpload)sender;
        var Parent = FileDownloadImage.NamingContainer;
        var DownloadID = ((HiddenField)Parent.FindControl("hdnDownloadID")).Value;
        var RadListView1 = (RadListView)Parent.FindControl("RadListView1");
        var RadListView2 = (RadListView)Parent.FindControl("RadListView2");

        string targetFolder = "~/res/download/album/";
        string newName = Guid.NewGuid().GetHashCode().ToString("X") + e.File.GetExtension();
        e.File.SaveAs(Server.MapPath(targetFolder + newName));

        //ResizeCropImage.ResizeByCondition(targetFolder + newName, 850, 800);
        //ResizeCropImage.CreateThumbNailByCondition("~/res/product/album/", "~/res/product/album/thumbs/", newName, 120, 120);

        //string bgColor = "#ffffff";
        //ResizeCropImage.CreateThumbNailWithBackGroundColor("~/res/download/album/", "~/res/product/album/thumbs/", newName, 120, 120, bgColor);
        //ResizeCropImage.ResizeWithBackGroundColor(targetFolder + newName, 498, 646, bgColor);

        if (string.IsNullOrEmpty(DownloadID))
        {
            TempImage.Rows.Add(new object[] { newName });

            RadListView2.DataSource = TempImage;
            RadListView2.DataBind();
        }
        else
        {
            var oDownloadImage = new DownloadImage();

            oDownloadImage.DownloadImageInsert(newName, "", "", "", "", "", DownloadID, "True", "");
            RadListView1.Rebind();
        }
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