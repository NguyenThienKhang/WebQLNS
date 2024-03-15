using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLNS
{
    public partial class qlPhongBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                foreach(ListItem item in ddlPhongBan.Items)
                {
                    if (item.Value == "1")
                    {
                        item.Selected = false;
                    }
                }
            }
        }
    }
}