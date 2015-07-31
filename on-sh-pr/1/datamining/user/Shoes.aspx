<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shoes.aspx.cs" Inherits="user_Shoes" Title="Welcome to Shoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 451px; position: static; height: 100px">
        <tr>
            <td align="center" colspan="3" style="height: 22px" valign="top">
                <strong><span style="font-size: 14pt; font-family: Vardana; text-decoration: underline">
                    <asp:Label ID="Label7" runat="server" ForeColor="#00C0C0" Style="position: static"
                        Text="Available Shoes Details" Width="282px"></asp:Label></span></strong></td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                <div style="text-align: left">
                    <table style="width: 788px; position: static; height: 6px">
                        <tr>
                            <td style="width: 100px; height: 26px" bgcolor="#00c0c0">
                            </td>
                            <td style="width: 100px; height: 26px" bgcolor="#00c0c0">
                                <strong>Search for :</strong></td>
                            <td style="width: 100px; height: 26px" bgcolor="#00c0c0">
                                <asp:DropDownList ID="DropDownList1" runat="server" Font-Bold="True" Style="position: static"
                                    Width="110px">
                                </asp:DropDownList></td>
                            <td style="width: 100px; height: 26px" bgcolor="#00c0c0">
                                <asp:Button ID="Button1" runat="server" Font-Bold="True" OnClick="Button1_Click"
                                    Style="position: static" Text="Go" /></td>
                            <td style="width: 100px; height: 26px" bgcolor="#00c0c0">
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand"
                    RepeatColumns="2" RepeatDirection="Horizontal" Style="position: static">
                    <ItemTemplate>
                        <div style="text-align: left">
                            <table style="width: 382px; position: static; height: 100px">
                                <tr>
                                    <td style="width: 100px">
                                        Product Name :</td>
                                    <td align="left" style="width: 100px" valign="top">
                                        <asp:Label ID="Label1" runat="server" Style="position: static" Text='<%#Eval("productname") %>'></asp:Label></td>
                                    <td rowspan="6" style="width: 100px">
                                        <asp:Image ID="Image1" runat="server" BackColor="#99ccff" Height="150px" ImageUrl='<%#Eval("imagepath") %>'
                                            Style="position: static" Width="150px" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        Item for :</td>
                                    <td align="left" style="width: 100px" valign="top">
                                        <asp:Label ID="Label2" runat="server" Style="position: static" Text='<%#Eval("itemfor") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        Brand Name :</td>
                                    <td align="left" style="width: 100px" valign="top">
                                        <asp:Label ID="Label3" runat="server" Style="position: static" Text='<%#Eval("brandname") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        Cost :</td>
                                    <td align="left" style="width: 100px" valign="top">
                                        <asp:Label ID="Label4" runat="server" Style="position: static" Text='<%#Eval("cost") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        Description :</td>
                                    <td align="left" style="width: 100px" valign="top">
                                        <asp:Label ID="Label5" runat="server" Style="position: static" Text='<%#Eval("description") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        Manufacture&nbsp; Date :</td>
                                    <td align="left" style="width: 100px" valign="top">
                                        <asp:Label ID="Label6" runat="server" Style="position: static" Text='<%#Eval("cdate") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/UserLogin.aspx" Style="position: static"
                                            Text="Order"></asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("pitemdid") %>'
                                            CommandName="details" Style="position: static" Text="View Details"></asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("imagepath") %>'
                                            CommandName="View" Style="position: static" Text="ViewFullImage"></asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 21px">
                                    </td>
                                    <td style="width: 100px; height: 21px">
                                    </td>
                                    <td style="width: 100px; height: 21px">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <hr align="left" style="width: 8px; color: #666666; position: static; height: 204px" />
                    </SeparatorTemplate>
                </asp:DataList></td>
        </tr>
    </table>
</asp:Content>

