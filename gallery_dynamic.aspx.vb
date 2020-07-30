Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Math

Partial Class gallery_dynamic
    Inherits System.Web.UI.Page

    Dim FPG As FrontPictureGallery = New FrontPictureGallery
    
    Dim CF As CommonFunctionsCls = New CommonFunctionsCls

     Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            BindPictureGalleryCategory()
           
        End If

    End Sub

     Sub BindPictureGalleryCategory()

        Dim DS As DataSet = FPG.FrontPictureGallery_Category_SelectAll()
        If DS.Tables(0).Rows.Count > 0 Then
            rpPictureGalleryCategory.DataSource = DS
            rpPictureGalleryCategory.DataBind()
        End If

        DS.Clear()
        DS.Dispose()

    End Sub

    Function BindPictureGallery(byval PGCID As Integer ) As DataSet

        Dim DS As Dataset = FPG.FrontPictureGallery_Gallery_SelectAllBy_PGCID(PGCID )
        Return DS 

    End Function

     Function FormatText(ByVal str As String) As String

        Return CF.ReverseReplaceStr(str)

    End Function

End Class
