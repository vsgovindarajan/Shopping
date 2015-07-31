<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" Title="Customer login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table style="width: 1107px; position: static; height: 100px; margin-right: 141px;">
            <tr>
                <td align="center" colspan="3" valign="top">
                    <strong>User Login</strong></td>
            </tr>
            <tr>
                <td align="center" colspan="3" valign="top">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#FF8080" Height="28px"
                        Style="position: static" Width="424px"></asp:Label></td>
            </tr>
            <tr>
                <td style="height: 22px" align="center" colspan="3">
                    Username&nbsp; :<asp:TextBox ID="TextBox1" runat="server" Style="position: static"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    Password&nbsp; :<asp:TextBox ID="TextBox2" runat="server" Style="position: static" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="Button1" runat="server" Font-Bold="True" Style="position: static"
                        Text="SignIn" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td style="width: 69px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 69px">
                    New User ?</td>
                <td style="width: 100px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Style="position: static" Width="152px" PostBackUrl="~/CustomerRegistration.aspx">SignUp Click here....</asp:LinkButton></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 800px; background-image: url('ads/background.JPG'); height: 1000px;" 
                    colspan="3">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

