<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="ProductGallery.aspx.cs" Inherits="UserInBox_ProductGallery" Title="Welcome to product gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 698px; position: static; height: 100px">
            <tr>
                <td colspan="6">
                    <strong>Available Product Details</strong></td>
            </tr>
            <tr>
                <td colspan="6" style="height: 51px">
                    <div style="text-align: center">
                        <table style="width: 638px; position: static; height: 8px">
                            <tr>
                                <td bgcolor="#33ccff" style="width: 100px">
                    Select PType :</td>
                                <td bgcolor="#33ccff" style="width: 100px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Style="position: static" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList></td>
                                <td bgcolor="#33ccff" style="width: 100px">
                    Select Item For :</td>
                                <td bgcolor="#33ccff" style="width: 100px">
                    <asp:DropDownList ID="DropDownList2" runat="server" Style="position: static">
                    </asp:DropDownList></td>
                                <td bgcolor="#33ccff" style="width: 100px">
                    <asp:Button ID="Button1" runat="server" Style="position: static" Text="Search >>" OnClick="Button1_Click" /></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 100px" bgcolor="#33ccff">
                </td>
                <td style="width: 48px" bgcolor="#33ccff">
                </td>
                <td bgcolor="#33ccff" colspan="2">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Style="position: static" Text="Label"
                        Width="262px"></asp:Label></td>
                <td style="width: 100px" bgcolor="#33ccff">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Style="position: static"
                        Text="ShowAll>>>" /></td>
                <td style="width: 100px" bgcolor="#33ccff">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 48px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="6" rowspan="4">
                    <asp:DataList ID="DataList1" runat="server" Style="position: static" RepeatColumns="2" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
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
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("pitemdid") %>'
                                            CommandName="details" Style="position: static" Text="View Details"></asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="LinkButton1" runat="server" Style="position: static" Text="addtocart" CommandArgument='<%#Eval("pitemdid") %>' CommandName="Cart"></asp:LinkButton></td>
                                </tr>
                                
                                
                            </table>
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 48px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

