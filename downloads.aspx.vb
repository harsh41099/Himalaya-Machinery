Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Math

Partial Class downloads_dynamic
    Inherits System.Web.UI.Page

    Dim FD As FrontDownload= New FrontDownload
    Dim CF As CommonFunctionsCls = New CommonFunctionsCls

     Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            BindDownloads()
           
        End If

    End Sub

      Sub BindDownloads()

        Dim DS As DataSet = FD.FrontDownload_DownloadSelectAll()
        If DS.Tables(0).Rows.Count > 0 Then
            rpDownloads.DataSource = DS
            rpDownloads.DataBind()
        End If

        DS.Clear()
        DS.Dispose()

    End Sub

    Function FormatText(ByVal str As String) As String

        Return CF.ReverseReplaceStr(str)

    End Function

End Class
