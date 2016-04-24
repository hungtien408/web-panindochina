<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product-video-detail.aspx.cs"
    Inherits="ga_video_detail" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
</head>
<body>
    <form id="form1" runat="server">
    <%--<div id="videoDetails">
        <div id="jwplayer" data-video="https://youtu.be/QcIy9NiNbmo" data-img="assets/images/video-img-1.jpg""></div>
        <div class="video-content">
            <h4><%# Eval("Title") %></h4>
        </div>
    </div>--%>
    <asp:ListView ID="lstProductVideoDetails" runat="server" DataSourceID="odsProductVideoDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div id="videoDetails">
                <div id="jwplayer" data-video='<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "../res/video/" + Eval("VideoPath") %>' data-img='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-img-1.jpg" %>'>
                </div>
                <div class="video-content">
                    <h4>
                        <%# Eval("TitleEn")%></h4>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsProductVideoDetails" runat="server" 
        SelectMethod="ProductVideoSelectOne" TypeName="TLLib.ProductVideo">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductVideoID" QueryStringField="pvi" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
