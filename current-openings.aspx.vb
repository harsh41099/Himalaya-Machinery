Imports System
Imports System.IO
Imports System.Data
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Net.Mail

Partial Class current_openings_dynamic_aspx
    Inherits System.Web.UI.Page

    Public Counter, CounterReturn As Integer

    Dim CF As CommonFunctionsCls = New CommonFunctionsCls
    Dim CR As Front_Career = New Front_Career

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Cache.SetCacheability(HttpCacheability.NoCache)

        If Not IsPostBack Then

            FillPosotion()

        End If

    End Sub

    Sub FillPosotion()

        Dim DS As DataSet = CR.Front_Career_Listing_All()
        rpPosition.DataSource = DS
        rpPosition.DataBind()

        If DS.Tables(0).Rows.Count > 0 Then
            lblErrorMessage.Text = ""
        Else
            lblErrorMessage.Text = "There are no current openings, please check back soon."
        End If

        DS.Clear()
        DS.Dispose()

    End Sub

    Function FormatCareerData(ByVal strField As String, ByVal strData As String) As String

        Dim RtrnPara As String = ""

        strData = Trim(strData)

        If Not (strData = "" Or strData = "<br>" Or strData = "<br/>" Or strData = "<br />" Or strData = "&nbsp;<br />" Or strData = "&nbsp;<br />&nbsp;" Or strData = "&nbsp;") Then
            RtrnPara = "<tr><td>" & strField & "</td><td>" & strData & "</td></tr>"
        End If

        Return RtrnPara

    End Function

    Function FormatText(ByVal strText As String) As String

        Return CF.ReverseReplaceStr(strText)

    End Function

End Class
