<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="themBanTin.aspx.cs" Inherits="WebQLNS.themBanTin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/bootstrap.rtl.min.css" rel="stylesheet" />
    <script src="Scripts/ckeditor/ckeditor.js"></script>
    <form>
        <h2 class="text-center">THÊM BẢN TIN</h2>
        <div class="container p-3 my-3 border text-center border border-primary">
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Tiêu đề</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="w-100 h-100" ID="txtTieuDe" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Tóm tắt</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="w-100 h-100"  TextMode="MultiLine" ID="txtTomTat" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Nội dung</label>
                <div class="col-sm-10">
                    
                    <asp:TextBox CssClass="ckeditor" TextMode="MultiLine" ID="txtNoiDung" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Hình</label>
                <div class="col-sm-10">
                    <asp:FileUpload ID="fileHinh" runat="server" />
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Ngày đăng</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="w-100 h-100" TextMode="Date" ID="txtNgayDang" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Trạng thái</label>
                <div class="col-sm-10 text-left">
                    <asp:CheckBox ID="checkTrangThai" runat="server" />
                </div>
            </div>
            <div class="form-group row mb-2">
                <label for="" class="col-sm-2 col-form-label">Id thể loại</label>
                <div class="col-sm-10 text-left">
                    <asp:DropDownList ID="ddlTheLoai" runat="server" DataSourceID="dtTheLoai" DataTextField="TenTheLoai" DataValueField="Id"></asp:DropDownList>
                </div>
            </div>
            <asp:SqlDataSource ID="dtTheLoai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" DeleteCommand="DELETE FROM [TheLoai] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TheLoai] ([TenTheLoai], [TrangThai]) VALUES (@TenTheLoai, @TrangThai)" SelectCommand="SELECT * FROM [TheLoai]" UpdateCommand="UPDATE [TheLoai] SET [TenTheLoai] = @TenTheLoai, [TrangThai] = @TrangThai WHERE [Id] = @Id">
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
             <asp:Button ID="btnLuu" CssClass="btn btn-success" runat="server" Text="SAVE" OnClick="btnLuu_Click" />
            <asp:Label ID="lblThongBao" runat="server" Text="ThongBao"></asp:Label>
        </div>
    </form>
</asp:Content>
