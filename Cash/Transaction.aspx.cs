using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Cash
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Fromdatepicker.Value = DateTime.Now.ToString("dd/MMM/yyyy"); ;
                Todatepicker.Value = DateTime.Now.ToString("dd/MMM/yyyy");
                using (SqlConnection SCON = new SqlConnection(@"uid=sa;pwd=Welc0me;database=Cash;server=DESKTOP-C04IQTS\HOSQLSERVER"))
                {
                    DataSet ds = new DataSet();
                    SCON.Open();
                    SqlCommand sc = new SqlCommand("FormLoad", SCON);
                    sc.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(sc);
                    da.Fill(ds);
                    FillCombo(ds.Tables[0], ddlLedgerName);
                    FillCombo(ds.Tables[1], ddlSubledger);

                }

            }
            Search();

        }

        protected void FillCombo(DataTable dt, DropDownList ddl)
        {
            ddl.DataValueField = "ID";
            ddl.DataTextField = "NAME";
            ddl.DataSource = dt;
            ddl.DataBind();
        }
        protected void Search()
        {
            DataSet dt = new DataSet();
            using (SqlConnection scon = new SqlConnection(@"uid=sa;pwd=Welc0me;database=Cash;server=DESKTOP-C04IQTS\HOSQLSERVER"))
            {
                CultureInfo culture = new CultureInfo("es-ES");
                scon.Open();
                SqlCommand sc = new SqlCommand("GetDeatails", scon);
                sc.CommandType = CommandType.StoredProcedure;
                sc.Parameters.AddWithValue("@FromDate", Convert.ToDateTime(Fromdatepicker.Value));
                sc.Parameters.AddWithValue("@ToDate", Convert.ToDateTime(Todatepicker.Value));
                sc.Parameters.AddWithValue("@LedgerName", ddlLedgerName.SelectedValue);
                sc.Parameters.AddWithValue("@SubLedgerName", ddlSubledger.SelectedValue);
                SqlDataAdapter da = new SqlDataAdapter(sc);
                da.Fill(dt);
                scon.Close();
            }
            gvExpenses.DataSource = dt.Tables[0];
            gvExpenses.DataBind();
            string[] x = new string[dt.Tables[1].Rows.Count];
            int[] y = new int[dt.Tables[1].Rows.Count];
            for (int i = 0; i < dt.Tables[1].Rows.Count; i++)
            {
                x[i] = dt.Tables[1].Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Tables[1].Rows[i][1].ToString());
            }
            //Chart1.Series[0].Points.DataBindXY(x, y);
            //Chart1.Series[0].ChartType = SeriesChartType.StackedBar;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Addtransaction.aspx");

        }
    }
}