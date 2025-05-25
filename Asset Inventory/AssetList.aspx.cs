using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Asset_Inventory
{
    public partial class AssetList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewAsset.DataSource = null;
                GridViewAsset.DataBind();
            }
        }

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        protected void btnView_Click(object sender, EventArgs e)
        {
            string startDate = txtStartDate.Text;
            string endDate = txtEndDate.Text;

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                BindGrid(Convert.ToDateTime(startDate), Convert.ToDateTime(endDate));
            }
        }

        private void BindGrid(DateTime startDate, DateTime endDate)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SP_GetAssetsByDateRange", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewAsset.DataSource = dt;
                    GridViewAsset.DataBind();
                }
            }
        }

        protected decimal totalQty = 0;
        protected int physicalCountTotal = 0;
        protected int notVerifiedTotal = 0;

        protected void GridViewAsset_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Sum QTY
                totalQty += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "QTY") ?? 0);

                // Count where physical_count == 1
                int physical = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "physical_count") ?? 0);
                if (physical == 1) physicalCountTotal++;

                // Count where Not_verified == 1
                int notVerified = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Not_verified") ?? 0);
                if (notVerified == 1) notVerifiedTotal++;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                // Find and set footer labels
                ((Label)e.Row.FindControl("lblTotalQty")).Text = "Total: " + totalQty.ToString("0");
                ((Label)e.Row.FindControl("lblPhysicalCountTotal")).Text = "Count: " + physicalCountTotal;
                ((Label)e.Row.FindControl("lblNotVerifiedTotal")).Text = "Count: " + notVerifiedTotal;
            }
        }

    }
}
