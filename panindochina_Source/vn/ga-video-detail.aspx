<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ga-video-detail.aspx.cs"
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
    <asp:ListView ID="lstVideoDetails" runat="server" DataSourceID="odsVideoDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div id="videoDetails">
                <div id="jwplayer" data-video='<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "res/video/" + Eval("VideoPath") %>' data-img='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-img-1.jpg" %>'>
                </div>
                <div class="video-content">
                    <h4>
                        <%# Eval("Title") %></h4>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsVideoDetails" runat="server" 
        SelectMethod="VideoSelectOne" TypeName="TLLib.Video">
        <SelectParameters>
            <asp:QueryStringParameter Name="VideoID" QueryStringField="vi" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
