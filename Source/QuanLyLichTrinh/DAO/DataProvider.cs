using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DAO
{
    public class DataProvider
    {
        private string strConn = "Data Source=.;Initial Catalog=QLTX;Integrated Security=True";
        private SqlConnection conn;
        private SqlCommand cmd;
        private DataTable dt;
        private SqlDataAdapter da;

        /// <summary>
        /// Mở một kết nối tới căn cứ dữ liệu.
        /// </summary>
        public void Connect()
        {
            try{
                conn = new SqlConnection(strConn);
                conn.Open();
            }
            catch(Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.ToString());
            }
        }
        /// <summary>
        /// Cho đóng một kết nối tới căn cứ dữ liệu.
        /// </summary>
        public void DisConnect()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            else
            {
                conn.Dispose();
            }
        }
        /// <summary>
        /// Lấy dữ liệu từ một bảng trong database đổ vào một datatable.
        /// </summary>
        /// <param name="selectQuery">Một câu truy vấn select</param>
        /// <returns></returns>
        public DataTable GetDataTable(string query)
        {
            dt = new DataTable();
            try
            {
                Connect();
                cmd = new SqlCommand(query, conn);
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.ToString());
            }
            finally
            {
                DisConnect();
            }
            return dt;
        }
        /// <summary>
        /// Thực thi một lệnh Insert, Update, hoặc Delete.
        /// trả về số dòng dữ liệu ảnh hưởng
        /// </summary>
        /// <param name="query">Một truy vấn Insert, Update hoặc Delete</param>
        /// <returns></returns>
        public int ExcuteQuery(string query)
        {
            int result = -1;
            try
            {
                Connect();
                cmd = new SqlCommand();
                cmd.CommandText = query;
                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.ToString());
            }
            finally
            {
                DisConnect();
            }
            return result;
        }
    }
}
