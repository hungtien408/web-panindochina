﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/inside.master" AutoEventWireup="true"
    CodeFile="productdownload-2.aspx.cs" Inherits="ad_single_productdownload" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
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
        var upload = $find(window['UploadId']);

        //AJAX is disabled only if file is selected for upload
        if (upload.getFileInputs()[0].value != "") {
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
    <fieldset>
        <h3 class="searchTitle">
            Thông Tin Sản Phẩm</h3>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource2" EnableModelValidation="True"
            Width="100%">
            <ItemTemplate>
                <div class="mInfo" style="min-width: 800px">
                    <table class="search" style="border: 0">
                        <tr>
                            <td class="left">
                                Tên sản phẩm:
                            </td>
                            <td>
                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName")%>'></asp:Label>
                            </td>
                            <td class="left">
                                Danh mục:
                            </td>
                            <td>
                                <%# Eval("ProductCategoryName")%>
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="PI" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </fieldset>
    <br />
    <%--<asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback">--%>
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" AllowMultiRowSelection="True" runat="server" Culture="vi-VN"
            AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" GridLines="Horizontal"
            AutoGenerateColumns="False" AllowAutomaticDeletes="True" 
            ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand" CssClass="grid" AllowAutomaticInserts="True"
            AllowAutomaticUpdates="True" OnItemDataBound="RadGrid1_ItemDataBound" 
            CellSpacing="0">
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
                DataKeyNames="ProductDownloadCategoryID">
                <%--<CommandItemSettings ShowExportToExcelButton="True" ShowExportToPdfButton="True"
                    ShowExportToWordButton="True"></CommandItemSettings>--%>
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
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn HeaderText="ID" DataField="ProductDownloadID" SortExpression="ProductDownloadID">
                    </asp:GridBoundColumn>
                    <asp:GridBoundColumn HeaderText="Tiêu đề" SortExpression="FileName" DataField="FileName" />
                    <asp:GridBoundColumn HeaderText="Tiêu đề(Tiếng Anh)" SortExpression="FileNameEn"
                        DataField="FileNameEn" />
                    <asp:GridBoundColumn HeaderText="Tên tập tin" SortExpression="LinkDownload" DataField="LinkDownload" />
                    <asp:GridTemplateColumn DataField="Priority" HeaderStyle-Width="1%" HeaderText="Thứ tự"
                        SortExpression="Priority">
                        <ItemTemplate>
                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="70px" Text='<%# Bind("Priority") %>'
                                ShowSpinButtons="true" MinValue="0" EmptyMessage="Thứ tự..." Type="Number">
                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                            </asp:RadNumericTextBox>
                            <asp:RadInputManager ID="RadInputManager1" runat="server">
                                <asp:NumericTextBoxSetting AllowRounding="False" Culture="vi-VN" EmptyMessage="Thứ tự ..."
                                    Type="Number" DecimalDigits="0">
                                    <TargetControls>
                                        <asp:TargetInput ControlID="txtPriority" />
                                    </TargetControls>
                                </asp:NumericTextBoxSetting>
                            </asp:RadInputManager>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="IsAvailable" HeaderText="Hiển thị" SortExpression="IsAvailable">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# string.IsNullOrEmpty(Eval("IsAvailable").ToString()) ? false : Eval("IsAvailable") %>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <%--<h3 class="searchTitle">
                                Thông Tin Download</h3>
                            <table class="search">
                                <tr>
                                    <td class="left" valign="top">
                                        Chọn File
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hdnProductDownloadID" runat="server" Value='<%# Eval("ProductDownloadID") %>' />
                                        <asp:HiddenField ID="hdnLinkDownload" runat="server" Value='<%# Eval("LinkDownload") %>' />
                                        <asp:RadUpload ID="FileLinkDownload" runat="server" ControlObjectsVisibility="None"
                                            Culture="vi-VN" Language="vi-VN" InputSize="69" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Tiêu đề
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFileName" runat="server" Width="500px" Text='<%# Bind("FileName") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">
                                        Tiêu đề(En)
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFileNameEn" runat="server" Width="500px" Text='<%# Bind("FileNameEn") %>'></asp:TextBox>
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
                            </table>--%>
                            <table width="100%">
                                <tr>
                                    <td valign="top" style="width: 500px">
                                        <div class="sub_box">
                                            <div class="head">
                                                Thông Tin Download
                                            </div>
                                            <div class="cont">
                                                <table class="search">
                                                    <tr>
                                                        <td class="left" valign="top">
                                                            Tên Loại Download
                                                        </td>
                                                        <td>
                                                            <asp:HiddenField ID="hdnProductDownloadCategoryID" runat="server" Value='<%# Eval("ProductDownloadCategoryID") %>' />
                                                            <asp:RadTextBox ID="txtProductDownloadCategoryName" runat="server" Text='<%# Bind("ProductDownloadCategoryName") %>'
                                                                Width="500px" EmptyMessage="Tên Loại Download...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" valign="top">
                                                            Tên Loại Download(En)
                                                        </td>
                                                        <td>
                                                            <asp:RadTextBox ID="txtProductDownloadCategoryNameEn" runat="server" Text='<%# Bind("ProductDownloadCategoryNameEn") %>'
                                                                Width="500px" EmptyMessage="Tên Loại Download(En)...">
                                                            </asp:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left">
                                                            Thứ tự
                                                        </td>
                                                        <td>
                                                            <asp:RadNumericTextBox ID="RadNumericTextBox1" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                                                EmptyMessage="Thứ tự..." Type="Number">
                                                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                                            </asp:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="left" colspan="2">
                                                            <asp:CheckBox ID="chkIsShowOnMenu" runat="server" CssClass="checkbox" Text=" Xem trên menu"
                                                                Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsShowOnMenu") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnMenu"))) %>' />
                                                            &nbsp;&nbsp;
                                                            <asp:CheckBox ID="chkIsShowOnHomePage" runat="server" CssClass="checkbox" Text=" Xem trên trang chủ"
                                                                Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsShowOnHomePage") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsShowOnHomePage"))) %>' />
                                                            &nbsp;&nbsp;
                                                            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="checkbox" Text=" Hiển thị"
                                                                Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))) %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                    <td valign="top">
                                        <div class="sub_box">
                                            <div class="head">
                                                File</div>
                                            <div class="cont">
                                                <asp:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                    <asp:RadAsyncUpload ID="FileDownload" runat="server" MultipleFileSelection="Automatic"
                                                        TargetFolder="~/res/product/download/" TemporaryFolder="~/res/TempAsync" Width="100%"
                                                        Localization-Select="Chọn" Localization-Cancel="Hủy" Localization-Remove="Xóa"
                                                        InputSize="69" OnFileUploaded="FileDownload_FileUploaded">
                                                    </asp:RadAsyncUpload>
                                                    <asp:RadButton ID="btnUpload" runat="server" Text="Tải lên" ShowPostBackMask="False">
                                                        <Icon PrimaryIconUrl="~/ad/assets/images/up.png" />
                                                    </asp:RadButton>
                                                    <asp:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                        <asp:RadListView runat="server" ID="RadListView1" DataSourceID="OdsProductDownload"
                                                            DataKeyNames="ProductDownloadID" OverrideDataSourceControlSorting="True" OnItemCommand="RadListView1_ItemCommand"
                                                            PageSize="100" Width="100%" Visible='<%# (Container is GridEditFormInsertItem) ? false : true %>'
                                                            ShowPostBackMask="false">
                                                            <LayoutTemplate>
                                                                <div runat="server" id="itemPlaceholder" />
                                                                <div class="clear">
                                                                </div>
                                                            </LayoutTemplate>
                                                            <ItemTemplate>
                                                                <asp:HiddenField ID="hdnLinkDownload" runat="server" Value='<%# Eval("LinkDownload") %>' />
                                                                <fieldset style="float: left; margin: 5px; padding: 2px 2px 2px 2px; position: relative;
                                                                    background: #eeeeee;" class="myClass">
                                                                    <%--<a id="A1" href='<%# "~/res/photoalbum/" + Eval("ImageName") %>' runat="server" class="lightbox">
                                                                        <img id="Img1" alt="" src='<%# "~/res/photoalbum/thumbs/" + Eval("ImageName") %>' runat="server"
                                                                            width="100" height="100" />
                                                                    </a>--%>
                                                                    <div align="right">
                                                                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="Edit" CssClass="item"><img width="14px" class="vam" alt="" title="Sửa" src="../assets/images/tools.png" /></asp:LinkButton>
                                                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa ảnh?')" runat="server"
                                                                            CommandName="Delete" CssClass="item"><img width="14px" class="vam" alt="" title="Xóa ảnh" src="../assets/images/trash.png" /></asp:LinkButton>
                                                                    </div>
                                                                </fieldset>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:HiddenField ID="hdnProductDownloadID" runat="server" Value='<%# Eval("ProductDownloadID") %>' />
                                                                <asp:HiddenField ID="hdnLinkDownload" runat="server" Value='<%# Eval("LinkDownload") %>' />
                                                                <asp:Panel ID="Panel2" runat="server" DefaultButton="lnkUpdate">
                                                                    <h3 class="searchTitle clear">
                                                                        Cập Nhật File</h3>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td valign="top" style="padding-right: 10px">
                                                                                <table class="search" width="100%">
                                                                                    <tr>
                                                                                        <td class="left" style="width: 70px">
                                                                                            Tiêu đề file
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtFileName" runat="server" Width="500px" Text='<%# Bind("FileName") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="left" style="width: 70px">
                                                                                            Tiêu đề file(En)
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtFileNameEn" runat="server" Width="500px" Text='<%# Bind("FileNameEn") %>'></asp:TextBox>
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
                                                                            <%--<td valign="top">
                                                                                <img id="Img2" alt="" src='<%# "~/res/photoalbum/thumbs/" + Eval("ImageName") %>' runat="server"
                                                                                    width="100" />
                                                                            </td>--%>
                                                                        </tr>
                                                                    </table>
                                                                    <hr />
                                                                    <asp:RadButton ID="lnkUpdate" runat="server" CommandName='Update' Text='Cập nhật'>
                                                                        <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                                                    </asp:RadButton>
                                                                    &nbsp;&nbsp;
                                                                    <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                                                        <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                                                    </asp:RadButton>
                                                                    <div class="clear">
                                                                    </div>
                                                                </asp:Panel>
                                                            </EditItemTemplate>
                                                        </asp:RadListView>
                                                        <asp:ObjectDataSource ID="OdsProductDownload" runat="server" SelectMethod="ProductDownloadSelectAll"
                                                            TypeName="TLLib.ProductDownload" DeleteMethod="ProductDownloadDelete" InsertMethod="ProductDownloadInsert"
                                                            UpdateMethod="ProductDownloadUpdate">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="ProductDownloadID" Type="String" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:QueryStringParameter Name="ProductID" QueryStringField="PI" Type="String" />
                                                                <asp:Parameter Name="FileName" Type="String" />
                                                                <asp:Parameter Name="FileNameEn" Type="String" />
                                                                <asp:Parameter Name="LinkDownload" Type="String" />
                                                                <asp:Parameter Name="IsAvailable" Type="String" />
                                                                <asp:Parameter Name="Priority" Type="String" />
                                                                <asp:ControlParameter ControlID="hdnProductDownloadCategoryID" DefaultValue="-1" Name="ProductDownloadCategoryID"
                                                                    PropertyName="Value" Type="String" />
                                                            </InsertParameters>
                                                            <SelectParameters>
                                                                <asp:QueryStringParameter Name="ProductID" QueryStringField="PI" Type="String" />
                                                                <asp:Parameter Name="IsAvailable" Type="String" />
                                                                <asp:Parameter Name="Priority" Type="String" />
                                                                <asp:Parameter Name="SortByPriority" Type="String" />
                                                            </SelectParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="ProductDownloadID" Type="String" />
                                                                <asp:QueryStringParameter Name="ProductID" QueryStringField="PI" Type="String" />
                                                                <asp:Parameter Name="FileName" Type="String" />
                                                                <asp:Parameter Name="FileNameEn" Type="String" />
                                                                <asp:Parameter Name="LinkDownload" Type="String" />
                                                                <asp:Parameter Name="IsAvailable" Type="String" />
                                                                <asp:Parameter Name="Priority" Type="String" />
                                                                <asp:ControlParameter ControlID="hdnProductDownloadCategoryID" DefaultValue="-1" Name="ProductDownloadCategoryID"
                                                                    PropertyName="Value" Type="String" />
                                                            </UpdateParameters>
                                                        </asp:ObjectDataSource>
                                                        <%--<asp:RadListView runat="server" ID="RadListView2" PageSize="100" Width="100%" Visible='<%# (Container is GridEditFormInsertItem) ? true : false %>'
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
                                                                    <a id="A2" href='<%# "~/res/photoalbum/" + Eval("ImageName") %>' runat="server" class="lightbox">
                                                                        <img id="Img3" alt="" src='<%# "~/res/photoalbum/thumbs/" + Eval("ImageName") %>'
                                                                            runat="server" width="100" height="100" />
                                                                    </a>
                                                                    <div align="right">
                                                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa ảnh?')" runat="server"
                                                                            CommandName="Delete" CssClass="item"><img width="14px" class="vam" alt="" title="Xóa ảnh" src="../assets/images/trash.png" /></asp:LinkButton>
                                                                    </div>
                                                                </fieldset>
                                                            </ItemTemplate>
                                                        </asp:RadListView>--%>
                                                    </asp:RadAjaxPanel>
                                                </asp:RadAjaxPanel>
                                            </div>
                                        </div>
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
                                <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                </asp:RadButton>
                            </div>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ProductCategorySelectAll"
                                TypeName="TLLib.ProductCategory"></asp:ObjectDataSource>
                        </asp:Panel>
                        <asp:RadInputManager ID="RadInputManager1" runat="server">
                            <asp:NumericTextBoxSetting AllowRounding="False" Culture="vi-VN" EmptyMessage="Thứ tự ..."
                                Type="Number" DecimalDigits="0">
                                <TargetControls>
                                    <asp:TargetInput ControlID="txtPriority" />
                                </TargetControls>
                            </asp:NumericTextBoxSetting>
                            <asp:TextBoxSetting EmptyMessage="Tiêu đề ...">
                                <TargetControls>
                                    <asp:TargetInput ControlID="txtFileName" />
                                </TargetControls>
                            </asp:TextBoxSetting>
                            <asp:TextBoxSetting EmptyMessage="Tiêu đề(En) ...">
                                <TargetControls>
                                    <asp:TargetInput ControlID="txtFileNameEn" />
                                </TargetControls>
                            </asp:TextBoxSetting>
                        </asp:RadInputManager>
                    </FormTemplate>
                    <PopUpSettings Height="700px" Width="800px" />
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
        <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ProductDownloadSelectAll"
            TypeName="TLLib.ProductDownload" DeleteMethod="ProductDownloadDelete" InsertMethod="ProductDownloadInsert"
            UpdateMethod="ProductDownloadUpdate">
            <DeleteParameters>
                <asp:Parameter Name="ProductDownloadID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="PI" Type="String" />
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileNameEn" Type="String" />
                <asp:Parameter Name="LinkDownload" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="PI" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter Name="SortByPriority" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductDownloadID" Type="String" />
                <asp:QueryStringParameter Name="ProductID" QueryStringField="PI" Type="String" />
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileNameEn" Type="String" />
                <asp:Parameter Name="LinkDownload" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>--%>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ProductDownloadCategorySelectAll"
            TypeName="TLLib.ProductDownloadCategory" 
            DeleteMethod="ProductDownloadCategoryDelete" InsertMethod="ProductDownloadCategoryInsert"
            UpdateMethod="ProductDownloadCategoryUpdate">
            <DeleteParameters>
                <asp:Parameter Name="ProductDownloadCategoryID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductDownloadCategoryName" Type="String" />
                <asp:Parameter Name="ProductDownloadCategoryNameEn" Type="String" />
                <asp:Parameter Name="IsShowOnMenu" Type="String" />
                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="ProductDownloadCategoryName" Type="String" />
                <asp:Parameter Name="IsShowOnMenu" Type="String" />
                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                <asp:Parameter DefaultValue="" Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter Name="SortByPriority" Type="String" DefaultValue="" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductDownloadCategoryID" Type="String" />
                <asp:Parameter Name="ProductDownloadCategoryName" Type="String" />
                <asp:Parameter Name="ProductDownloadCategoryNameEn" Type="String" />
                <asp:Parameter Name="IsShowOnMenu" Type="String" />
                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    <%--</asp:RadAjaxPanel>--%>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important;
        left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>