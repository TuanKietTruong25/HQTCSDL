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
    public partial class frmThongTinQuanLy : Form
    {
        public frmThongTinQuanLy()
        {
            InitializeComponent();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            // gọi sp_ThemQuanLy
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            // gọi sp_XoaQuanLy
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            // gọi sp_SuaQuanLy
        }

        private void frmThongTinQuanLy_Load(object sender, EventArgs e)
        {
            // gọi sp_XemThongTinQuanLy
            // gọi sp_XemDanhSachQuanLy
        }
    }
}
