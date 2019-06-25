<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>יצירת משחק</title>
    <link rel="shortcut icon" type="image/png" href="images/GameIcon.png"/>
<link rel="shortcut icon" type="image/png" href="http://example.com/favicon.png"/>
    <link href="styles/StyleSheet1.css" rel="stylesheet" />
        <script src="jscrips/jquery-1.12.0.min.js"></script>
    <script src="jscrips/JavaScript.js"></script>
    <style type="text/css">
        .CharacterCount {}
    </style>
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
                                          <li><a class="howToPlay" href="http://portelem.telem-hit.net/">פורטל"מ</a></li>
                    <li><a class="about">אודות</a></li>
                    <li><a class="howToPlay">הוראות</a></li>
                    <li><a class="howToPlay">משחק</a></li>
                    <li><a class="howToPlay">עורך</a></li>
                </ul>
            </nav>
        </header>
              <div id="aboutDiv" class="popUp bounceInDown hide">
            <a class="closeAbout">X</a>
            <img id="about1" src="images/about.png" />
        </div>
        <div id="howToPlayDiv" class="popUp bounceInDown hide">
            <a class="closeHowToPlay">X</a>
            <img id="howPlay" src="images/howplay.png" />
            
        </div>
            <div id="Container">
                <h3>&nbsp;הזן שם למשחק חדש (2-30 תווים)</h3>
  <asp:TextBox ID="TextBox1" item="1" CharacterLimit="30" CssClass="CharacterCount" runat="server" Height="37px" Width="368px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/add.png" OnClick="ImageButton1_Click1" />
            <br />
            <asp:Label ID="LabelCounter1" runat="server" Text="0/30"></asp:Label>  
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="XmlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" Height="107px" Width="957px">
<Columns>
    <asp:TemplateField HeaderText="שם משחק">
	<ItemTemplate>
		<asp:Label ID="NameLabel" runat="server" Text='<%# Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "name").ToString())%>' > </asp:Label>
	</ItemTemplate>
</asp:TemplateField>
                <asp:TemplateField HeaderText="קוד משחק">
	<ItemTemplate>
		<asp:Label ID="idLabel" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "@id")%>'> </asp:Label>
	</ItemTemplate>
</asp:TemplateField>
                    <asp:TemplateField HeaderText="שאלות">
	<ItemTemplate>
		<asp:Label ID="QuestionLBL" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "@id")%>'> </asp:Label>
	</ItemTemplate>
</asp:TemplateField>
                    <asp:TemplateField HeaderText="הגדרות">
	<ItemTemplate>
			<asp:ImageButton ID="settingsImageButton" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id")%>' runat="server" ImageUrl="~/images/gear2.png" CommandName="settingsRow"  />
	</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="עריכה">
	<ItemTemplate>
		<asp:ImageButton ID="editImageButton" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id")%>' runat="server" ImageUrl="~/images/edit.png" CommandName="editRow" />
	</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="מחיקה">
	<ItemTemplate>
		<asp:ImageButton ID="deleteImageButton" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id")%>' runat="server" ImageUrl="~/images/delete.png" CommandName="deleteRow" />
	</ItemTemplate>
</asp:TemplateField>
                    <asp:TemplateField HeaderText="פורסם">
       <ItemTemplate>
           <asp:CheckBox ID="isPassCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="isPassCheckBox_CheckedChanged1" class='<%#CheckIfCanPublish(XPathBinder.Eval(Container.DataItem,"@id").ToString())%>' Checked='<%#Convert.ToBoolean(XPathBinder.Eval(Container.DataItem,"@isPub"))%>' theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id")%>' />
       </ItemTemplate>
</asp:TemplateField>
             </Columns>      
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#84625a" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#010066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/trees/XMLFile1.xml" XPath="/games/game"></asp:XmlDataSource>
        </div>
            </div>
    </form>
</body>
</html>

