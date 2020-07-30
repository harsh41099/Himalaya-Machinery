
Partial Class manufacturing_excellence
    Inherits System.Web.UI.Page

    Private Sub manufacturing_excellence_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            'Response.Write(Request.RawUrl.Split("?")(1))
            'Dim str As String = ""  'Request.UrlReferrer().ToString()

            'If str.Contains("index.aspx")
            '    Response.Write("<br>from index")
            '    hlTest.Focus() 
            'End If

        End If

    End Sub
End Class
