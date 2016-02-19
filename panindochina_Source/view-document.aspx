<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-document.aspx.cs" Inherits="view_document" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:FormView ID="FormView2" runat="server" DataSourceID="ObjectDataSource1" EnableModelValidation="True"
                Width="100%">
                <ItemTemplate>
                    <iframe src='http://docs.google.com/viewer?url=<%# Request.Url.Scheme +"://"+ Request.Url.Host + "/res/download/vi/"+ Eval("FilePath") %>&embedded=true'
                        width="100%" height="1300" style="border: none;"></iframe>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="DownloadSelectOne"
                TypeName="TLLib.Download">
                <SelectParameters>
                    <asp:QueryStringParameter Name="DownloadID" QueryStringField="id" Type="String" DefaultValue="-1" />
                </SelectParameters>
            </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
