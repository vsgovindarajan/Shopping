<%@ Page Language="C#" MasterPageFile="~/salesman.master" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="Admin_Customers" Title="Registerd customers details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellSpacing="10" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand"
        PageSize="6" Style="position: static" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
        
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("uid") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        
            <asp:TemplateField HeaderText="CustomerId">
                <ItemTemplate>
                    <asp:Label ID="uid" runat="server" Text='<%#Eval("uid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="CustomerUName">
                <ItemTemplate>
                    <asp:Label ID="uname" runat="server" Text='<%#Eval("uname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:LinkButton ID="status" runat="server" CommandArgument='<%#Eval("uid") %>' CommandName="Artist"
                        Text='<%#Eval("status") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="CDate">
                <ItemTemplate>
                    <asp:Label ID="cdate" runat="server" Text='<%#Eval("cdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="SoldDetails">
                <ItemTemplate>
                    <asp:LinkButton ID="sid" runat="server" Text="view" CommandName="sview" CommandArgument='<%#Eval("uid") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="CardDetails">
                <ItemTemplate>
                    <asp:LinkButton ID="cid" runat="server" Text="view" CommandName="cview" CommandArgument='<%#Eval("uid") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Style="position: static" Text="There are no artists."
                Width="147px"></asp:Label>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>

