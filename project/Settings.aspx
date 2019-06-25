<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>הגדרות משחק</title>
        <link rel="shortcut icon" type="image/png" href="images/GameIcon.png"/>
<link rel="shortcut icon" type="image/png" href="http://example.com/favicon.png"/>
    <link href="styles/StyleSheet1.css" rel="stylesheet" />
        <!--הקוד שמפעיל את תפריט הניווט-->
    <script src="jscrips/myScript.js"></script>
    <script src="jscrips/createjs-2015.11.26.min.js"></script>
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
                    <li><a class="howToPlay" href="http://portelem.telem-hit.net/">פורטל"מ</a></li>
                </ul>
            </nav>
        </header>
                          <%--<div id="aboutDiv" class="popUp bounceInDown hide">
            <a class="closeAbout">X</a>
            <img id="about1" src="images/about.png" />
        </div>
        <div id="howToPlayDiv" class="popUp bounceInDown hide">
            <a class="closeHowToPlay">X</a>
            <img id="howPlay" src="images/howplay.png" />
            
        </div>--%>
            <div  id="settingDiv">
            <asp:Label ID="Label1" runat="server" Text="הגדרות משחק"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="שם משחק"></asp:Label>
            <br />
            <asp:TextBox ID="GameNameEdit" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:DropDownList ID="TimeList" runat="server"></asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="שמור ועבור לעריכת תוכן" OnClick="Button1_Click" />
            <br />
            <asp:Button ID="Button2" runat="server" Text="שמור" OnClick="Button2_Click" />
            <br />
            <asp:Button ID="Button3" runat="server" Text="בטל וחזור" OnClick="Button3_Click" />
                </div>
        </div>
    </form>
</body>
</html>
