//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace SchoolApp
//{
//    public partial class ReportViewer : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}

using System;
using System.Web.UI;
using Microsoft.Reporting.WebForms;
namespace SchoolApp
{
    public partial class ReportViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Remote;
                ReportViewer1.ServerReport.ReportServerUrl =
                    new Uri("http://laptop16:8084/ReportServer");

                // ✅ Update the correct report path
                ReportViewer1.ServerReport.ReportPath = "/UserList";


                ReportViewer1.ServerReport.Refresh();
            }
        }
    }
}

