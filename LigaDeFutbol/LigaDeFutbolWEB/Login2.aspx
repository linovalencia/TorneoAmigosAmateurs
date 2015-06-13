<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login2.aspx.cs" Inherits="Login2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 361px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
 
    
    
    <table class="nav-justified">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
                </asp:Login>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
            <td>&nbsp;</td>
        </tr>
    </table>

    
    
 
    
    
</asp:Content>

