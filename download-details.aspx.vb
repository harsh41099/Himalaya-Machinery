Imports System
Imports System.Data
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.IO

Partial Class download_details
    Inherits System.Web.UI.Page

    Dim FD As FrontDownload = New FrontDownload

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            'Download
            Dim DLID As Integer = Request.QueryString("dlid")

            If DLID > 0 Then
                BindDownload(DLID)
            End If

        End If

    End Sub

    Sub DownloadFilesForcefully(ByVal strPath As String, ByVal strFolderID As String, ByVal strFileName As String)

        If (strFileName <> "" And File.Exists(Server.MapPath(strPath))) Then
            Response.ContentType = "application/octet-stream"
            Response.AppendHeader("Content-Disposition", "attachment; filename=" & Replace(strFileName, " ", "") & "")
            Response.TransmitFile(Server.MapPath(strPath & ""))
            Response.End()
        End If

    End Sub

    Sub BindDownload(ByVal DLID As Integer)

        Dim DS As DataSet = FD.FrontDownload_SelectBy_DLID_DS(DLID)

        If DS.Tables(0).Rows.Count > 0 Then
            For i As Integer = 0 To DS.Tables(0).Rows.Count - 1

                'Response.Write(Server.MapPath("upload/download/attachment/" & DS.Tables(0).Rows(i).Item("DLID") & "/" & DS.Tables(0).Rows(i).Item("DL_Attachment") & ""))

                If File.Exists(Server.MapPath("upload/download/attachment/" & DS.Tables(0).Rows(i).Item("DLID") & "/" & DS.Tables(0).Rows(i).Item("DL_Attachment") & "")) Then
                    DownloadFilesForcefully("upload/download/attachment/" & DS.Tables(0).Rows(i).Item("DLID") & "/" & DS.Tables(0).Rows(i).Item("DL_Attachment"), DLID, DS.Tables(0).Rows(i).Item("DL_Attachment"))
                Else
                    lblError.Text = "<br />File Error. Please try after some time."
                End If
            Next
        End If

        DS.Clear()
        DS.Dispose()

    End Sub

End Class
