using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HMKanBan.Source.Entity;
using HMKanBan.Source.BL;
using HMKanBan.Source.View;
using System.Text;

namespace HMKanBan
{
    public partial class KanBan_Rpt_Cycle_Status : System.Web.UI.Page
    {
        #region "Member"
        public static readonly String CYCLE_COLUMN = "cycle";
        public static readonly String CYCLE_COLUMN_LABEL = "Cycle";
        public static readonly String IN_COLUMN = "in";
        public static readonly String IN_COLUMN_LABEL = "Create";
        public static readonly String OUT_COLUMN = "out";
        public static readonly String OUT_COLUMN_LABEL = "Remove";
        public static readonly String INVENTORY_COLUMN = "inv";
        public static readonly String INVENTORY_COLUMN_LABEL = "Remain";
        public static readonly String FIRE_COLUMN = "n";
        public static readonly String FIRE_COLUMN_LABEL = "New";
        public static readonly String RESOLVE_COLUMN = "r";
        public static readonly String RESOLVE_COLUMN_LABEL = "Resolve";

        public static readonly String CHART_TYPE = "line";
        public static readonly String CALLBACK_FUNC = "cycle_callback";
        public static readonly String CALLBACK_CU_FUNC = "cycle_cu_callback";
        public static readonly String CHART_WIDTH = "700";
        public static readonly String CHART_HEIGHT = "300";

        public String UserName
        {
            get { return ((SiteMaster)this.Master).UserName; }
        }
        public String UserDomain
        {
            get { return ((SiteMaster)this.Master).UserDomain; }
        }
        public KanBan KanBanObj
        {
            set { ViewState["VS_KanBan"] = value; }
            get { return (KanBan)ViewState["VS_KanBan"]; }
        }
        public Cycle CurrentCycle
        {
            set { ViewState["VS_Cycle"] = value; }
            get { return (Cycle)ViewState["VS_Cycle"]; }
        }
        public CyclePeriod CurrentCyclePeriod
        {
            set { ViewState["VS_CyclePeriod"] = value; }
            get { return (CyclePeriod)ViewState["VS_CyclePeriod"]; }
        }
        public List<CyclePeriod> PeriodList
        {
            set { ViewState["VS_PeriodList"] = value; }
            get { return (List<CyclePeriod>)ViewState["VS_PeriodList"]; }
        }
        #endregion

        #region "Events"
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((SiteMaster)this.Master).RPT_CYCLE_STYLE = "menuitem_sel";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Init();
            }
            ((SiteMaster)this.Master).KanBanObj = KanBanObj;

        }

        protected void DDLSelect_Change(object sender, EventArgs e)
        {
            RefreshData();
            RefreshDataCu();
        }

        protected void CHKSelect_Change(object sender, EventArgs e)
        {
            RefreshConfig();
            RefreshData();
        }

        protected new void Init()
        {
            Int64 nID;
            CyclePeriod objStartPeriod, objEndPeriod;

            if (String.IsNullOrEmpty(Request.Params["ID"]) ||
                !Int64.TryParse(Request.Params["ID"], out nID))
            {
                nID = 1;
            }
            KanBanObj = KanBanBL.GetKanBan(nID);
            KanBanBL.InitUserList(KanBanObj.ID);
            CurrentCycle = KanBanBL.GetDefaultCycle(KanBanObj.ID);
            CurrentCyclePeriod = KanBanBL.GetCurrentCyclePeriod(KanBanObj.ID, CurrentCycle.ID);
            objStartPeriod = KanBanBL.GetCyclePeriod(KanBanObj.ID, CurrentCycle.ID, DateTime.Now.AddMonths(-4));
            objEndPeriod = KanBanBL.GetCyclePeriod(KanBanObj.ID, CurrentCycle.ID, DateTime.Now);

            PeriodList = KanBanBL.GetAllPeriod(KanBanObj.ID, CurrentCycle.ID);
            ddlStart.DataSource = PeriodList;
            ddlStart.DataBind();
            ddlEnd.DataSource = PeriodList;
            ddlEnd.DataBind();

            ddlStart.SelectedValue = objStartPeriod.ID.ToString();
            ddlEnd.SelectedValue = objEndPeriod.ID.ToString();

            RefreshConfig();
            RefreshData();
            RefreshConfigCu();
            RefreshDataCu();
        }
        #endregion

        #region "Chart"
        protected void RefreshConfig()
        {
            String strTemplate = @"<charts><chart><chartType>{0}</chartType><callback>{1}</callback><width>{2}</width><height>{3}</height><measures><default>{4}</default>{5}</measures><dimensions default=""{6}"">{7}</dimensions><props>{8}</props></chart></charts>";
            String strFieldTemplate = @"<field>{0}</field>";
            String strDimTemplate = @"<field><column>{0}</column><name>{1}</name></field>";
            String strPropTemplate = @"<prop><key>{0}</key><value>{1}</value></prop>";
            StringBuilder sbFields = new StringBuilder();
            StringBuilder sbDim = new StringBuilder();
            StringBuilder sbMeasure = new StringBuilder();
            StringBuilder sbProp = new StringBuilder();

            // fields
            if (chkInventory.Checked)
            {
                sbFields.Append(String.Format(strFieldTemplate, INVENTORY_COLUMN));
            }
            if (chkIn.Checked)
            {
                sbFields.Append(String.Format(strFieldTemplate, IN_COLUMN));
            }
            if (chkOut.Checked)
            {
                sbFields.Append(String.Format(strFieldTemplate, OUT_COLUMN));
            }
            // dimensions
            sbDim.Append(String.Format(strDimTemplate, CYCLE_COLUMN, CYCLE_COLUMN_LABEL));
            // measures
            sbMeasure.Append(String.Format(strDimTemplate, INVENTORY_COLUMN, INVENTORY_COLUMN_LABEL));
            sbMeasure.Append(String.Format(strDimTemplate, IN_COLUMN, IN_COLUMN_LABEL));
            sbMeasure.Append(String.Format(strDimTemplate, OUT_COLUMN, OUT_COLUMN_LABEL));
            // Props
            sbProp.Append(String.Format(strPropTemplate, "StackType", "stacked"));
            sbProp.Append(String.Format(strPropTemplate, "FormType", "segment"));

            hidConfig.Value = String.Format( strTemplate
                ,CHART_TYPE
                ,CALLBACK_FUNC
                ,CHART_WIDTH
                ,CHART_HEIGHT
                ,sbFields.ToString()
                ,sbMeasure.ToString()
                ,CYCLE_COLUMN
                ,sbDim.ToString()
                ,sbProp.ToString()
                );
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "RefreshConfig",
                        "RefreshChart();",
                        true);
        }

        protected void RefreshData()
        {
            Int64 nFrom, nTo;
            nFrom = Convert.ToInt64(ddlStart.SelectedValue);
            nTo = Convert.ToInt64(ddlEnd.SelectedValue);
            List<StoryPeriodStatusVO> lstStatus = KanBanBL.GetPeriodStatus(KanBanObj.ID, CurrentCycle.ID, nFrom, nTo);
            
            String strTemplate = @"<charts><chart>{0}</chart></charts>";
            String strDataTemplate = @"<d><cycle>{0}</cycle><inv>{1}</inv><in>{2}</in><out>{3}</out><pid>{4}</pid></d>";
            StringBuilder sb = new StringBuilder();

            foreach(StoryPeriodStatusVO status in lstStatus)
            {
                sb.Append(String.Format(strDataTemplate, 
                    GetCyclePeriodName(status.CycleID),
                    status.InventoryNum.ToString(), 
                    status.IncomeNum.ToString(),
                    status.OutcomeNum.ToString(),
                    status.CycleID.ToString()));
            }

            hidData.Value = String.Format(strTemplate, sb.ToString());

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "RefreshChartData",
                        "RefreshChartData();",
                        true);
        }

        protected void RefreshConfigCu()
        {
            String strTemplate = @"<charts><chart><chartType>{0}</chartType><callback>{1}</callback><width>{2}</width><height>{3}</height><measures><default>{4}</default>{5}</measures><dimensions default=""{6}"">{7}</dimensions><props>{8}</props></chart></charts>";
            String strFieldTemplate = @"<field>{0}</field>";
            String strDimTemplate = @"<field><column>{0}</column><name>{1}</name></field>";
            String strPropTemplate = @"<prop><key>{0}</key><value>{1}</value></prop>";
            StringBuilder sbFields = new StringBuilder();
            StringBuilder sbDim = new StringBuilder();
            StringBuilder sbMeasure = new StringBuilder();
            StringBuilder sbProp = new StringBuilder();

            // fields
            sbFields.Append(String.Format(strFieldTemplate, FIRE_COLUMN));
            sbFields.Append(String.Format(strFieldTemplate, RESOLVE_COLUMN));
            // dimensions
            sbDim.Append(String.Format(strDimTemplate, CYCLE_COLUMN, CYCLE_COLUMN_LABEL));
            // measures
            sbMeasure.Append(String.Format(strDimTemplate, FIRE_COLUMN, FIRE_COLUMN_LABEL));
            sbMeasure.Append(String.Format(strDimTemplate, RESOLVE_COLUMN, RESOLVE_COLUMN_LABEL));
            // Props
            sbProp.Append(String.Format(strPropTemplate, "StackType", "stacked"));
            sbProp.Append(String.Format(strPropTemplate, "FormType", "segment"));

            hidConfigCu.Value = String.Format(strTemplate
                , CHART_TYPE
                , CALLBACK_CU_FUNC
                , CHART_WIDTH
                , CHART_HEIGHT
                , sbFields.ToString()
                , sbMeasure.ToString()
                , CYCLE_COLUMN
                , sbDim.ToString()
                , sbProp.ToString()
                );
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "RefreshConfigCu",
                        "RefreshChartCu();",
                        true);
        }

        protected void RefreshDataCu()
        {
            Int64 nFrom, nTo;
            nFrom = Convert.ToInt64(ddlStart.SelectedValue);
            nTo = Convert.ToInt64(ddlEnd.SelectedValue);
            List<StoryPeriodStatusVO> lstStatus = KanBanBL.GetPeriodStatus(KanBanObj.ID, CurrentCycle.ID, nFrom, nTo);

            String strTemplate = @"<charts><chart>{0}</chart></charts>";
            String strDataTemplate = @"<d><cycle>{0}</cycle><n>{1}</n><r>{2}</r><pid>{3}</pid></d>";
            StringBuilder sb = new StringBuilder();

            foreach (StoryPeriodStatusVO status in lstStatus)
            {
                sb.Append(String.Format(strDataTemplate,
                    GetCyclePeriodName(status.CycleID),
                    status.IncomeNumCu.ToString(),
                    status.OutcomeNumCu.ToString(),
                    status.CycleID.ToString()));
            }

            hidDataCu.Value = String.Format(strTemplate, sb.ToString());

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(),
                        "RefreshChartDataCu",
                        "RefreshChartDataCu();",
                        true);
        }
        #endregion

        #region "util"
        protected String GetCyclePeriodName(Int64 nCyclePeriod)
        {
            foreach(CyclePeriod period in PeriodList)
            {
                if (period.ID == nCyclePeriod) { return period.Name; }
            }
            return "";
        }
        #endregion
    }
}