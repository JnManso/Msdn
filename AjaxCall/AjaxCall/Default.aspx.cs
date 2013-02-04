using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AjaxCall
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, XmlSerializeString = true, UseHttpGet = false)]
        public static string[] GetServerValues(string txtValue)
        {
            return new[]{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), "Powered by João Manso"};
        }
    }
}