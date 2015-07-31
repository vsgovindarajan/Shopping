<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="creditordebitcard.aspx.cs" Inherits="user_creditordebitcard" Title="Througn credit or debit card" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table style="width: 511px; position: static; height: 100px">
            <tr>
                <td align="center" colspan="3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Style="position: static" Text="Select Payment Method>>>"
                        Width="193px"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Style="position: static" Text="Payment by Credit Card>>"
                        Width="188px"></asp:Label></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:RadioButton ID="RadioButton1" runat="server" Style="position: static" GroupName="a" Text="Master Card" Width="115px" /></td>
                <td style="width: 100px">
                    <asp:Image ID="Image1" runat="server" Height="30px" ImageUrl="~/Creditcards/mastercard.jpg"
                        Style="position: static" Width="150px" /></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:RadioButton ID="RadioButton2" runat="server" Style="position: static" GroupName="a" Text="Visa" Width="115px" /></td>
                <td style="width: 100px">
                    <asp:Image ID="Image2" runat="server" Height="30px" ImageUrl="~/Creditcards/visa.jpg"
                        Style="position: static" Width="150px" /></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Style="position: static" Text="Payment by Debit Card>>"
                        Width="188px"></asp:Label></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:RadioButton ID="RadioButton3" runat="server" Style="position: static" GroupName="a" Text="Axis Bank" Width="115px" /></td>
                <td style="width: 100px">
                    <asp:Image ID="Image3" runat="server" Height="30px" ImageUrl="~/debitcards/axisbank.gif"
                        Style="position: static" Width="150px" /></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:RadioButton ID="RadioButton4" runat="server" Style="position: static" GroupName="a" Text="HDFC Bank" /></td>
                <td style="width: 100px">
                    <asp:Image ID="Image4" runat="server" Height="30px" ImageUrl="~/debitcards/hdfcbank.gif"
                        Style="position: static" Width="150px" /></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 22px">
                    <asp:RadioButton ID="RadioButton5" runat="server" Style="position: static" GroupName="a" Text="Citi Bank" Width="116px" /></td>
                <td style="width: 100px; height: 22px">
                    <asp:Image ID="Image5" runat="server" Height="30px" ImageUrl="~/debitcards/citibakk.gif"
                        Style="position: static" Width="150px" /></td>
                <td style="width: 100px; height: 22px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                    <asp:Button ID="Button1" runat="server" Style="position: static" Text="Ok>>>" OnClick="Button1_Click" /></td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

