using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] nametime = new string[] { "ללא הגבלה", "10 שניות", "20 שניות", "30 שניות" };
        for (int i = 0; i < nametime.Length; i++)
        {
            ListItem li = new ListItem();
            li.Text = nametime[i];
            li.Value = i.ToString();
            TimeList.Items.Add(li);
        }
        TimeList.DataBind();

    }
    //שמור ועבור לעריכת השאלות- עובר לדף עריכה
    protected void Button1_Click(object sender, EventArgs e)
    {
        XmlDocument myDoc = new XmlDocument();
        myDoc.Load(MapPath("trees/XMLFile1.xml"));
        string theItemId = Session["theItemIdSession"].ToString();
        XmlNode myNodes = myDoc.SelectSingleNode("/games/game[@id='" + theItemId + "'][@name]");

        foreach (XmlNode myNode in myNodes)
        {
            GameNameEdit.Text += myNode.InnerXml;
        }

    }
    //שמור- חוזר לדף המשחקים שלי
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    //בטל וחזור - חוזר לדף המשחקים שלי
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
}