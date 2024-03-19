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
    public partial class themBanTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            // Lấy giá trị chuỗi kết nối
            string chuoiKetNoi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoiKetNoi);
            conn.Open();
            // Tạo câu sql để thêm nhân viên
            string sql = "insert into BanTin(TieuDe,TomTat,NoiDung,Hinh,NgayDang,TrangThai,TheLoaiID) values (@TieuDe,@TomTat,@NoiDung,@Hinh,@NgayDang,@TrangThai,@TheLoaiID)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            // TRuyền giá trị
            cmd.Parameters.AddWithValue("@TieuDe", txtTieuDe.Text);
            cmd.Parameters.AddWithValue("@TomTat", txtTomTat.Text);
            cmd.Parameters.AddWithValue("@NoiDung", txtNoiDung.Text);
            // upload hình
            if (fileHinh.HasFile)
            {
                string duong_dan = Server.MapPath("~/uploads/") + fileHinh.FileName;
                fileHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@Hinh", fileHinh.FileName);

            }
            else {
                cmd.Parameters.AddWithValue("@Hinh", "no_images.png");
                  }

            

            cmd.Parameters.AddWithValue("@NgayDang", txtNgayDang.Text);

            cmd.Parameters.AddWithValue("@TrangThai", checkTrangThai.Checked);
            cmd.Parameters.AddWithValue("@TheLoaiID", ddlTheLoai.SelectedValue);

            int check = cmd.ExecuteNonQuery();
            if (check > 0)
            {
                Response.Redirect("qlTinTuc.aspx");

                //lblThongBao.Text = "Thêm nhân viên  thành công!";
            }
            else
            {
                lblThongBao.Text = "Thêm bản tin thành công!";
            }
        }
    }
    
}