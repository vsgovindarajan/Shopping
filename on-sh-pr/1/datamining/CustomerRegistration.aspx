<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerRegistration.aspx.cs" Inherits="CustomerRegistration" Title="Customer Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 533px; position: static; height: 100px">
        <tr>
            <td colspan="4">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Style="position: static"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 21px">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" Style="position: static"
                    Text="*"></asp:Label>
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Style="position: static"
                    Text="All are mandatory>>"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label2" runat="server" Style="position: static" Text="First Name :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox1" runat="server" Style="position: static"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="Label3" runat="server" Style="position: static" Text="Last Name :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox2" runat="server" Style="position: static"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label4" runat="server" Style="position: static" Text="Gender :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox3" runat="server" Style="position: static"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="Label5" runat="server" Style="position: static" Text="Email Address :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox4" runat="server" Style="position: static"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label6" runat="server" Style="position: static" Text="City :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox5" runat="server" Style="position: static"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="Label7" runat="server" Style="position: static" Text="State :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox6" runat="server" Style="position: static"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label8" runat="server" Style="position: static" Text="Country :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox7" runat="server" Style="position: static"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:Label ID="Label9" runat="server" Style="position: static" Text="Mobile no :"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox8" runat="server" Style="position: static"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="4" style="height: 21px">
                <asp:Label ID="Label10" runat="server" Style="position: static" Text="Login Values >>>"
                    Width="135px"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 26px">
                <asp:Label ID="Label11" runat="server" Style="position: static" Text="User Name :"></asp:Label></td>
            <td colspan="2" style="height: 26px">
                <asp:TextBox ID="TextBox9" runat="server" AutoPostBack="True" 
                    Style="position: static" OnTextChanged="TextBox9_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="4" valign="top">
                <asp:Label ID="Label17" runat="server" Font-Bold="True" Style="position: static"
                    Width="230px"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 2px">
                <asp:Label ID="Label12" runat="server" Style="position: static" Text="Password :"></asp:Label></td>
            <td colspan="2" style="height: 2px">
                <asp:TextBox ID="TextBox10" runat="server" Style="position: static" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 2px">
                <asp:Label ID="Label15" runat="server" Style="position: static" Text="Enter Security text :"></asp:Label></td>
            <td colspan="2" style="height: 2px">
                <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Stencil"
                    Font-Size="XX-Large" Style="position: static"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 1px">
            </td>
            <td colspan="2" style="height: 1px">
                <asp:TextBox ID="TextBox11" runat="server" Style="position: static"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="4" rowspan="3" valign="top">
                <asp:Button ID="Button1" runat="server" Style="position: static"
                    Text="Sumbit>>" OnClick="Button1_Click" /></td>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    </table>
</asp:Content>

