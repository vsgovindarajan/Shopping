<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="BharathExp.aspx.cs" Inherits="BharathExp" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    onrowcancelingedit="GridView1_RowCancelingEdit" 
                    onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                    
                    <asp:TemplateField HeaderText="delete">
                    <ItemTemplate>
                    <asp:LinkButton ID="lnkbtndelete" runat="server" Text="delete" CommandName="delete">
                    </asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="edit">
                    <ItemTemplate>
                    <asp:LinkButton ID="lnkbtndupdate" runat="server" Text="update" CommandName="update">
                    </asp:LinkButton>
                    <asp:LinkButton ID="lnkbtncancel" runat="server" Text="cancel" CommandName="cancel">
                    </asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                    
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

