using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Configuration;

namespace MyKanBan.Source.DAL.Base
{
    public abstract class BaseDAL
    {
        protected static String ConnString = WebConfigurationManager.ConnectionStrings["KanBanConnStr"].ConnectionString;
    }
}
