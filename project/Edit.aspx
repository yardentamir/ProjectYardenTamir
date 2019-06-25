<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>עריכת משחק</title>
        <link rel="shortcut icon" type="image/png" href="images/GameIcon.png"/>
<link rel="shortcut icon" type="image/png" href="http://example.com/favicon.png"/>
    <link href="styles/StyleSheet1.css" rel="stylesheet" />
        <!--הקוד שמפעיל את תפריט הניווט-->
    <script src="jscrips/myScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                                <header>
            <!--קישור לדף עצמו כדי להתחיל את המשחק מחדש בלחיצה על הלוגו-->
            <a href="createGames.aspx">
                <img id="logo" src="images/GameIcon.png" />
                <p>מכונת הדובונים</p>
            </a>
            <!--תפריט הניווט בראש העמוד-->
            <nav>
                <ul>
                    <li><a class="about">אודות</a></li>
                    <li><a class="howToPlay">הוראות</a></li>
                    <li><a class="howToPlay">משחק</a></li>
                    <li><a class="howToPlay">עורך</a></li>
                </ul>
            </nav>
        </header>
<%--                          <div id="aboutDiv" class="popUp bounceInDown hide">
            <a class="closeAbout">X</a>
            <img id="about1" src="images/about.png" />
        </div>
        <div id="howToPlayDiv" class="popUp bounceInDown hide">
            <a class="closeHowToPlay">X</a>
            <img id="howPlay" src="images/howplay.png" />
            
        </div>--%>

            <div class="grid-container">
  <div class="item1">Main</div>  
  <div class="item2">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1">
                          <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
      </asp:GridView>
      <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/trees/XMLFile1.xml" XPath="//games/game[@id='&quot;+theItemId+&quot;']//question"></asp:XmlDataSource>
  </div>
  <div class="item3">Footer</div>
</div>
                        עמוד עריכה
            <asp:Label ID="gameID" runat="server" Text=""></asp:Label>
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" ></asp:RadioButtonList>
            <asp:Panel ID="Panel1" runat="server"></asp:Panel>
        </div>
    </form>
</body>
</html>
