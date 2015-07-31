<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="view salesmandetails.aspx.cs" Inherits="Admin_view_salesmandetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Height="92px" 
        OnPageIndexChanging="GridView1_PageIndexChanging" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
        onrowupdating="GridView1_RowUpdating" PageSize="4" Width="763px">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="Update" runat="server" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Empid">
                <ItemTemplate>
                    <asp:Label ID="empid" runat="server" Text='<%#Eval("eid")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="empid1" runat="server" Text='<%#Eval("eid")%>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EmpName">
                <ItemTemplate>
                    <asp:Label ID="empname" runat="server" Text='<%#Eval("ename")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone No">
                <ItemTemplate>
                    <asp:Label ID="phno" runat="server" Text='<%#Eval("phno")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="phno1" runat="server" Text='<%#Eval("phno")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Of Join">
                <ItemTemplate>
                    <asp:Label ID="doj" runat="server" Text='<%#Eval("doj")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EmailID">
                <ItemTemplate>
                    <asp:Label ID="emailid" runat="server" Text='<%#Eval("email")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="emailid1" runat="server" Text='<%#Eval("email")%>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Login">
                <ItemTemplate>
                    <asp:Label ID="login" runat="server" Text='<%#Eval("login")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>

