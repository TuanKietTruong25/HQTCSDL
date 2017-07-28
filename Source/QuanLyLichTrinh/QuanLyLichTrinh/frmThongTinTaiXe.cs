using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyLichTrinh
{
    public partial class frmThongTinTaiXe : Form
    {
        private BUS.TaiXeBUS taiXeBUS;
        private DataTable dt;

        public frmThongTinTaiXe()
        {
            InitializeComponent();
        }

        private void frmThongTinTaiXe_Load(object sender, EventArgs e)
        {
            // hiển thị thông tin cá nhân và lịch trình trong tháng của tài xế.
            taiXeBUS = new BUS.TaiXeBUS();
            dt = new DataTable();
           
            dt = taiXeBUS.XemThongTinLichTrinhCaNhan(1);
            dtgvLichTrinhCaNhan.DataSource = dt;

            // gọi sp_XemLichTrinhCaNhan thay load thông tin cá nhân và lịch trình trong tháng của tài xế
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            // gọi sp_ThemTaiXe
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            // gọi sp_XoaTaiXe
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            // gọi sp_SuaTaiXe
        }
    }
}