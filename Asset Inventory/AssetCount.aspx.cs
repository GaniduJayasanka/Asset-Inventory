using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Asset_Inventory
{
    public partial class AssetCount : System.Web.UI.Page
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
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string regNum = txtRegNo.Text.Trim();
            if (!string.IsNullOrEmpty(regNum))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("SP_GetAssetsByRegNum", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RegNum", regNum);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewAsset.DataSource = dt;
                    GridViewAsset.DataBind();
                }
            }
        }


    }
}
