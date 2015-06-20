<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form runat="server">
<script type="text/javascript">

    $(document).ready(function () {

        $('[id$=TextBox1]').datepicker({ showAnim: 'slideDown' });

    });

</script>
  
  
  
<asp:textbox id="TextBox1" runat="server"></asp:textbox>
    </form>

  


    <%--<form id="form1" runat="server">




        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
         <script type="text/javascript">
             $(function () {
                 $("#TextBox3").datepicker({
                     changeMonth: true,
                     changeYear: true
                 });
             });
</script>
  


    <div class="container">
        <div class="container">
            <div class="form-group">
                <label for="dp">Date picker</label>
&nbsp;<input type="date" class="form-control" id="dp" />
            </div>
        </div>

        <script>
            $("#dp").datepicker({
                changeMonth: true,
                changeYear: true
            });
        </script>
    </div>


    </form>--%>


</asp:Content>

