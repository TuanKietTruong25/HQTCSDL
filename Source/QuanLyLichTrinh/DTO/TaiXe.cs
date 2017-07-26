using System;

namespace DTO
{
    class TaiXe
    {
        private string maTaiXe;
        private string tenTaiXe;
        private DateTime ngaySinh;
        private string diaChi;
        private string cmnd;
        private string sdt;
        private float soKm;
        private int maNhom;

        public TaiXe()
        {
            //nothing!
        }

        public TaiXe(string maTaiXe, string tenTaiXe, DateTime ngaySinh, string diaChi, string cmnd, string sdt, float soKm, int maNhom)
        {
            this.MaTaiXe = maTaiXe;
            this.TenTaiXe = tenTaiXe;
            this.NgaySinh = ngaySinh;
            this.DiaChi = diaChi;
            this.Cmnd = cmnd;
            this.Sdt = sdt;
            this.SoKm = soKm;
            this.MaNhom = maNhom;
        }

        public string MaTaiXe { get => maTaiXe; set => maTaiXe = value; }
        public string TenTaiXe { get => tenTaiXe; set => tenTaiXe = value; }
        public DateTime NgaySinh { get => ngaySinh; set => ngaySinh = value; }
        public string DiaChi { get => diaChi; set => diaChi = value; }
        public string Cmnd { get => cmnd; set => cmnd = value; }
        public string Sdt { get => sdt; set => sdt = value; }
        public float SoKm { get => soKm; set => soKm = value; }
        public int MaNhom { get => maNhom; set => maNhom = value; }
    }
}
