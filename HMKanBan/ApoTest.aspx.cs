using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HMKanBan.Source.BL;
using HMKanBan.Source.Entity;
using HMKanBan.Source.DAL;

namespace HMKanBan
{
    public partial class ApoTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateKanBanList();
                UpdateCycleList();
                UpdatePeriodList();
            }
        }

        protected void UpdateKanBanList()
        {
            List<KanBan> lstKanBan = KanBanBL.ListKanBan();
            ddlKanBan.DataSource = lstKanBan;
            ddlKanBan.DataBind();

            if (lstKanBan.Count > 0)
            {
                ddlKanBan.SelectedIndex = 0;
            }
        }

        protected void UpdateCycleList()
        {
            Int64 nKanBan = Convert.ToInt64(ddlKanBan.SelectedValue);
            List<Cycle> lstCycle = KanBanBL.ListCycleByKanBan(nKanBan);
            ddlCycle.DataSource = lstCycle;
            ddlCycle.DataBind();

            if (lstCycle.Count > 0)
            {
                ddlCycle.SelectedIndex = 0;
            }
        }

        protected void UpdatePeriodList()
        {
            Int64 nCycle = Convert.ToInt64(ddlCycle.SelectedValue);
            List<CyclePeriod> lstPeriod = KanBanBL.ListCyclePeriodByCycle(nCycle);
            ddlPeriod.DataSource = lstPeriod;
            ddlPeriod.DataBind();

            if (lstPeriod.Count > 0)
            {
                ddlPeriod.SelectedIndex = 0;
            }
        }

        protected void ddlKanBan_Change(object sender, EventArgs e)
        {
            UpdateCycleList();
            UpdatePeriodList();
        }

        protected void ddlCycle_Change(object sender, EventArgs e)
        {
            UpdatePeriodList();
        }

        protected void btnPeriod_Click(object sender, EventArgs e)
        {
            Int64 nKanBan = Convert.ToInt64(ddlKanBan.SelectedValue);
            Int64 nCycle = Convert.ToInt64(ddlCycle.SelectedValue);
            Int64 nPeriod = Convert.ToInt64(ddlPeriod.SelectedValue);
            KanBanBL.GenerateCycleStatus(nKanBan, nPeriod);
        }

        protected void btnAllPeriod_Click(object sender, EventArgs e)
        {
            Int64 nKanBan = Convert.ToInt64(ddlKanBan.SelectedValue);
            Int64 nCycle = Convert.ToInt64(ddlCycle.SelectedValue);
            List<CyclePeriod> lst = KanBanBL.ListCyclePeriodByCycle(nCycle);
            foreach(CyclePeriod period in lst)
            {
                KanBanBL.GenerateCycleStatus(nKanBan,period.ID);
            }
        }

        protected void btnCreateFakeLog_Click(object sender, EventArgs e)
        {
            ApoDAL.CreateFakeLog();
        }
    }
}