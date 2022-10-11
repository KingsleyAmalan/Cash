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
    public partial class Addtransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = new DataSet();
               /* using (SqlConnection SCON = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString))*/
                using (SqlConnection SCON = new SqlConnection(@"uid=sa;pwd=Welc0me;database=Cash;server=DESKTOP-C04IQTS\HOSQLSERVER"))
                {
                    SCON.Open();
                    SqlCommand sc = new SqlCommand("FormLoad", SCON);
                    sc.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(sc);
                    da.Fill(ds);
                    FillCombo(ds.Tables[0], ddlAddLedgerName);
                    FillCombo(ds.Tables[1], ddlAddSubledger);
                    FillCombo(ds.Tables[2], ddlTransType);

                }

            }
        }
        protected void FillCombo(DataTable dt, DropDownList ddl)
        {
            ddl.DataValueField = "ID";
            ddl.DataTextField = "NAME";
            ddl.DataSource = dt;
            ddl.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(ddlAddLedgerName.SelectedValue == "-1" && ddlAddSubledger.SelectedValue == "-1")
            {
                Response.Write("<script>alert('Select Valid Ledger or SubLedger Name');</script>");
            }

            if (ddlAddLedgerName.SelectedValue != "-1" && ddlAddSubledger.SelectedValue != "-1")
            {
                int UserID = Convert.ToInt32(Session["UserID"].ToString());
                DataTable ds = new DataTable();
                using (SqlConnection SCON = new SqlConnection(@"uid=sa;pwd=Welc0me;database=Cash;server=DESKTOP-C04IQTS\HOSQLSERVER"))
                {
                    SCON.Open();
                    SqlCommand sc = new SqlCommand("FinTrans_IU", SCON);
                    sc.CommandType = CommandType.StoredProcedure;
                    sc.Parameters.AddWithValue("@LedgerID", ddlAddLedgerName.SelectedValue);
                    sc.Parameters.AddWithValue("@SubLedgerID", ddlAddSubledger.SelectedValue);
                    sc.Parameters.AddWithValue("@TransTypeF", ddlTransType.SelectedValue);
                    sc.Parameters.AddWithValue("@Amount", Convert.ToInt32(txtAmount.Text));
                    sc.Parameters.AddWithValue("@Narration", txtRemarks.Text);
                    sc.Parameters.AddWithValue("@userID", UserID);
                    SqlDataAdapter da = new SqlDataAdapter(sc);
                    da.Fill(ds);
                    if (ds.Rows[0]["Result"].ToString() == "Saved Sucessfully")
                    {
                        Response.Write("<script>alert('Saved Successfully');</script>");
                        ddlAddLedgerName.SelectedValue = "-1";
                        ddlAddSubledger.SelectedValue = "-1";
                        txtRemarks.Text = txtAmount.Text ="";
                    }
                   
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Transaction.aspx");
        }

        protected void ddlAddLedgerName_Cahnged(object sender, EventArgs e)
        {
            
        }
    }
}