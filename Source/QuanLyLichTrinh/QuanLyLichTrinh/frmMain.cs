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
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }


        private void mnLichTrinh2_Click(object sender, EventArgs e)
        {
            frmThongTinLichTrinh frmLichTrinh = new frmThongTinLichTrinh();
            frmLichTrinh.ShowDialog();
        }

        private void mnLichTrinh_Click(object sender, EventArgs e)
        {
            frmThongTinLichTrinh frmLichTrinh = new frmThongTinLichTrinh();
            frmLichTrinh.ShowDialog();
        }

        private void mnQuanLy_Click(object sender, EventArgs e)
        {
            frmThongTinQuanLy frmQuanLy = new frmThongTinQuanLy();
            frmQuanLy.ShowDialog();
        }

        private void mnTaiXe_Click(object sender, EventArgs e)
        {
            frmThongTinTaiXe frmTaiXe = new frmThongTinTaiXe();
            frmTaiXe.ShowDialog();
        }

        private void mnThoat_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Bạn muốn thoát khỏi chương trình?", "Cảnh báo", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                Application.Exit();
            }           
        }

    }
}
