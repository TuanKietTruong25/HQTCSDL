using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Windows.Forms;
using BUS;

namespace QuanLyLichTrinh
{
    public partial class frmThongTinLichTrinh : Form
    {
        private BUS.LichTrinhBUS lichTrinhBus;
        private DataTable dt;

        public frmThongTinLichTrinh()
        {
            InitializeComponent();
        }

        private void frmThongTinLichTrinh_Load(object sender, EventArgs e)
        {
            lichTrinhBus = new LichTrinhBUS();
            dt = new DataTable();
            dt = lichTrinhBus.XemThongTinLichTrinh();
            dtgvLichTrinh.DataSource = dt;
        }
    }
}
