<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="salesmanlogin.aspx.cs" Inherits="salesmanlogin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
    <table style="width: 377px; position: static; height: 100px">
        <tr>
            <td align="center" colspan="3" valign="top">
                <strong>User Login</strong></td>
        </tr>
        <tr>
            <td align="center" colspan="3" valign="top">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#FF8080" Height="28px"
                        Style="position: static" Width="424px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 69px; height: 22px">
                    Username&nbsp; :</td>
            <td style="width: 100px; height: 22px">
                <asp:TextBox ID="TextBox1" runat="server" Style="position: static"></asp:TextBox>
            </td>
            <td style="width: 100px; height: 22px">
            </td>
        </tr>
        <tr>
            <td style="width: 69px">
                    Password&nbsp; :</td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox2" runat="server" Style="position: static" TextMode="Password"></asp:TextBox>
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 69px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="Button1" runat="server" Font-Bold="True" Style="position: static"
                        Text="SignIn" OnClick="Button1_Click" />
            </td>
            <td style="width: 100px">
            </td>
        </tr>
    </table>
</div>
</asp:Content>

