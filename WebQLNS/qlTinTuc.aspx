<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="qlTinTuc.aspx.cs" Inherits="WebQLNS.qlTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2 class="text-center">QUẢN LÍ TIN TỨC</h2>
    <a class="btn btn-danger" href="themBanTin.aspx">themBanTin.aspx</a>
    <asp:SqlDataSource ID="dsTinTuc" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" DeleteCommand="DELETE FROM [BanTin] WHERE [Id] = @Id" InsertCommand="INSERT INTO [BanTin] ([TieuDe], [TomTat], [NoiDung], [Hinh], [NgayDang], [TrangThai], [TheLoaiID]) VALUES (@TieuDe, @TomTat, @NoiDung, @Hinh, @NgayDang, @TrangThai, @TheLoaiID)" SelectCommand="SELECT * FROM [BanTin]" UpdateCommand="UPDATE [BanTin] SET [TieuDe] = @TieuDe, [TomTat] = @TomTat, [NoiDung] = @NoiDung, [Hinh] = @Hinh, [NgayDang] = @NgayDang, [TrangThai] = @TrangThai, [TheLoaiID] = @TheLoaiID WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvBanTin" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsTinTuc">
        <Columns>
            <asp:BoundField DataField="TieuDe" HeaderText="TieuDe" SortExpression="TieuDe" />
            <asp:BoundField DataField="TomTat" HeaderText="TomTat" SortExpression="TomTat" />
            <asp:BoundField DataField="NoiDung" HeaderText="NoiDung" SortExpression="NoiDung" />
            <asp:BoundField DataField="Hinh" HeaderText="Hinh" SortExpression="Hinh" />
            <asp:BoundField DataField="NgayDang" HeaderText="NgayDang" SortExpression="NgayDang" />
            <asp:CheckBoxField DataField="TrangThai" HeaderText="TrangThai" SortExpression="TrangThai" />
            <asp:BoundField DataField="TheLoaiID" HeaderText="TheLoaiID" SortExpression="TheLoaiID" />
        </Columns>
    </asp:GridView>
</asp:Content>
