<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="productdetails.aspx.cs" Inherits="Admin_productdetails" Title="All product details list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table style="width: 370px; position: static; height: 18px">
            <tr>
                <td style="width: 100px">
                    <strong><span style="text-decoration: underline">Available roduct Details</span></strong></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="6" Style="position: static" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                        <asp:Label ID="itemid" runat="server" Text='<%#Eval("pitemdid") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Brandname">
                        <ItemTemplate>
                        <asp:Label ID="bname" runat="server" Text='<%#Eval("Brandname") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                        <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("imagepath") %>' Width="100" Height="100" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="ItemCost">
                        <ItemTemplate>
                        <asp:Label ID="cost" runat="server" Text='<%#Eval("cost") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="CDate">
                        <ItemTemplate>
                        <asp:Label ID="cdate" runat="server" Text='<%#Eval("cdate") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        </Columns>
                        
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

