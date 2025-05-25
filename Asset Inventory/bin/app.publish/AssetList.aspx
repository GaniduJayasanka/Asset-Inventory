<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AsstINV.master" CodeBehind="AssetList.aspx.cs" Inherits="Asset_Inventory.AssetList" %>


<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Asset List
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitleContent" runat="server">
    Asset List
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
 <style>
        .section-header {
            background-color: #007bff;
            color: white;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 5px 5px 0 0;
            text-align: center;
        }

        .filter-container {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 15px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            width: 100%;
        }

        .filter-container label {
            font-weight: bold;
        }

        .filter-container input, .filter-container select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            width: 200px;
        }

        .filter-container .btn-filter {
            background-color: #ffc107;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .filter-container .btn-filter:hover {
            background-color: #e0a800;
        }

        .border-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            max-width: none;
        }

        .border-table th, .border-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .border-table th {
            background-color: #4CAF50;
            color: white;
        }

        .table-container {
            overflow-x: auto;
            max-height: 600px;
            width: 100%;
        }

    </style>

    <main class="p-6" style="width: 100%; max-width: 1800px; margin: auto;">
        <section class="bg-white shadow-md rounded-lg">
        
            <!-- Filter Section -->
            <div class="filter-container">
                <label for="txtStartDate">Start Date:</label>
                <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="date-picker"></asp:TextBox>

                <label for="txtEndDate">End Date:</label>
                <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="date-picker"></asp:TextBox>

                <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn-filter" OnClientClick="return validateDates();" OnClick="btnView_Click" />
            </div>

           <div class="table-container">
    <asp:GridView ID="GridViewAsset" runat="server" AutoGenerateColumns="False" ShowFooter="true"
        CssClass="border-table" OnRowDataBound="GridViewAsset_RowDataBound">
        <Columns>
            <asp:BoundField DataField="ItemCode" HeaderText="Item Code" />
            <asp:BoundField DataField="RECEIVED_DATE" HeaderText="Received Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="REG_NUM" HeaderText="Reg No" />
            <asp:BoundField DataField="UNIT" HeaderText="Unit" />
            <asp:BoundField DataField="LOCATION" HeaderText="Location" />
            <asp:BoundField DataField="Catogery" HeaderText="Category" />
            <asp:BoundField DataField="Type" HeaderText="Type" />
            <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" />
            <asp:BoundField DataField="RECEIVED_INV_NO" HeaderText="Received INV No" />

           
            <asp:TemplateField HeaderText="Qty">
                <ItemTemplate><%# Eval("QTY") %></ItemTemplate>
                <FooterTemplate><asp:Label ID="lblTotalQty" runat="server" Font-Bold="true" /></FooterTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="MODEL" HeaderText="Model" />
            <asp:BoundField DataField="SERIAL_NO" HeaderText="Serial No" />
            <asp:BoundField DataField="UNIT_PRICE" HeaderText="Unit Price" DataFormatString="{0:N2}" />
            <asp:BoundField DataField="GRN" HeaderText="GRN" />
            <asp:BoundField DataField="SUPPLIER" HeaderText="Supplier" />
            <asp:BoundField DataField="ISSUED_Date" HeaderText="Issued Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="ISSUED_ASSEST_ACQ_NO" HeaderText="Issued Asset Acq No" />
            <asp:BoundField DataField="BALANCE_QTY" HeaderText="Balance Qty" />
            <asp:BoundField DataField="ISSUED_BY_DEPARTMENT" HeaderText="Issued By Dept." />
            <asp:BoundField DataField="RECEIVED_BY" HeaderText="Received By" />

            <asp:TemplateField HeaderText="Physical Count">
                <ItemTemplate><%# Eval("physical_count") %></ItemTemplate>
                <FooterTemplate><asp:Label ID="lblPhysicalCountTotal" runat="server" Font-Bold="true" /></FooterTemplate>
            </asp:TemplateField>

            
            <asp:TemplateField HeaderText="Not Verified">
                <ItemTemplate><%# Eval("Not_verified") %></ItemTemplate>
                <FooterTemplate><asp:Label ID="lblNotVerifiedTotal" runat="server" Font-Bold="true" /></FooterTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
        </Columns>
    </asp:GridView>
</div>

        </section>
    </main>

    <!-- Client-side validation -->
    <script type="text/javascript">
        function validateDates() {
            var startDate = document.getElementById('<%= txtStartDate.ClientID %>').value;
            var endDate = document.getElementById('<%= txtEndDate.ClientID %>').value;
            if (startDate === "" || endDate === "") {
                alert("Please select both start and end dates.");
                return false;
            }
            if (new Date(startDate) > new Date(endDate)) {
                alert("Start Date should not be greater than End Date.");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
