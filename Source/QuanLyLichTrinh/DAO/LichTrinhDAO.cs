using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAO
{
    public class LichTrinhDAO
    {
        private DataProvider dtp;
        private DataTable dt;

        public DataTable XemThongTinLichTrinh()
        {
            dtp = new DataProvider();
            dt = new DataTable();
            string sqlSelect = @"SELECT * FROM LichTrinh";
            dt = dtp.GetDataTable(sqlSelect);
            return dt;
        }
    }
}
