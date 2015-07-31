<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="AddtoCart.aspx.cs" Inherits="UserInBox_AddtoCart" Title="Welcome to addtocart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 100px; position: static; height: 100px">
            <tr>
                <td align="center" colspan="3" rowspan="2" valign="top">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
        Style="position: static" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" PageSize="5">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        
        <asp:TemplateField HeaderText="CartId">
        <ItemTemplate>
        <asp:Label ID="cartid" runat="server" Text='<%#Eval("cartid") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="BPicture">
        <ItemTemplate>
        <asp:Image ID="imgpath" runat="server" Width="100" Height="100" ImageUrl='<%#Eval("imgpath") %>' />
        </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="BName">
        <ItemTemplate>
        <asp:Label ID="bname" runat="server" Text='<%#Eval("bname") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="BCost">
        <ItemTemplate>
        <asp:Label ID="cost" runat="server" Text='<%#Eval("cost") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Quantity">
        <ItemTemplate>
        <asp:TextBox ID="qty" runat="server" Width="20" Text='<%#Eval("qty") %>' AutoPostBack="True" OnTextChanged="qty_TextChanged"></asp:TextBox>
        </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Total">
        <ItemTemplate>
        <asp:Label ID="tcost" runat="server" Width="100" Text='<%#Eval("totcost") %>'></asp:Label>
        </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Delete">
        <ItemTemplate>
        <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("cartid") %>'></asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        
        </Columns>
        <EmptyDataTemplate>
            <strong>There are no items in your cart.</strong>
        </EmptyDataTemplate>
    </asp:GridView>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" OnClick="LinkButton1_Click"
                        Style="position: static" Width="135px">Order >>></asp:LinkButton></td>
                <td style="width: 100px">
                    Total cost:</td>
                <td style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Style="position: static"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>

