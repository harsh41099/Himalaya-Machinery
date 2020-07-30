Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Math
Imports System.Text.RegularExpressions

Partial Class news_events_dynamic
    Inherits System.Web.UI.Page

    Public Counter As Integer
    Public ThumbImg As String

    Dim FN As FrontNews = New FrontNews
    Dim CF As CommonFunctionsCls = New CommonFunctionsCls

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            BindNews()

        End If

    End Sub

    Sub BindNews()

        Dim DS As DataSet = FN.FrontNews_SelectAll()
        LVMedia.DataSource = DS
        LVMedia.DataBind()

        DS.Clear()
        DS.Dispose()

    End Sub

    Protected Sub OnPagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)

        TryCast(LVMedia.FindControl("DataPager1"), DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, False)
        Me.BindNews()

    End Sub

    Public Function OpenFirstPanel(ByVal strCondPara As String) As String

        Dim strRtrnPara As String = ""

        Counter = Counter + 1

        If strCondPara = "first" Then
            If Counter = 1 Then
                strRtrnPara = "active"
            End If

        ElseIf strCondPara = "second" Then
            If Counter = 2 Then
                strRtrnPara = "in"
            End If
        End If

        Return strRtrnPara

    End Function

    Public Function ShowHideTextImagePanel(ByVal strNWID As String, ByVal strNW_ThumbImg As String, ByVal strCondPara As String) As String

        Dim strRtrnPara As String = ""

        If strNW_ThumbImg <> "" Then
            If File.Exists(Server.MapPath("upload/news/thumb/" & strNWID & "/" & strNW_ThumbImg)) Then
                strRtrnPara = "upload/news/thumb/" & strNWID & "/" & strNW_ThumbImg
            End If
        End If

        If Len(strRtrnPara) > 0 Then
            If strCondPara = "display-text" Then
                strRtrnPara = "false"
            ElseIf strCondPara = "display-text-image" Then
                strRtrnPara = "true"
            End If

        Else
            If strCondPara = "display-text" Then
                strRtrnPara = "true"
            ElseIf strCondPara = "display-text-image" Then
                strRtrnPara = "false"
            End If
        End If

        Return strRtrnPara

    End Function

    Public Function BindNewsDownloadDataset(ByVal NewsID As Integer) As DataSet

        Dim DS = FN.FrontNewsDownload_SelectBy_NWID(NewsID)

        Return DS

    End Function

    Public Function FormatText(ByVal str As String) As String

        Dim regex = New Regex("atul", RegexOptions.IgnoreCase)

        str = regex.Replace(str, "<span class='atul'>Atul</span>")

        'str = str.ToLower.Replace("atul", "<span class='atul'>Atul</span>")

        Return CF.ReverseReplaceStr(str)

    End Function

End Class
