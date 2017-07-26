using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BUS
{
    public class TaiXeBUS
    {
        private DAO.TaiXeDAO taiXeDAO;
        private DataTable dt;

        public DataTable XemThongTinLichTrinhCaNhan(int maTaiXe)
        {
            taiXeDAO = new DAO.TaiXeDAO();
            dt = taiXeDAO.XemThongTinLichTrinhCaNhan(maTaiXe);
            return dt;
        }
    }
}
