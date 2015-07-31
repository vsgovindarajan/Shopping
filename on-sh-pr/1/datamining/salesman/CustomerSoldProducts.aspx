<%@ Page Language="C#" MasterPageFile="~/salesman.master" AutoEventWireup="true" CodeFile="CustomerSoldProducts.aspx.cs" Inherits="Admin_CustomerSoldProducts" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="0" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" Style="position: static" Width="515px">
        <Columns>
            
            <asp:TemplateField HeaderText="SoldPID">
                <ItemTemplate>
                    <asp:Label ID="spid" runat="server" Text='<%#Eval("spid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BrandName">
                <ItemTemplate>
                    <asp:Label ID="bname" runat="server" Text='<%#Eval("brandname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cost">
                <ItemTemplate>
                    <asp:Label ID="cost" runat="server" Text='<%#Eval("cost") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="cimg" runat="server" Height="100" ImageUrl='<%#Eval("imgpath") %>'
                        Width="100" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SoldDate">
                <ItemTemplate>
                    <asp:Label ID="cdate" runat="server" Text='<%#Eval("cdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataTemplate>
            <strong>There are no sold product items.</strong>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>

