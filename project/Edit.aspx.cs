using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Edit : System.Web.UI.Page
{
    XmlDocument myDoc = new XmlDocument();
    protected void Page_init(object sender, EventArgs e)
    {
        myDoc.Load(MapPath("trees/XMLFile1.xml"));
        XmlNodeList myNodes;
        string theItemId = Session["theItemIdSession"].ToString();

        myNodes = myDoc.SelectNodes("//games/game[@id='" + theItemId + "']//question");
        foreach (XmlNode myNode in myNodes)
        {
            ListItem li = new ListItem();
            li.Text = myNode.Attributes["text"].Value;
            li.Value = myNode.Attributes["id"].Value;
            RadioButtonList1.Items.Add(li);
        }
        RadioButtonList1.DataBind();


        Label questionlbl = new Label();
        questionlbl.ID = "Questionlbl";
        questionlbl.Text = "הקלד שאלה";
        Panel1.Controls.Add(questionlbl);

        LiteralControl li7 = new LiteralControl("</br>");
        Panel1.Controls.Add(li7);

        TextBox question = new TextBox();
        question.ID = "Question";
        Panel1.Controls.Add(question);

        LiteralControl li8 = new LiteralControl("</br>");
        Panel1.Controls.Add(li8);

        Label anslbl = new Label();
        anslbl.ID = "Anslbllbl";
        anslbl.Text = "הקלד תשובות לשאלה";
        Panel1.Controls.Add(anslbl);

        LiteralControl li11 = new LiteralControl("</br>");
        Panel1.Controls.Add(li11);

        for (int i = 0; i < 4; i++)
        {
            if (i == 0)
            {
                Label RightAnsLBL = new Label();
                RightAnsLBL.ID = "RightAnslbl";
                RightAnsLBL.Text = "תשובה נכונה";
                Panel1.Controls.Add(RightAnsLBL);

                TextBox ans = new TextBox();
                ans.ID = "RightAns";
                Panel1.Controls.Add(ans);
            }
            else
            {
                LiteralControl li9 = new LiteralControl("</br>");
                Panel1.Controls.Add(li9);

                Label wrongAnsLBL = new Label();
                wrongAnsLBL.ID = "wrongAnslbl" + i;
                wrongAnsLBL.Text = "תשובה לא נכונה";
                Panel1.Controls.Add(wrongAnsLBL);

                TextBox ans = new TextBox();
                ans.ID = "Ans" + i;
                Panel1.Controls.Add(ans);
            }

        }

        LiteralControl li10 = new LiteralControl("</br>");
        Panel1.Controls.Add(li10);

        Button btn = new Button();
        btn.Text = "עדכן";
        btn.ID = "btn1";
        btn.Click += new EventHandler(Clickbtn);
        Panel1.Controls.Add(btn);

        Panel1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        myDoc.Load(Server.MapPath("trees/XMLFile1.xml"));
        string theItemId = Session["theItemIdSession"].ToString();
        XmlNode node = myDoc.SelectSingleNode("/games/game[@id='" + theItemId + "']");
        gameID.Text = Server.UrlDecode(node.SelectSingleNode("name").InnerText);

    }


    protected void Clickbtn(object sender, EventArgs e)
    {
        string theItemId = Session["theItemIdSession"].ToString();
        string selected = RadioButtonList1.SelectedValue;
        myDoc.SelectSingleNode("//games/game[@id='" + theItemId + "']/question[@id='" + selected + "']").Attributes["text"].Value = ((TextBox)FindControl("Question")).Text;
        myDoc.SelectSingleNode("//games/game[@id='" + theItemId + "']/question[@id='" + selected + "']/Ans[@cor='true']").InnerXml = ((TextBox)FindControl("RightAns")).Text;
        for (int i = 0; i < 4; i++)
        {
            myDoc.SelectSingleNode("//games/game[@id='" + theItemId + "']/question[@id='" + selected + "']/Ans[@cor='false']").InnerXml = ((TextBox)FindControl("Ans" + i)).Text;
        }
        myDoc.Save(Server.MapPath("trees/XMLFile1.xml"));
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string theItemId = Session["theItemIdSession"].ToString();
        string selected = RadioButtonList1.SelectedValue;
        XmlNodeList myNodes0;
        myNodes0 = myDoc.SelectNodes("//games/game[@id='" + theItemId + "']/question[@id='" + selected + "']");
        foreach (XmlNode myNode in myNodes0)
        {
            ((TextBox)FindControl("Question")).Text = myNode.InnerXml;
        }
        XmlNodeList myNodes1;
        myNodes1 = myDoc.SelectNodes("//games/game[@id='" + theItemId + "']/question[@id='" + selected + "']/Ans[@cor='true']");
        foreach (XmlNode myNode in myNodes1)
        {
            ((TextBox)FindControl("RightAns")).Text = myNode.InnerXml;
        }
        XmlNodeList myNodes2;
        myNodes2 = myDoc.SelectNodes("//games/game[@id='" + theItemId + "']/question[@id='" + selected + "']/Ans[@cor='false']");
        int counter = 0;
        foreach (XmlNode myNode in myNodes2)
        {
            counter++;
            ((TextBox)FindControl("Ans" + counter)).Text = myNode.InnerXml;
        }
    }
}