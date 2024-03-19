<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="qlTheLoai.aspx.cs" Inherits="WebQLNS.qlTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>/* CSS cho bảng */
table {
    width: 100%; /* chiều rộng của bảng là 100% của phần tử cha */
    border-collapse: collapse; /* loại bỏ khoảng cách giữa các ô */
}

/* CSS cho các dòng trong bảng */
table tr {
    background-color: #FFFFFF; /* màu nền của các dòng */
    color: #284775; /* màu chữ của các dòng */
}

/* CSS cho dòng nền xen kẽ */
table tr:nth-child(even) {
    background-color: #E0FFFF; /* màu nền của dòng xen kẽ */
}

/* CSS cho các ô trong bảng */
table td, table th {
    border: 1px solid #999999; /* định dạng đường viền của các ô */
    padding: 8px; /* khoảng cách giữa nội dung và đường viền của ô */
}

/* CSS cho tiêu đề cột */
table th {
    background-color: #E0FFFF; /* màu nền của tiêu đề cột */
    color: #333333; /* màu chữ của tiêu đề cột */
    font-weight: bold; /* đậm cho tiêu đề cột */
}

/* CSS cho nút Xóa và Sửa */
input[type="submit"] {
    background-color: #5D7B9D; /* màu nền của nút */
    color: #FFFFFF; /* màu chữ của nút */
    border: none; /* loại bỏ đường viền */
    padding: 5px 10px; /* định dạng kích thước của nút */
    cursor: pointer; /* biểu tượng chuột khi di chuyển qua nút */
    margin-right: 5px; /* khoảng cách với các phần tử khác */
}

input[type="submit"]:hover {
    background-color: #284775; /* màu nền khi di chuột qua */
}
</style>
<h2 class="text-center">QUẢN LÍ THỂ LOẠI</h2>
    <hr />
    <asp:SqlDataSource ID="daTheLoai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" DeleteCommand="DELETE FROM [TheLoai] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TheLoai] ([TenTheLoai], [TrangThai]) VALUES (@TenTheLoai, @TrangThai)" ProviderName="<%$ ConnectionStrings:QLNhanVienConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [TheLoai]" UpdateCommand="UPDATE [TheLoai] SET [TenTheLoai] = @TenTheLoai, [TrangThai] = @TrangThai WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenTheLoai" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenTheLoai" Type="String" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="daTheLoai" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server"  CommandName="Delete" Text="Xóa" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Sửa" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TenTheLoaiTextBox" runat="server" Text='<%# Bind("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Thêm " />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TenTheLoaiTextBox" runat="server" Text='<%# Bind("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure to delete')" Text="Xóa" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Sửa" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">Id</th>
                                <th runat="server">TenTheLoai</th>
                                <th runat="server">TrangThai</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server"  CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TenTheLoaiLabel" runat="server" Text='<%# Eval("TenTheLoai") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    
</asp:Content>
