using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cash
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUserName.Text = txtPassword.Text = "";

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                if (IsPostBack)
                {
                    /*@"uid=spacecraftU1;pwd=Appolo11;
                            database=spacecraft_db;
                            server=DESKTOP-99K0FRS\\PRANEETHDB"
                    using (SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))*/
                    using (SqlConnection sc = new SqlConnection(@"uid=sa;pwd=Welc0me;database=Cash;server=DESKTOP-C04IQTS\HOSQLSERVER"))
                    {
                        sc.Open();
                        SqlCommand scom = new SqlCommand("getUserInfo", sc);
                        scom.CommandType = CommandType.StoredProcedure;
                        scom.Parameters.AddWithValue("@userName", txtUserName.Text);
                        scom.Parameters.AddWithValue("@password", txtPassword.Text);
                        SqlDataAdapter da = new SqlDataAdapter(scom);
                        da.Fill(dt);
                        sc.Close();

                    }
                    if (dt.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Logged in Successfully');</Script>");
                        Session["UserName"] = txtUserName.Text;
                        Session["UserID"] = dt.Rows[0]["ID"].ToString();
                        Response.Redirect("~/Transaction.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Incorrect Credential');</Script>");
                    }
                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}