using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace Default
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public int Insertdata(Models.ToicMatrix tObj)
        {
            string msg = "";
            SqlConnection con = new SqlConnection("Data Source =(localdb)MSSQLLocalDB; Initial Catalog = GradingDB; Integrated Security = true");
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = @"usp_AddTopicMatrix ";
            cmd.Parameters.AddWithValue("@Topic", tObj.TopicName);
            cmd.Parameters.AddWithValue("@Basic", tObj.Basic);
            cmd.Parameters.AddWithValue("@Intermediate", tObj.Intermediate);
            cmd.Parameters.AddWithValue("@Expert", tObj.Expert);
            cmd.Parameters.AddWithValue("@Marks", tObj.Marks);
            cmd.Parameters.AddWithValue("@TopicImp", tObj.Improvements);
            cmd.Parameters.AddWithValue("@Topicstr", tObj.Strengths);
            cmd.Parameters.AddWithValue("@ModuleName", tObj.ModuleName);
            cmd.Parameters.AddWithValue("@psno", tObj.PSNumber);

            con.Open();
            /*
             if (i == 1)
             {
                 msg = "true";
             }
             else
             {
                 msg = "false";
             }

             return msg;*/

            int i = cmd.ExecuteNonQuery();
            return i;

        }
    }
}