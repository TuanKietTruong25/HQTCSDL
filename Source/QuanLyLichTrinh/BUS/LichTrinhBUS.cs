using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using System.Data;

namespace BUS
{
    public class LichTrinhBUS
    {
        private DAO.LichTrinhDAO lichTrinhDao;
        private DataTable dt;

        public DataTable XemThongTinLichTrinh()
        {
            lichTrinhDao = new LichTrinhDAO();
            dt = new DataTable();
            dt = lichTrinhDao.XemThongTinLichTrinh();
            return dt;
        }
    }
}
