
Partial Class applications
    Inherits System.Web.UI.Page

    Private Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
    End Sub
End Class
