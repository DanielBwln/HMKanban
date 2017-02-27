using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MyKanBan.Source.Entity;
using MyKanBan.Source.BL;

namespace MyKanBan.Source.Util
{
    public class KanBanUtil
    {
        public static String SESSION_SYSUSER = "SESSION_SYSUSER";
        public static String PRIOR_LEGEND = @"
            <div class=""kanbanTitle_legendItem"" style=""background-color:#E51400;"">&nbsp;</div>
            <h1 style=""color:#E51400;"">P0/P1</h1>
            <div class=""kanbanTitle_legendItem"" style=""background-color:#F09609;"">&nbsp;</div>
            <h1 style=""color:#F09609;"">P2</h1>
            <div class=""kanbanTitle_legendItem"" style=""background-color:#1BA1E2;"">&nbsp;</div>
            <h1 style=""color:#1BA1E2;"">P3</h1>
            <div class=""kanbanTitle_legendItem"" style=""background-color:#96B232;"">&nbsp;</div>
            <h1 style=""color:#96B232;"">P4</h1>
        ";
        public static String STATUS_LEGEND = @"
            <div class=""kanbanTitle_legendItem"" style=""background-color:#1BA1E2;"">&nbsp;</div>
            <h1 style=""color:#1BA1E2;"">In Progress</h1>
            <div class=""kanbanTitle_legendItem"" style=""background-color:#F09609;"">&nbsp;</div>
            <h1 style=""color:#F09609;"">Pending</h1>
            <div class=""kanbanTitle_legendItem"" style=""background-color:#E51400;"">&nbsp;</div>
            <h1 style=""color:#E51400;"">Blocking</h1>
            <div class=""kanbanTitle_legendItem"" style=""background-color:#96B232;"">&nbsp;</div>
            <h1 style=""color:#96B232;"">Ready</h1>
            <div class=""kanbanTitle_legendItem"" style=""background-color:#898989;"">&nbsp;</div>
            <h1 style=""color:#898989;"">Queue</h1>
        ";
        public static Control FindControlRecursive(Control Root, string Id)
        {
            if (Root.ID == Id)
                return Root;

            foreach (Control Ctl in Root.Controls)
            {
                Control FoundCtl = FindControlRecursive(Ctl, Id);
                if (FoundCtl != null)
                    return FoundCtl;
            }

            return null;
        }

        public static String HTML2Text(String _source){
            String strHtml = _source;
            strHtml = System.Text.RegularExpressions.Regex.Replace(strHtml, @"<( )*p([^>])*>", "\r\r", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            strHtml = System.Text.RegularExpressions.Regex.Replace(strHtml, @"&nbsp;", " ", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            strHtml = System.Text.RegularExpressions.Regex.Replace(strHtml, @"&(.{2,6});", string.Empty, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            strHtml = System.Text.RegularExpressions.Regex.Replace(strHtml, @"<[^>]*>", string.Empty, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            return strHtml;
        }

        public static String GetTicketStyleByStatus(Story objStory)
        {
            switch (objStory.StoryType)
            {
                case Story.StoryTypeEnum.InProgress:
                    return "StoryDiv_InProgress";
                case Story.StoryTypeEnum.Pending:
                    return "StoryDiv_Pending";
                case Story.StoryTypeEnum.Blocking:
                    return "StoryDiv_Blocking";
                case Story.StoryTypeEnum.Ready:
                    return "StoryDiv_Finished";
                case Story.StoryTypeEnum.Queue:
                    return "StoryDiv_Removed";
                default:
                    return "StoryDiv_InProgress";
            }
        }

        public static String GetTicketStyleByPrior(Story objStory)
        {
            switch (objStory.Prior)
            {
                case Story.PriorEnum.P0:
                    return "StoryDiv_Blocking";
                case Story.PriorEnum.P1:
                    return "StoryDiv_Blocking";
                case Story.PriorEnum.P2:
                    return "StoryDiv_Pending";
                case Story.PriorEnum.P3:
                    return "StoryDiv_InProgress";
                case Story.PriorEnum.P4:
                    return "StoryDiv_Finished";
                default:
                    return "StoryDiv_Finished";
            }
        }

        public static String GetTicketStyle(String strAlias, Story objStory)
        {
            SYSUser objUser = (SYSUser)HttpContext.Current.Session[SESSION_SYSUSER];

            if (objUser == null || objUser.Alias != strAlias)
            {
                if (strAlias != SYSUser.GUEST_USER)
                {
                    objUser = KanBanBL.GetSYSUser(strAlias);
                }
                else
                {
                    objUser = new SYSUser();
                    objUser.Alias = SYSUser.GUEST_USER;
                }
                HttpContext.Current.Session[SESSION_SYSUSER] = objUser;
            }

            switch(objUser.ConfigTicketColor)
            {
                case SYSUser.ConfigTicketColorEnum.Stauts:
                    return GetTicketStyleByStatus(objStory);
                case SYSUser.ConfigTicketColorEnum.Prior:
                    return GetTicketStyleByPrior(objStory);
                default:
                    return GetTicketStyleByStatus(objStory);

            }
        }

        public static String GetTicketStyleLegend(String strAlias)
        {
            SYSUser objUser = (SYSUser)HttpContext.Current.Session[SESSION_SYSUSER];

            if (objUser == null || objUser.Alias != strAlias)
            {
                if (strAlias != SYSUser.GUEST_USER)
                {
                    objUser = KanBanBL.GetSYSUser(strAlias);
                }
                else
                {
                    objUser = new SYSUser();
                    objUser.Alias = SYSUser.GUEST_USER;
                }
                HttpContext.Current.Session[SESSION_SYSUSER] = objUser;
            }

            switch (objUser.ConfigTicketColor)
            {
                case SYSUser.ConfigTicketColorEnum.Stauts:
                    return STATUS_LEGEND;
                case SYSUser.ConfigTicketColorEnum.Prior:
                    return PRIOR_LEGEND;
                default:
                    return STATUS_LEGEND;

            }
        }
    }
}