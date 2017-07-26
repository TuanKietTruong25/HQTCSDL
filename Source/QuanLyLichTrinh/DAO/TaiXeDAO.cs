using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class TaiXeDAO
    {
        private DataProvider dtp;
        private DataTable dt;

        public DataTable XemThongTinLichTrinhCaNhan(int maTaiXe)
        {
            dtp = new DataProvider();
            dt = new DataTable();
            string sqlSelect = string.Format(@"SELECT * FROM LichTrinh WHERE LichTrinh.TaiXe = {0}",maTaiXe);
            dt = dtp.GetDataTable(sqlSelect);
            return dt;
        }
    }
}
