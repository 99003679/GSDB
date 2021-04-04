using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using Models;
namespace DemoRubric
{
    public partial class Rubric : System.Web.UI.Page
    {
        [WebMethod]
        [ScriptMethod]
        public static void SaveUser(ToicMatrix user)
        {
            string constr = ConfigurationManager.ConnectionStrings["GSDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("usp_AddTopicMatrix"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Topic", user.TopicName);
                    cmd.Parameters.AddWithValue("@Basic", user.Basic);
                    cmd.Parameters.AddWithValue("@Intermediate", user.Intermediate);
                    cmd.Parameters.AddWithValue("@Expert", user.Expert);
                    cmd.Parameters.AddWithValue("@ModuleName", user.ModuleName);
                    cmd.Parameters.AddWithValue("@PsNumber", user.PSNumber);
                    cmd.Parameters.AddWithValue("@TopicImp", user.Improvements);
                    cmd.Parameters.AddWithValue("@Topicstr", user.Strengths);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }









    }
}