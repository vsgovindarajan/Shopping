<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="SoldProducts.aspx.cs" Inherits="UserInBox_SoldProducts" Title="Your sold products are" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100px; position: static; height: 100px">
        <tr>
            <td colspan="2" rowspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    Style="position: static" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" CellPadding="0" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" Width="515px">
                    <Columns>
                    
                    <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>  
                    
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
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    </table>
</asp:Content>

