using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLNS
{
    public partial class ThemNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Lấy giá trị chuỗi kết nối
            string chuoiKetNoi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString2"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoiKetNoi);
            conn.Open();
            // Tạo câu sql để thêm nhân viên
            string sql = "insert into nhanvien(honv,tennv,phai,ngaysinh,noisinh,maphong) values (@honv,@tennv,@phai,@ngaysinh,@noisinh,@maphong)";
            SqlCommand cmd= new SqlCommand(sql, conn);
            // TRuyền giá trị
            cmd.Parameters.AddWithValue("@honv", txtHoNhanVien.Text);
            cmd.Parameters.AddWithValue("@tennv", txtTenNhanVien.Text);    
            if (radNam.Checked)
            
                cmd.Parameters.AddWithValue("@phai", true);
            
            else 
                cmd.Parameters.AddWithValue("@phai", false);

            cmd.Parameters.AddWithValue("@ngaysinh", txtNgaySinh.Text);

            cmd.Parameters.AddWithValue("@noisinh", txtNoiSinh.Text);
            cmd.Parameters.AddWithValue("@maphong", ddlMaPhong.SelectedValue);

            int check = cmd.ExecuteNonQuery();
            if (check>0)
            {
                Response.Redirect("qlNhanVien.aspx");

                //lblThongBao.Text = "Thêm nhân viên  thành công!";
            }
            else
            {
                lblThongBao.Text = "Thêm nhân viên  thất bại!";
            }
        }
    }
}