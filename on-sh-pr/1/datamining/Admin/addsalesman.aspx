<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="addsalesman.aspx.cs" Inherits="Admin_addsalesman" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td align="center" colspan="3" 
                style="font-weight: bolder; font-size: 16px; background-color: #008000">
                Sales Man Details
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="3" 
                                        style="font-weight: bolder; font-size: 16px; background-color: #008000">
                                        <asp:Label ID="Label2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bolder; font-size: 16px; background-color: #008000">
                                        Employee Name</td>
            <td style="background-color: #e9e9e9">
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            </td>
            <td style="background-color: #e9e9e9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtname" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="font-weight: bolder; font-size: 16px; background-color: #008000">
                Phone No</td>
            <td style="background-color: #e9e9e9">
                <asp:TextBox ID="txtphno" runat="server"></asp:TextBox>
            </td>
            <td style="background-color: #e9e9e9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtphno" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="font-weight: bolder; font-size: 16px; background-color: #008000">
                Date of Join</td>
            <td style="background-color: #e9e9e9">
                <asp:TextBox ID="txtdoj" runat="server"></asp:TextBox>
            </td>
            <td style="background-color: #e9e9e9">
                <asp:Label ID="Label1" runat="server" Font-Size="13pt" 
                    Text="Enter Date in 'dd/mm/yyyy' Formate"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtdoj" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bolder; font-size: 16px; background-color: #008000">
                Email</td>
            <td style="background-color: #e9e9e9">
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            </td>
            <td style="background-color: #e9e9e9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtemail" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bolder; font-size: 16px; background-color: #008000">
                Login</td>
            <td style="background-color: #e9e9e9">
                <asp:TextBox ID="txtlogin" runat="server"></asp:TextBox>
            </td>
            <td style="background-color: #e9e9e9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtlogin" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bolder; font-size: 16px; background-color: #008000">
                Password</td>
            <td style="background-color: #e9e9e9">
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="background-color: #e9e9e9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtpwd" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bolder; font-size: 16px; background-color: #008000">
                Confirm Password</td>
            <td style="background-color: #e9e9e9">
                <asp:TextBox ID="txtcpwd" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="background-color: #e9e9e9">
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtpwd" ControlToValidate="txtcpwd" 
                    ErrorMessage="Invalid Password"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" 
                style="font-weight: bolder; font-size: 16px; background-color: #e9e9e9">
                <asp:Button ID="btnadd" runat="server" OnClick="btnadd_Click" 
                    style="height: 26px" Text="Add Details" />
                <asp:Button ID="btnclear" runat="server" CausesValidation="False" 
                    Text="Clear" />
            </td>
        </tr>
        <tr>
            <td colspan="3" 
                style="font-weight: bolder; font-size: 16px; background-color: #008000">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" 
                style="font-weight: bolder; font-size: 16px; background-color: #e9e9e9">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

