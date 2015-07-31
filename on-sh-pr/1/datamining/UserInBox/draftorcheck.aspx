<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="draftorcheck.aspx.cs" Inherits="user_draftorcheck" Title="through Drafts and cheques" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table style="width: 508px; position: static; height: 100px">
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Font-Bold="False" Style="position: static"
                        Text="1)Thank you for buying art through ArtCollectorsTM. Your order has been placed with us and will be dispatched by the artist once the payment is received by us on his behalf."
                        Width="498px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 21px;">
                    <asp:Label ID="Label2" runat="server" Height="21px" Style="position: static" Text="2)Art Collectors Pvt Ltd."
                        Width="453px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Style="position: static" Text="Bank A/C Number: 00570 500 6260"
                        Width="492px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 21px;">
                    <asp:Label ID="Label4" runat="server" Style="position: static" Text="ICICI Bank, Prabhadevi Branch, Mumbai"
                        Width="495px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Style="position: static" Text="MICR Code is: 400229013"
                        Width="494px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Style="position: static" Text="3)For wire transfers, the SWIFT code is: ICICINBB011"
                        Width="491px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="Label7" runat="server" Style="position: static" Text="4)&#13;&#10;You may deposit the amount at any ICICI Branch or ATM in case you have chosen payment by Demand Draft/Cheque. Alternately you may contact your bank to initiate a wire transfer using the above SWIFT Code.&#13;&#10;"
                        Width="495px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 100px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="position: static"
                        Text="Submit>>" /></td>
            </tr>
        </table>
    </div>
</asp:Content>

