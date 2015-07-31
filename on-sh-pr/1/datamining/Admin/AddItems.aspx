<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="AddItems.aspx.cs" Inherits="Admin_AddItems" Title="Add Product item for" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 566px; position: static; height: 100px">
            <tr>
                <td colspan="3">
                    <strong>Add Items</strong></td>
            </tr>
            <tr>
                <td style="width: 111px">
                    Select Item Type :</td>
                <td style="width: 100px" align="left" valign="top">
                    <asp:DropDownList ID="DropDownList1" runat="server" Style="position: static">
                    </asp:DropDownList></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                    Item for :</td>
                <td style="width: 100px" align="left" valign="top">
                    <asp:TextBox ID="TextBox1" runat="server" Style="position: static"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                </td>
                <td style="width: 100px" align="left" valign="top">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="position: static"
                        Text="Add.." Font-Bold="True" /></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Style="position: static" AutoGenerateColumns="False" AllowPaging="True" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                        
                         <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                        <asp:LinkButton ID="delete" runat="server" Text="delete" CommandName="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="ItemId">
                        <ItemTemplate>
                        <asp:Label ID="itemid" runat="server" Text='<%#Eval("itemid") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="ProductName">
                        <ItemTemplate>
                        <asp:Label ID="pname" runat="server" Text='<%#Eval("productname") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="ItemFor">
                        <ItemTemplate>
                        <asp:Label ID="itemfor" runat="server" Text='<%#Eval("itemfor") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="CreatedDate">
                        <ItemTemplate>
                        <asp:Label ID="cdate" runat="server" Text='<%#Eval("cdate") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        </Columns>
                        <EmptyDataTemplate>
                            <strong>There are no Item Deatils.</strong>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

