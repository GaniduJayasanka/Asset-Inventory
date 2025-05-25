<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AsstINV.master" CodeBehind="AssetCount.aspx.cs" Inherits="Asset_Inventory.AssetCount" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Asset Counting
</asp:Content>

<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitleContent" runat="server">
    Asset Counting
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">   
    <style>
        .form-container {
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
        }

        .form-container label {
            font-weight: bold;
            margin-right: 10px;
        }

        .form-container input[type="text"] {
            padding: 5px;
            width: 200px;
            margin-right: 10px;
        }

        .form-container input[type="submit"], .form-container .aspNet-Button {
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover, .form-container .aspNet-Button:hover {
            background-color: #0056b3;
        }

        .gridview-table {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview-table th, .gridview-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .gridview-table th {
            background-color: #4CAF50;
            color: white;
            text-align: center;
        }

        .gridview-table tr:nth-child(even) {
            background-color: #ffffff;
        }

        .textbox-border {
    border: 1px solid black;
}


    </style>

    <div class="form-container">
        <label for="txtRegNo">Reg No:</label>
       <asp:TextBox ID="txtRegNo" runat="server" CssClass="textbox-border"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="aspNet-Button" OnClick="btnSearch_Click" />
    </div>

 

    <asp:GridView ID="GridViewAsset" runat="server" AutoGenerateColumns="False" CssClass="gridview-table">
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
            <asp:BoundField DataField="QTY" HeaderText="Qty" />
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
            <asp:BoundField DataField="physical_count" HeaderText="Physical Count" />
            <asp:BoundField DataField="Not_verified" HeaderText="Not Verified" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
        </Columns>
    </asp:GridView>
</asp:Content>
