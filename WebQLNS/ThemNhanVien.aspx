<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ThemNhanVien.aspx.cs" Inherits="WebQLNS.ThemNhanVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/bootstrap.rtl.min.css" rel="stylesheet" />
    <form>
        <h2 class="text-center">THÊM NHÂN VIÊN</h2>
        <div class="container p-3 my-3 border text-center border border-primary">
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Họ nhân viên</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="w-100 h-100" ID="txtHoNhanVien" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Tên nhân viên</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="w-100 h-100" ID="txtTenNhanVien" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Phái</label>
                <div class="col-sm-10">
                    <asp:RadioButton ID="radNam" Checked="true" GroupName="radGioiTinh" Text="Nam" runat="server" />
                    <asp:RadioButton ID="radNu" Text="Nử" GroupName="radGioiTinh" runat="server" />
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Ngày sinh</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="w-50 h-100" TextMode="Date" ID="txtNgaySinh" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="l" class="col-sm-2 col-form-label">Nơi sinh</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="w-100 h-100" ID="txtNoiSinh" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Mã phòng</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="ddlMaPhong" runat="server" DataSourceID="SqlDataSource1" DataTextField="TenPhong" DataValueField="MaPhong"></asp:DropDownList>
                </div>
            </div>
            <asp:Button CssClass="btn btn-success" ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" />
            <asp:Label ID="lblThongBao" CssClass="text-bg-success text-center" runat="server" Text=""></asp:Label>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString3 %>" SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
       
    </form>
</asp:Content>
