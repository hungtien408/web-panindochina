﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="panindochina-customercatalogue.aspx.cs" Inherits="ad_single_download" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Spaanjaars.Toolkit" Namespace="Spaanjaars.Toolkit" TagPrefix="isp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="../assets/styles/rating.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var tableView = null;
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }

        function RowMouseOver(sender, eventArgs) {
            var selectedRows = sender.get_masterTableView().get_selectedItems();
            var elem = $get(eventArgs.get_id());
            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();

                    if (selectedID != eventArgs.get_id())
                        elem.className += (" rgSelectedRow");
                }
        else
            elem.className += (" rgSelectedRow");
    }

    function RowMouseOut(sender, eventArgs) {
        var className = "rgSelectedRow";
        var elem = $get(eventArgs.get_id());

        var selectedRows = sender.get_masterTableView().get_selectedItems();

        if (selectedRows.length > 0)
            for (var i = 0; i < selectedRows.length; i++) {
                var selectedID = selectedRows[i].get_id();
                if (selectedID != eventArgs.get_id())
                    removeCssClass(className, elem);
            }
    else
        removeCssClass(className, elem);
}

function removeCssClass(className, element) {
    element.className = element.className.replace(className, "").replace(/^\s+/, '').replace(/\s+$/, '');
}

function pageLoad(sender, args) {
    tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
}

function RadComboBox1_SelectedIndexChanged(sender, args) {
    tableView.set_pageSize(sender.get_value());
}

function changePage(argument) {
    tableView.page(argument);
}

function RadNumericTextBox1_ValueChanged(sender, args) {
    tableView.page(sender.get_value());
}

//On insert and update buttons click temporarily disables ajax to perform upload actions
function conditionalPostback(sender, eventArgs) {
    var theRegexp = new RegExp("\.lnkUpdate$|\.lnkUpdateTop$|\.PerformInsertButton$", "ig");
    if (eventArgs.get_eventTarget().match(theRegexp)) {
        var upload1 = $find(window['UploadId1']);
        var upload2 = $find(window['UploadId2']);

        //AJAX is disabled only if file is selected for upload
        if (upload1.getFileInputs()[0].value != "" || upload2.getFileInputs()[0].value != "") {
            eventArgs.set_enableAjax(false);
        }
    }
    else if (eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToWordButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToPdfButton") >= 0)
        eventArgs.set_enableAjax(false);
}

function validateRadUpload(source, e) {
    e.IsValid = false;

    var upload = $find(source.parentNode.getElementsByTagName('div')[0].id);
    var inputs = upload.getFileInputs();
    for (var i = 0; i < inputs.length; i++) {
        //check for empty string or invalid extension
        if (upload.isExtensionValid(inputs[i].value)) {
            e.IsValid = true;
            break;
        }
    }
}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        <img alt="" src="../assets/images/download.png" class="vam" />
        Hỗ Trợ Khách Hàng</h3>
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback">
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server">
            <h4 class="searchTitle">
                Tìm kiếm
            </h4>
            <table class="search">
                <tr>
                    <td class="left">
                        Tiêu đề
                    </td>
                    <td class="left">
                        <asp:RadTextBox ID="txtSearchDownloadName" runat="server" Width="300px">
                        </asp:RadTextBox>
                    </td>
                    <td class="left invisible">
                        Danh mục
                    </td>
                    <td class="left invisible">
                        <asp:RadComboBox Filter="Contains" ID="ddlSearchCategory" runat="server" DataTextField="DownloadCategoryName"
                            DataValueField="DownloadCategoryID" DataSourceID="ObjectDataSource2" OnDataBound="DropDownList_DataBound">
                        </asp:RadComboBox>
                    </td>
                </tr>
            </table>
            <div align="right" style="padding: 5px 0 5px 0; border-bottom: 1px solid #ccc; margin-bottom: 10px">
                <asp:RadButton ID="btnSearch" runat="server" Text="Tìm kiếm">
                    <Icon PrimaryIconUrl="~/ad/assets/images/find.png" />
                </asp:RadButton>
            </div>
        </asp:Panel>
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" AllowMultiRowSelection="True" runat="server" Culture="vi-VN"
            AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" GridLines="Horizontal"
            AutoGenerateColumns="False" AllowAutomaticDeletes="True" ShowStatusBar="True"
            OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound"
            CssClass="grid" AllowAutomaticUpdates="True" CellSpacing="0">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" UseClientSelectColumnOnly="True" />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="DownloadID">
                <PagerStyle AlwaysVisible="true" Mode="NextPrevNumericAndAdvanced" PageButtonCount="10"
                    FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Trang kế"
                    NextPageToolTip="Trang kế" PagerTextFormat="Đổi trang: {4} &nbsp;Trang <strong>{0}</strong> / <strong>{1}</strong>, Kết quả <strong>{2}</strong> - <strong>{3}</strong> trong <strong>{5}</strong>."
                    PageSizeLabelText="Kết quả mỗi trang:" PrevPagesToolTip="Trang trước" PrevPageToolTip="Trang trước" />
                <CommandItemTemplate>
                    <div class="command">
                        <div style="float: right">
                            <asp:Button ID="ExportToExcelButton" runat="server" CssClass="rgExpXLS" CommandName="ExportToExcel"
                                AlternateText="Excel" ToolTip="Xuất ra Excel" />
                            <asp:Button ID="ExportToPdfButton" runat="server" CssClass="rgExpPDF" CommandName="ExportToPdf"
                                AlternateText="PDF" ToolTip="Xuất ra PDF" />
                            <asp:Button ID="ExportToWordButton" runat="server" CssClass="rgExpDOC" CommandName="ExportToWord"
                                AlternateText="Word" ToolTip="Xuất ra Word" />
                        </div>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới</asp:LinkButton>|
                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/delete-icon.png" /> Hủy</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img width="12px" class="vam" alt="" src="../assets/images/tools.png" /> Sửa</asp:LinkButton>|
                        <%--<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Cập nhật</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Xóa tất cả dòng đã chọn?')"
                            runat="server" CommandName="DeleteSelected" CssClass="item"><img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="item"><img class="vam" alt="" src="../assets/images/reload.png" /> Làm mới</asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </CommandItemTemplate>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn" />
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataSetIndex + 1 %>
                            <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                            <asp:HiddenField ID="hdnFilePath" runat="server" Value='<%# Eval("FilePath") %>' />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn HeaderText="ID" DataField="DownloadID" SortExpression="DownloadID"
                        Visible="False">
                    </asp:GridBoundColumn>
                    <asp:GridTemplateColumn HeaderText="Tiêu đề" DataField="DownloadName" SortExpression="DownloadName">
                        <ItemTemplate>
                            <asp:Label ID="lblDownloadName" runat="server" Text='<%# Eval("DownloadName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Tên tập tin" DataField="FilePath" SortExpression="FilePath"
                        Visible="False">
                        <ItemTemplate>
                            <%# Eval("FilePath")%>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Danh mục" DataField="DownloadCategoryName" SortExpression="DownloadCategoryName">
                        <ItemTemplate>
                            <%# Eval("DownloadCategoryName")%>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Ngày tạo" DataField="CreateDate" SortExpression="CreateDate">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MM/yyyy HH:mm}", Eval("CreateDate"))%>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Thứ tự" DataField="Priority" SortExpression="Priority">
                        <ItemTemplate>
                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="70px" Text='<%# Bind("Priority") %>'
                                ShowSpinButtons="true" MinValue="0" EmptyMessage="Thứ tự..." Type="Number">
                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                            </asp:RadNumericTextBox>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Hiển thị" DataField="IsAvailable" SortExpression="IsAvailable">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="ImageName" HeaderText="Ảnh" SortExpression="ImageName">
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                Width="95">
                                <img alt="" src='<%# "~/res/download/thumbs/" + Eval("ImageName") %>' width="80"
                                    runat="server" visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' />
                                <asp:LinkButton ID="lnkDeleteImage" runat="server" rel='<%#  Eval("DownloadID") + "#" + Eval("ImageName") %>'
                                    CommandName="DeleteImage" OnClientClick="return confirm('Xóa ảnh này ?')">
                                <img alt="Xóa ảnh" title="Xóa ảnh" src="../assets/images/delete-icon.png" />
                                </asp:LinkButton>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <table width="100%">
                                <tr>
                                    <td valign="top" style="width: 500px" rowspan="2">
                                        <div class="sub_box">
                                            <h3 class="searchTitle">
                                                Thông Tin Catalogue / Brochure</h3>
                                            <asp:HiddenField ID="hdnDownloadID" runat="server" Value='<%# Eval("DownloadID") %>' />
                                            <asp:HiddenField ID="hdnOldImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                            <asp:HiddenField ID="hdnOldFilePath" runat="server" Value='<%# Eval("FilePath") %>' />
                                            <div class="edit">
                                                <hr />
                                                <asp:RadButton ID="lnkUpdateTop" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                                    Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                                    <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                                </asp:RadButton>
                                                &nbsp;&nbsp;
                                                <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                                </asp:RadButton>
                                            </div>
                                            <table class="search">
                                                <tr>
                                                    <td class="left" valign="top">
                                                        Ảnh đại diện
                                                    </td>
                                                    <td>
                                                        <asp:RadUpload ID="FileImageName" runat="server" ControlObjectsVisibility="None"
                                                            Culture="vi-VN" Language="vi-VN" InputSize="69" AllowedFileExtensions=".jpg,.jpeg,.gif,.png" />
                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                                            ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                                                        <span class="required">(Kích thước 270px x 360px)</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left" valign="top">
                                                        File download
                                                    </td>
                                                    <td>
                                                        <asp:RadUpload ID="FileFilePath" runat="server" ControlObjectsVisibility="None" Culture="vi-VN"
                                                            Language="vi-VN" InputSize="69" />
                                                    </td>
                                                </tr>
                                                <tr class="invisible">
                                                    <td class="left">
                                                        Danh mục
                                                    </td>
                                                    <td>
                                                        <asp:RadComboBox Filter="Contains" ID="ddlCategory" runat="server" DataSourceID="ObjectDataSource2"
                                                            DataTextField="DownloadCategoryName" DataValueField="DownloadCategoryID" Width="504px"
                                                            OnDataBound="DropDownList_DataBound" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged">
                                                        </asp:RadComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <h3>
                                                            (Ngôn Ngữ Tiếng Việt)</h3>
                                                        <hr />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        Tiêu đề
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDownloadName" runat="server" Text='<%# Bind("DownloadName") %>'
                                                            Width="500px"></asp:TextBox>
                                                        <%--<asp:RadTextBox runat="server" Width="500px" ID="RadTextBox1" Text='<%# Bind("DownloadName") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDownloadName"
                                            Display="Dynamic" ErrorMessage="Nhập tên sản phẩm" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr id="question" class="invisible">
                                                    <td class="left" valign="top">
                                                        Question
                                                    </td>
                                                    <td>
                                                        <asp:RadEditor ID="txtQuestion" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP"
                                                            runat="server" Language="vi-VN" Skin="Office2007" Width="98%" Content='<%# Bind("Question") %>'>
                                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/"
                                                                MaxUploadFileSize="1024000" />
                                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/"
                                                                MaxUploadFileSize="1024000" />
                                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                ViewPaths="~/Uploads/Template/" />
                                                        </asp:RadEditor>
                                                    </td>
                                                </tr>
                                                <tr id="answer" class="invisible">
                                                    <td class="left" valign="top">
                                                        Answer
                                                    </td>
                                                    <td>
                                                        <asp:RadEditor ID="txtAnswer" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP"
                                                            runat="server" Language="vi-VN" Skin="Office2007" Width="98%" Content='<%# Bind("Answer") %>'>
                                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/"
                                                                MaxUploadFileSize="1024000" />
                                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/"
                                                                MaxUploadFileSize="1024000" />
                                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                ViewPaths="~/Uploads/Template/" />
                                                        </asp:RadEditor>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <h3>
                                                            (Ngôn Ngữ Tiếng Anh)</h3>
                                                        <hr />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        Tiêu đề(En)
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDownloadNameEn" runat="server" Text='<%# Bind("DownloadNameEn") %>'
                                                            Width="500px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr id="questionEn" class="invisible">
                                                    <td class="left" valign="top">
                                                        Question(En)
                                                    </td>
                                                    <td>
                                                        <asp:RadEditor ID="txtQuestionEn" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP"
                                                            runat="server" Language="vi-VN" Skin="Office2007" Width="98%" Content='<%# Bind("QuestionEn") %>'>
                                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/"
                                                                MaxUploadFileSize="1024000" />
                                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/"
                                                                MaxUploadFileSize="1024000" />
                                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                ViewPaths="~/Uploads/Template/" />
                                                        </asp:RadEditor>
                                                    </td>
                                                </tr>
                                                <tr id="answerEn" class="invisible">
                                                    <td class="left" valign="top">
                                                        Answer(En)
                                                    </td>
                                                    <td>
                                                        <asp:RadEditor ID="txtAnswerEn" ContentFilters="ConvertCharactersToEntities,ConvertToXhtml,OptimizeSpans,IndentHTMLContent,ConvertFontToSpan,IECleanAnchors,FixUlBoldItalic,RemoveScripts,FixEnclosingP"
                                                            runat="server" Language="vi-VN" Skin="Office2007" Width="98%" Content='<%# Bind("AnswerEn") %>'>
                                                            <ImageManager DeletePaths="~/Uploads/Image/" UploadPaths="~/Uploads/Image/" ViewPaths="~/Uploads/Image/"
                                                                MaxUploadFileSize="1024000" />
                                                            <FlashManager DeletePaths="~/Uploads/Video/" UploadPaths="~/Uploads/Video/" ViewPaths="~/Uploads/Video/" />
                                                            <DocumentManager DeletePaths="~/Uploads/File/" UploadPaths="~/Uploads/File/" ViewPaths="~/Uploads/File/"
                                                                MaxUploadFileSize="1024000" />
                                                            <MediaManager DeletePaths="~/Uploads/Media/" UploadPaths="~/Uploads/Media/" ViewPaths="~/Uploads/Media/" />
                                                            <TemplateManager DeletePaths="~/Uploads/Template/" UploadPaths="~/Uploads/Template/"
                                                                ViewPaths="~/Uploads/Template/" />
                                                        </asp:RadEditor>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left">
                                                        Thứ tự
                                                    </td>
                                                    <td>
                                                        <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                                            EmptyMessage="Thứ tự..." Type="Number">
                                                            <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                                        </asp:RadNumericTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="left" colspan="2">
                                                        <asp:CheckBox ID="chkIsAvailable" runat="server" CssClass="checkbox" Text=" Hiển thị"
                                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (string.IsNullOrEmpty(Eval("IsAvailable").ToString()) ? false : Eval("IsAvailable")) %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="edit">
                                                <hr />
                                                <asp:RadButton ID="lnkUpdate" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                                    Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                                    <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                                </asp:RadButton>
                                                &nbsp;&nbsp;
                                                <asp:RadButton ID="RadButton1" runat="server" CommandName='Cancel' Text='Hủy'>
                                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                                </asp:RadButton>
                                            </div>
                                        </div>
                                    </td>
                                    <td valign="top" style="width: 400px; height: 200px;">
                                        <div class="sub_box">
                                            <div class="head">
                                                Ảnh catalogue</div>
                                            <div class="cont">
                                                <asp:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                    <asp:RadAsyncUpload ID="FileDownloadImage" runat="server" MultipleFileSelection="Automatic"
                                                        TargetFolder="~/res/download/album/" TemporaryFolder="~/res/TempAsync" Width="100%"
                                                        AllowedFileExtensions="jpg,jpeg,gif,png" Localization-Select="Chọn" Localization-Cancel="Hủy"
                                                        Localization-Remove="Xóa" OnFileUploaded="FileDownloadImage_FileUploaded">
                                                    </asp:RadAsyncUpload>
                                                    <span class="required">(Kích thước 498px x 646px)</span>
                                                    <asp:RadButton ID="btnUpload" runat="server" Text="Tải lên" ShowPostBackMask="False">
                                                        <Icon PrimaryIconUrl="~/ad/assets/images/up.png" />
                                                    </asp:RadButton>
                                                    <asp:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                        <asp:RadListView runat="server" ID="RadListView1" DataSourceID="OdsDownloadImage"
                                                            DataKeyNames="DownloadImageID" OverrideDataSourceControlSorting="True" OnItemCommand="RadListView1_ItemCommand"
                                                            PageSize="100" Width="100%" Visible='<%# (Container is GridEditFormInsertItem) ? false : true %>'
                                                            ShowPostBackMask="false">
                                                            <LayoutTemplate>
                                                                <div runat="server" id="itemPlaceholder" />
                                                                <div class="clear">
                                                                </div>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                                                <fieldset style="float: left; margin: 5px; padding: 2px 2px 2px 2px; position: relative;
                                                                    background: #eeeeee;" class="myClass">
                                                                    <a id="A1" href='<%# "~/res/download/album/" + Eval("ImageName") %>' runat="server"
                                                                        class="lightbox">
                                                                        <img id="Img1" alt="" src='<%# "~/res/Download/album/" + Eval("ImageName") %>' runat="server"
                                                                            width="100" height="100" />
                                                                    </a>
                                                                    <div align="right">
                                                                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="Edit" CssClass="item"><img width="14px" class="vam" alt="" title="Sửa" src="../assets/images/tools.png" /></asp:LinkButton>
                                                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa ảnh?')" runat="server"
                                                                            CommandName="Delete" CssClass="item"><img width="14px" class="vam" alt="" title="Xóa ảnh" src="../assets/images/trash.png" /></asp:LinkButton>
                                                                    </div>
                                                                </fieldset>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:HiddenField ID="hdnDownloadImageID" runat="server" Value='<%# Eval("DownloadImageID") %>' />
                                                                <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                                                <asp:Panel ID="Panel2" runat="server" DefaultButton="lnkUpdate">
                                                                    <h3 class="searchTitle clear">
                                                                        Cập Nhật Ảnh</h3>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td valign="top" style="padding-right: 10px">
                                                                                <table class="search" width="100%">
                                                                                    <tr class="invisible">
                                                                                        <td class="left" style="width: 70px">
                                                                                            Tiêu đề ảnh
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:RadTextBox ID="txtTitle" Width="100%" runat="server" Text='<%# Bind("Title") %>'
                                                                                                EmptyMessage="Tiêu đề ảnh...">
                                                                                            </asp:RadTextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr class="invisible">
                                                                                        <td class="left" valign="top">
                                                                                            Mô tả
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:RadTextBox ID="txtDescription" runat="server" Width="100%" Text='<%# Bind("Descripttion")%>'
                                                                                                EmptyMessage="Mô tả...">
                                                                                            </asp:RadTextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="left">
                                                                                            Thứ tự
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="100%" Text='<%# Bind("Priority") %>'
                                                                                                EmptyMessage="Thứ tự..." Type="Number">
                                                                                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                                                                            </asp:RadNumericTextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="left" colspan="2">
                                                                                            <asp:CheckBox ID="chkAddIsAvailable" runat="server" Checked='<%# (Container is RadListViewInsertItem) ? true : Eval("IsAvailable")%>'
                                                                                                Text="Hiển thị" CssClass="checkbox" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td valign="top">
                                                                                <img id="Img2" alt="" src='<%# "~/res/download/album/thumbs/" + Eval("ImageName") %>'
                                                                                    runat="server" width="100" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <div class="edit">
                                                                        <hr />
                                                                        <asp:RadButton ID="lnkUpdate" runat="server" CommandName='Update' Text='Cập nhật'>
                                                                            <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                                                        </asp:RadButton>
                                                                        &nbsp;&nbsp;
                                                                        <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                                                            <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                                                        </asp:RadButton>
                                                                    </div>
                                                                    <div class="clear">
                                                                    </div>
                                                                </asp:Panel>
                                                            </EditItemTemplate>
                                                        </asp:RadListView>
                                                        <asp:ObjectDataSource ID="OdsDownloadImage" runat="server" DeleteMethod="DownloadImageDelete"
                                                            SelectMethod="DownloadImageSelectAll" TypeName="TLLib.DownloadImage" UpdateMethod="DownloadImageUpdate">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="DownloadImageID" Type="String" />
                                                            </DeleteParameters>
                                                            <SelectParameters>
                                                                <asp:ControlParameter Name="DownloadID" ControlID="hdnDownloadID" PropertyName="Value"
                                                                    Type="String" />
                                                                <asp:Parameter Name="IsAvailable" Type="String" />
                                                                <asp:Parameter Name="Priority" Type="String" />
                                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                            </SelectParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="DownloadImageID" Type="String" />
                                                                <asp:Parameter Name="ImageName" Type="String" />
                                                                <asp:Parameter Name="ConvertedDownloadName" Type="String" />
                                                                <asp:Parameter Name="Title" Type="String" />
                                                                <asp:Parameter Name="Descripttion" Type="String" />
                                                                <asp:Parameter Name="TitleEn" Type="String" />
                                                                <asp:Parameter Name="DescripttionEn" Type="String" />
                                                                <asp:ControlParameter Name="DownloadID" ControlID="hdnDownloadID" PropertyName="Value"
                                                                    Type="String" />
                                                                <asp:Parameter Name="IsAvailable" Type="String" />
                                                                <asp:Parameter Name="Priority" Type="String" />
                                                            </UpdateParameters>
                                                        </asp:ObjectDataSource>
                                                        <asp:RadListView runat="server" ID="RadListView2" PageSize="100" Width="100%" Visible='<%# (Container is GridEditFormInsertItem) ? true : false %>'
                                                            OnItemCommand="RadListView2_ItemCommand">
                                                            <LayoutTemplate>
                                                                <div runat="server" id="itemPlaceholder" />
                                                                <div class="clear">
                                                                </div>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                                                                <fieldset style="float: left; margin: 5px; padding: 2px 2px 2px 2px; position: relative;
                                                                    background: #eeeeee;" class="myClass">
                                                                    <a id="A2" href='<%# "~/res/download/album/" + Eval("ImageName") %>' runat="server"
                                                                        class="lightbox">
                                                                        <img id="Img1" alt="" src='<%# "~/res/download/album/" + Eval("ImageName") %>' runat="server"
                                                                            width="100" height="100" />
                                                                    </a>
                                                                    <div align="right">
                                                                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="Edit" CssClass="item"><img width="14px" class="vam" alt="" title="Sửa" src="../assets/images/tools.png" /></asp:LinkButton>
                                                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa ảnh?')" runat="server"
                                                                            CommandName="Delete" CssClass="item"><img width="14px" class="vam" alt="" title="Xóa ảnh" src="../assets/images/trash.png" /></asp:LinkButton>
                                                                    </div>
                                                                </fieldset>
                                                            </ItemTemplate>
                                                        </asp:RadListView>
                                                    </asp:RadAjaxPanel>
                                                </asp:RadAjaxPanel>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:RadInputManager ID="RadInputManager2" runat="server">
                            <asp:NumericTextBoxSetting AllowRounding="False" Culture="vi-VN" EmptyMessage="Thứ tự ..."
                                Type="Number" DecimalDigits="0">
                                <TargetControls>
                                    <asp:TargetInput ControlID="txtPriority" />
                                </TargetControls>
                            </asp:NumericTextBoxSetting>
                        </asp:RadInputManager>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
        <asp:RadInputManager ID="RadInputManager1" runat="server">
            <asp:NumericTextBoxSetting AllowRounding="False" Culture="vi-VN" EmptyMessage="Thứ tự ..."
                Type="Number" DecimalDigits="0">
                <TargetControls>
                    <asp:TargetInput ControlID="txtPriority" />
                </TargetControls>
            </asp:NumericTextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Tiêu đề ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtDownloadName" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Tiêu đề(En) ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtDownloadNameEn" />
                </TargetControls>
            </asp:TextBoxSetting>
        </asp:RadInputManager>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DownloadDelete"
        SelectMethod="DownloadSelectAll" TypeName="TLLib.Download" InsertMethod="DownloadInsert"
        UpdateMethod="DownloadUpdate">
        <DeleteParameters>
            <asp:Parameter Name="DownloadID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DownloadName" Type="String" />
            <asp:Parameter Name="DownloadNameEn" Type="String" />
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="QuestionEn" Type="String" />
            <asp:Parameter Name="AnswerEn" Type="String" />
            <asp:Parameter Name="ConvertedDownloadName" Type="String" />
            <asp:Parameter Name="ImageName" Type="String" />
            <asp:Parameter Name="FilePath" Type="String" />
            <asp:Parameter Name="DownloadCategoryID" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:ControlParameter ControlID="txtSearchDownloadName" Name="DownloadName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlSearchCategory" Name="DownloadCategoryID" PropertyName="SelectedValue"
                Type="String" DefaultValue="3" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter Name="SortByPriority" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DownloadID" Type="String" />
            <asp:Parameter Name="DownloadName" Type="String" />
            <asp:Parameter Name="DownloadNameEn" Type="String" />
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="QuestionEn" Type="String" />
            <asp:Parameter Name="AnswerEn" Type="String" />
            <asp:Parameter Name="ConvertedDownloadName" Type="String" />
            <asp:Parameter Name="ImageName" Type="String" />
            <asp:Parameter Name="FilePath" Type="String" />
            <asp:Parameter Name="DownloadCategoryID" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="DownloadCategorySelectAll"
        TypeName="TLLib.DownloadCategory">
        <SelectParameters>
            <asp:Parameter Name="parentID" Type="Int32" DefaultValue="3" />
            <asp:Parameter Name="increaseLevelCount" Type="Int32" DefaultValue="2" />
            <asp:Parameter Name="IsShowOnMenu" Type="String" />
            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter Name="SortByPriority" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important;
        left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>
