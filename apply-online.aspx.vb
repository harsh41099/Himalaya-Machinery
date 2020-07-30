Imports System
Imports System.IO
Imports System.Data
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Globalization

Partial Class apply_online
    Inherits System.Web.UI.Page

     Dim CF As CommonFunctionsCls = New CommonFunctionsCls
    Dim CR As Front_Career = New Front_Career

    Public Position As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Cache.SetCacheability(HttpCacheability.NoCache)
    If Not IsPostBack Then

            If Not (IsNumeric(Request.QueryString("id"))) Then
                Response.Redirect("current-openings.aspx")
            End If

            txtDOB.Attributes.Add("readonly", "readonly")
            txtDOB.Attributes.Add("onclick", CalDOB.ClientID + ".displayCalendar(event)")
            'CalDOB.DateMax  = Date.Now.AddYears(-18)
            'CalDOB.SelectedDate = Date.Now.AddYears(-18)
            

            Position = Nothing
            Dim Job_Id As Integer = CInt(Request.QueryString("id"))

            Dim DS As DataSet = CR.Front_Find_Post_Applied_For_DS(Job_Id)
            If DS.Tables(0).Rows.Count > 0 Then
                For i As Integer = 0 To DS.Tables(0).Rows.Count - 1
                    Position = CF.ReverseReplaceStr(DS.Tables(0).Rows(i).Item("Pos_Name"))
                    Session("PosId") = DS.Tables(0).Rows(i).Item("Pos_Id")
                    Session("position") = CF.ReverseReplaceStr(DS.Tables(0).Rows(i).Item("Pos_Name"))
                    Session("LocId") = DS.Tables(0).Rows(i).Item("Loc_Id")
                    txtJobLocation.Text = CF.ReverseReplaceStr(DS.Tables(0).Rows(i).Item("Loc_Name"))
                Next

            Else
                Response.Redirect("current-openings.aspx")

            End If

            DS.Clear()
            DS.Dispose()

            Session("position") = Position

        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If txtFirstName.Text = "First Name" Then
            RequiredFieldValidator1.Enabled = True
        Else
            RequiredFieldValidator1.Enabled = False
        End If

        Dim Job_Id As Integer = CInt(Request.QueryString("id"))

        'insert Personal data start here ------------------------------------------------------------
        Dim strFileName As String = ResumeUpload1.PostedFile.FileName

        Dim strMiddleName, strLastName As String

        'set the middle name
        If txtMiddleName.Text = "Middle Name" Then
            strMiddleName = ""
        Else
            strMiddleName = txtMiddleName.Text
        End If

        'set the last name
        If txtLastName.Text = "Last Name" Then
            strLastName = ""
        Else
            strLastName = txtLastName.Text
        End If

        Dim strPresentState, strPresentCountry, strPresentZipCode As String
        strPresentState = ""
        strPresentCountry = ""
        strPresentZipCode = ""

        Dim strPermanentAddress, strPermanentCity, strPermanentState, strPermanentCountry, strPermanentZipCode, strPermanentPhone As String
        strPermanentAddress = ""
        strPermanentCity = ""
        strPermanentState = ""
        strPermanentCountry = ""
        strPermanentZipCode = ""
        strPermanentPhone = ""
        Dim TotalYearsExperience As Decimal = CDbl(ddlTotalYearExperience.SelectedValue) & "." & CDbl(ddlTotalMonthsExperience.SelectedValue)


        Dim LastInsertedApplicnatId = CR.Front_Career_Personal_Insert(Job_Id, Session("PosId"), CF.ReplaceStr(txtFirstName.Text), CF.ReplaceStr(strMiddleName), _
                                                                CF.ReplaceStr(strLastName), Date.Now(), CF.ReplaceStr(txtPresentAddress.Text), CF.ReplaceStr(txtPresentCity.Text), _
                                                                strPresentState, strPresentZipCode, strPresentCountry, CF.ReplaceStr(txtPresentPhone.Text), _
                                                                strPermanentAddress, strPermanentCity, strPermanentState, strPermanentZipCode, _
                                                                strPermanentCountry, strPermanentPhone, CF.ReplaceStr(txtMobile.Text), txtEmail.Text, _
                                                                CF.ReplaceStr(txtDOB.Text), ddlGender.SelectedValue, ddlMStatus.SelectedValue, Session("LocId"), _
                                                                CF.ReplaceStr(txtJobLocation.Text), ConvertBlankTextToZero(TotalYearsExperience), CF.ReplaceStr(txtRemPresent.Text), CF.ReplaceStr(txtRemExpected.Text), _
                                                                CF.ReplaceStr(txtDetails.Text), "N", "N", _
                                                                strFileName, "", "10")


        'txtFirstName.Text = LastInsertedApplicnatId
        'Ends here (insert Personal data )------------------------------------------------------------

        'Upload Resume file
        Dim AttachmentFileName As String
        AttachmentFileName = ResumeUpload(LastInsertedApplicnatId, ResumeUpload1)


        'inesrt Academics Data Starts Here ------------------------------------------------------------
        '1 st row insert
        If txtDegree1.Text <> "" Or txtInstitute1.Text <> "" Or txtUni1.Text <> "" Or txtYear1.Text <> "" Or txtSubject1.Text <> "" Or txtGrade1.Text <> "" Then
            CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree1.Text), CF.ReplaceStr(txtInstitute1.Text), CF.ReplaceStr(txtUni1.Text), CF.ReplaceStr(txtYear1.Text), CF.ReplaceStr(txtSubject1.Text), CF.ReplaceStr(txtGrade1.Text))
        End If

        '2nd row insert
        If txtDegree2.Text <> "" Or txtInstitute2.Text <> "" Or txtUni2.Text <> "" Or txtYear2.Text <> "" Or txtSubject2.Text <> "" Or txtGrade2.Text <> "" Then
            CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree2.Text), CF.ReplaceStr(txtInstitute2.Text), CF.ReplaceStr(txtUni2.Text), CF.ReplaceStr(txtYear2.Text), CF.ReplaceStr(txtSubject2.Text), CF.ReplaceStr(txtGrade2.Text))
        End If

        '3rd row insert
        If txtDegree3.Text <> "" Or txtInstitute3.Text <> "" Or txtUni3.Text <> "" Or txtYear3.Text <> "" Or txtSubject3.Text <> "" Or txtGrade3.Text <> "" Then
            CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree3.Text), CF.ReplaceStr(txtInstitute3.Text), CF.ReplaceStr(txtUni3.Text), CF.ReplaceStr(txtYear3.Text), CF.ReplaceStr(txtSubject3.Text), CF.ReplaceStr(txtGrade3.Text))
        End If

        '4th row insert
        If txtDegree4.Text <> "" Or txtInstitute4.Text <> "" Or txtUni4.Text <> "" Or txtYear4.Text <> "" Or txtSubject4.Text <> "" Or txtGrade4.Text <> "" Then
            CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree4.Text), CF.ReplaceStr(txtInstitute4.Text), CF.ReplaceStr(txtUni4.Text), CF.ReplaceStr(txtYear4.Text), CF.ReplaceStr(txtSubject4.Text), CF.ReplaceStr(txtGrade4.Text))
        End If

        ''5th row insert
        'If txtDegree5.Text <> "" Or txtInstitute5.Text <> "" Or txtUni5.Text <> "" Or txtYear5.Text <> "" Or txtSubject5.Text <> "" Or txtGrade5.Text <> "" Then
        '    CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree5.Text), CF.ReplaceStr(txtInstitute5.Text), CF.ReplaceStr(txtUni5.Text), CF.ReplaceStr(txtYear5.Text), CF.ReplaceStr(txtSubject5.Text), CF.ReplaceStr(txtGrade5.Text))
        'End If

        ''6th row insert
        'If txtDegree6.Text <> "" Or txtInstitute6.Text <> "" Or txtUni6.Text <> "" Or txtYear6.Text <> "" Or txtSubject6.Text <> "" Or txtGrade6.Text <> "" Then
        '    CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree6.Text), CF.ReplaceStr(txtInstitute6.Text), CF.ReplaceStr(txtUni6.Text), CF.ReplaceStr(txtYear6.Text), CF.ReplaceStr(txtSubject6.Text), CF.ReplaceStr(txtGrade6.Text))
        'End If

        ''7th row insert
        'If txtDegree7.Text <> "" Or txtInstitute7.Text <> "" Or txtUni7.Text <> "" Or txtYear7.Text <> "" Or txtSubject7.Text <> "" Or txtGrade7.Text <> "" Then
        '    CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree7.Text), CF.ReplaceStr(txtInstitute7.Text), CF.ReplaceStr(txtUni7.Text), CF.ReplaceStr(txtYear7.Text), CF.ReplaceStr(txtSubject7.Text), CF.ReplaceStr(txtGrade7.Text))
        'End If

        ''8th row insert
        'If txtDegree8.Text <> "" Or txtInstitute8.Text <> "" Or txtUni8.Text <> "" Or txtYear8.Text <> "" Or txtSubject8.Text <> "" Or txtGrade8.Text <> "" Then
        '    CR.Front_Career_Academics_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtDegree8.Text), CF.ReplaceStr(txtInstitute8.Text), CF.ReplaceStr(txtUni8.Text), CF.ReplaceStr(txtYear8.Text), CF.ReplaceStr(txtSubject8.Text), CF.ReplaceStr(txtGrade8.Text))
        'End If

        'Ends Here (inesrt Academics Data ) ------------------------------------------------------------



        'inesrt Employer Data Starts Here ------------------------------------------------------------
        '1st row
        If txtEmployerCompanyName1.Text <> "" Or txtEmployerAddress1.Text <> "" Or txtEmployerNatureOfBusiness1.Text <> "" Or txtEmployerJobDescription1.Text <> "" Or txtEmployerStartDate1.Text <> "" Or txtEmployerEndDate1.Text <> "" Then
            CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName1.Text), CF.ReplaceStr(txtEmployerAddress1.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness1.Text), _
                                            CF.ReplaceStr(txtEmployerDesignation1.Text), "", CF.ReplaceStr(txtEmployerJobDescription1.Text), CF.ReplaceStr(txtEmployerStartDate1.Text), CF.ReplaceStr(txtEmployerEndDate1.Text))
        End If


        '2nd row
        If txtEmployerCompanyName2.Text <> "" Or txtEmployerAddress2.Text <> "" Or txtEmployerNatureOfBusiness2.Text <> "" Or txtEmployerJobDescription2.Text <> "" Or txtEmployerStartDate2.Text <> "" Or txtEmployerEndDate2.Text <> "" Then
            CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName2.Text), CF.ReplaceStr(txtEmployerAddress2.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness2.Text), _
                                            CF.ReplaceStr(txtEmployerDesignation2.Text), "", CF.ReplaceStr(txtEmployerJobDescription2.Text), CF.ReplaceStr(txtEmployerStartDate2.Text), CF.ReplaceStr(txtEmployerEndDate2.Text))
        End If

        '3rd row
        If txtEmployerCompanyName3.Text <> "" Or txtEmployerAddress3.Text <> "" Or txtEmployerNatureOfBusiness3.Text <> "" Or txtEmployerJobDescription3.Text <> "" Or txtEmployerStartDate3.Text <> "" Or txtEmployerEndDate3.Text <> "" Then
            CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName3.Text), CF.ReplaceStr(txtEmployerAddress3.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness3.Text), _
                                            CF.ReplaceStr(txtEmployerDesignation3.Text), "", CF.ReplaceStr(txtEmployerJobDescription3.Text), CF.ReplaceStr(txtEmployerStartDate3.Text), CF.ReplaceStr(txtEmployerEndDate3.Text))
        End If

        '4th row
        If txtEmployerCompanyName4.Text <> "" Or txtEmployerAddress4.Text <> "" Or txtEmployerNatureOfBusiness4.Text <> "" Or txtEmployerJobDescription4.Text <> "" Or txtEmployerStartDate4.Text <> "" Or txtEmployerEndDate4.Text <> "" Then
            CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName4.Text), CF.ReplaceStr(txtEmployerAddress4.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness4.Text), _
                                            CF.ReplaceStr(txtEmployerDesignation4.Text), "", CF.ReplaceStr(txtEmployerJobDescription4.Text), CF.ReplaceStr(txtEmployerStartDate4.Text), CF.ReplaceStr(txtEmployerEndDate4.Text))
        End If

        ''5th row
        'If txtEmployerCompanyName5.Text <> "" Or txtEmployerAddress5.Text <> "" Or txtEmployerNatureOfBusiness5.Text <> "" Or txtEmployerJobDescription5.Text <> "" Or txtEmployerStartDate5.Text <> "" Or txtEmployerEndDate5.Text <> "" Then
        '    CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName5.Text), CF.ReplaceStr(txtEmployerAddress5.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness5.Text), _
        '                                    CF.ReplaceStr(txtEmployerDesignation5.Text), "", CF.ReplaceStr(txtEmployerJobDescription5.Text), CF.ReplaceStr(txtEmployerStartDate5.Text), CF.ReplaceStr(txtEmployerEndDate5.Text))
        'End If

        ''6th row
        'If txtEmployerCompanyName6.Text <> "" Or txtEmployerAddress6.Text <> "" Or txtEmployerNatureOfBusiness6.Text <> "" Or txtEmployerJobDescription6.Text <> "" Or txtEmployerStartDate6.Text <> "" Or txtEmployerEndDate6.Text <> "" Then
        '    CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName6.Text), CF.ReplaceStr(txtEmployerAddress6.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness6.Text), _
        '                                    CF.ReplaceStr(txtEmployerDesignation6.Text), "", CF.ReplaceStr(txtEmployerJobDescription6.Text), CF.ReplaceStr(txtEmployerStartDate6.Text), CF.ReplaceStr(txtEmployerEndDate6.Text))
        'End If

        ''7th row
        'If txtEmployerCompanyName7.Text <> "" Or txtEmployerAddress7.Text <> "" Or txtEmployerNatureOfBusiness7.Text <> "" Or txtEmployerJobDescription7.Text <> "" Or txtEmployerStartDate7.Text <> "" Or txtEmployerEndDate7.Text <> "" Then
        '    CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName7.Text), CF.ReplaceStr(txtEmployerAddress7.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness7.Text), _
        '                                    CF.ReplaceStr(txtEmployerDesignation7.Text), "", CF.ReplaceStr(txtEmployerJobDescription7.Text), CF.ReplaceStr(txtEmployerStartDate7.Text), CF.ReplaceStr(txtEmployerEndDate7.Text))
        'End If

        ''8th row
        'If txtEmployerCompanyName8.Text <> "" Or txtEmployerAddress8.Text <> "" Or txtEmployerNatureOfBusiness8.Text <> "" Or txtEmployerJobDescription8.Text <> "" Or txtEmployerStartDate8.Text <> "" Or txtEmployerEndDate8.Text <> "" Then
        '    CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName8.Text), CF.ReplaceStr(txtEmployerAddress8.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness8.Text), _
        '                                    CF.ReplaceStr(txtEmployerDesignation8.Text), "", CF.ReplaceStr(txtEmployerJobDescription8.Text), CF.ReplaceStr(txtEmployerStartDate8.Text), CF.ReplaceStr(txtEmployerEndDate8.Text))
        'End If

        ''9th row
        'If txtEmployerCompanyName9.Text <> "" Or txtEmployerAddress9.Text <> "" Or txtEmployerNatureOfBusiness9.Text <> "" Or txtEmployerJobDescription9.Text <> "" Or txtEmployerStartDate9.Text <> "" Or txtEmployerEndDate9.Text <> "" Then
        '    CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName9.Text), CF.ReplaceStr(txtEmployerAddress9.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness9.Text), _
        '                                    CF.ReplaceStr(txtEmployerDesignation9.Text), "", CF.ReplaceStr(txtEmployerJobDescription9.Text), CF.ReplaceStr(txtEmployerStartDate9.Text), CF.ReplaceStr(txtEmployerEndDate9.Text))
        'End If

        ''10th row
        'If txtEmployerCompanyName10.Text <> "" Or txtEmployerAddress10.Text <> "" Or txtEmployerNatureOfBusiness10.Text <> "" Or txtEmployerJobDescription10.Text <> "" Or txtEmployerStartDate10.Text <> "" Or txtEmployerEndDate10.Text <> "" Then
        '    CR.Front_Career_Experience_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtEmployerCompanyName10.Text), CF.ReplaceStr(txtEmployerAddress10.Text), CF.ReplaceStr(txtEmployerNatureOfBusiness10.Text), _
        '                                    CF.ReplaceStr(txtEmployerDesignation10.Text), "", CF.ReplaceStr(txtEmployerJobDescription10.Text), CF.ReplaceStr(txtEmployerStartDate10.Text), CF.ReplaceStr(txtEmployerEndDate10.Text))
        'End If

        'Ends Here (inesrt Employer Data)------------------------------------------------------------


        'inesrt Languages Data Starts Here ------------------------------------------------------------

        Dim Read1 As String
        If chkRead1.Checked = True Then
            Read1 = "Y"
        Else
            Read1 = "N"
        End If

        Dim Read2 As String
        If chkRead2.Checked = True Then
            Read2 = "Y"
        Else
            Read2 = "N"
        End If

        Dim Read3 As String
        If chkRead3.Checked = True Then
            Read3 = "Y"
        Else
            Read3 = "N"
        End If

        Dim Write1 As String
        If chkWrite1.Checked = True Then
            Write1 = "Y"
        Else
            Write1 = "N"
        End If

        Dim Write2 As String
        If chkWrite2.Checked = True Then
            Write2 = "Y"
        Else
            Write2 = "N"
        End If

        Dim Write3 As String
        If chkWrite3.Checked = True Then
            Write3 = "Y"
        Else
            Write3 = "N"
        End If

        Dim Speak1 As String
        If chkSpeak1.Checked = True Then
            Speak1 = "Y"
        Else
            Speak1 = "N"
        End If

        Dim Speak2 As String
        If chkSpeak2.Checked = True Then
            Speak2 = "Y"
        Else
            Speak2 = "N"
        End If

        Dim Speak3 As String
        If chkSpeak3.Checked = True Then
            Speak3 = "Y"
        Else
            Speak3 = "N"
        End If

        'Inesrt Language 1 Data
        If txtLang1.Text <> "" And chkRead1.Checked = True Or chkWrite1.Checked = True Or chkSpeak1.Checked = True Then
            CR.Front_Career_Languages_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtLang1.Text), Speak1, Read1, Write1)
        End If

        'Inesrt Language 2 Data
        If txtLang2.Text <> "" And chkRead2.Checked = True Or chkWrite2.Checked = True Or chkSpeak2.Checked = True Then
            CR.Front_Career_Languages_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtLang2.Text), Speak2, Read2, Write2)
        End If

        'Insert Language 3 Data
        If txtLang3.Text <> "" And chkRead3.Checked = True Or chkWrite3.Checked = True Or chkSpeak3.Checked = True Then
            CR.Front_Career_Languages_Insert(LastInsertedApplicnatId, CF.ReplaceStr(txtLang3.Text), Speak3, Read3, Write3)
        End If

        'Ends Here (inesrt Languages Data)------------------------------------------------------------


        'SEND ENQUIRY DATA SMS to GF's EMPLOYEE -------------------- STARTS -----------------------------
        Dim strGFContactNosWhoReceivesSMS As String = "8460533794"
        Dim strSMS_ToGFEmpl As String = "New resume submitted for the post of " & Session("position") & " %0A%0AKindly check your mail or visit admin panel for more details."
        Dim SendSMSURL_ToGFEmpl As String = "http://bhashsms.com/api/sendmsg.php?user=fortunelifespaces&pass=Tiger@Kalpen&sender=FLSGNF&phone=" & strGFContactNosWhoReceivesSMS & "&text=" & strSMS_ToGFEmpl & "&priority=ndnd&stype=normal"  ' ------------ FOR TESTING ------------
        Dim client As New Net.WebClient
        client.DownloadString(SendSMSURL_ToGFEmpl)
        'SEND ENQUIRY DATA SMS to GF's EMPLOYEE -------------------- ENDS -----------------------------

        'MAIL SENDING CODE ----------------------- STARTS -------------------------------------

        Dim r1, r2, r3, w1, w2, w3, s1, s2, s3 As String
        'read
        If Read1 = "Y" Then
            r1 = "Read"
        End If
        If Read2 = "Y" Then
            r2 = "Read"
        End If
        If Read3 = "Y" Then
            r3 = "Read"
        End If
        'write
        If Write1 = "Y" Then
            w1 = "Write"
        End If
        If Write2 = "Y" Then
            w2 = "Write"
        End If
        If Write3 = "Y" Then
            w3 = "Write"
        End If
        'speak
        If Speak1 = "Y" Then
            s1 = "Speak"
        End If
        If Speak2 = "Y" Then
            s2 = "Speak"
        End If
        If Speak3 = "Y" Then
            s3 = "Speak"
        End If

        Dim Email As New StringBuilder
        Email.Append("<html><body>")

        Email.Append("<style>")
        Email.Append("table, td { border-color:#8F8E8D; border-style: solid; }")
        Email.Append("table { border-width:0 0 1px 1px; border-spacing:0; border-collapse:collapse; }")
        Email.Append("td { margin: 0; border-width: 1px 1px 0 0;}")

        'Email.Append(".")
        'Email.Append(".")
        Email.Append("</style>")
        Email.Append("<table border='0' cellpadding='0' cellspacing='0' width='850' bgcolor='#8F8E8D'><tr><td align='left' valign='top' bgcolor='#ffffff'>")
        Email.Append("<table width='850' border='0' cellspacing='0' cellpadding='0'>")
        Email.Append("<tr><td height='35' align='left' valign='middle' bgcolor='#0098da' ><span style='font-family:Arial; font-size:13px; color:#ffffff; text-decoration:none; font-weight:bold;'>&nbsp;&nbsp;Career Application</span></td></tr>")
        Email.Append("<tr><td align='left' valign='top'><table width='850' border='0' cellspacing='0' cellpadding='5'>")

        'Personal Details
        'Renumeration Details
        Email.Append("<tr><td height='30' colspan='2' align='left' valign='middle' bgcolor='#8F8E8D' style='font-family:Arial; font-size:13px; color:#ffffff; text-decoration:none; text-align:left; font-weight:bold;'>Personal Details</td></tr>")
        Email.Append("<tr><td width='159' height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;' >Name</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtFirstName.Text) & "&nbsp;" & Trim(txtMiddleName.Text) & "&nbsp;" & Trim(txtLastName.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Address</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtPresentAddress.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>City</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtPresentCity.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Phone</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtPresentPhone.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Mobile</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtMobile.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>E-mail</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtEmail.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Date of Birth</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtDOB.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Gender</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & ddlGender.SelectedValue & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Marital Status</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & ddlMStatus.SelectedValue & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Preferred Job<br>Location</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtJobLocation.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Special Details</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtDetails.Text) & "</td></tr>")

        'Renumeration Details
        Email.Append("<tr><td height='30' colspan='2' align='left' valign='middle' bgcolor='#8F8E8D' style='font-family:Arial; font-size:13px; color:#ffffff; text-decoration:none; text-align:left; font-weight:bold;'>Renumeration Details</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Present (per annum)</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtRemPresent.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Expected (per annum)</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & Trim(txtRemExpected.Text) & "</td></tr>")
        Email.Append("<tr><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Total Years of Experience</td><td height='28' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>&nbsp;" & TotalYearsExperience & "</td></tr>")

        'Employer / Experience Details ------ Starts Here
        Email.Append("<tr><td height='30' colspan='2' align='left' valign='middle' bgcolor='#8F8E8D' style='font-family:Arial; font-size:13px; color:#ffffff; text-decoration:none; text-align:left; font-weight:bold;'>Experience / Employer Details</td></tr>")

        Email.Append("<tr><td height='35' colspan='2' align='left' valign='middle' bgcolor='#ffffff'><table width='100%' border='0' cellspacing='0' cellpadding='0'>")
        'Heading Row
        Email.Append("<tr align='center'><td width='150' height='28' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '><strong>Company Name</strong></td><td width='110' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '><strong>Address</strong></td><td width='130' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '><strong>Nature of Business</strong></td><td width='85' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '><strong>Designation</strong></td><td width='95' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '><strong>Job Description </strong></td><td width='85' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '><strong>Start Date</strong></td><td width='85' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '><strong>End Date</strong></td></tr>")
        'Data Row
        'Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' class='content_text'>&nbsp;deg 1</td><td bgcolor='#FFFFFF' class='content_text'>&nbsp;in 1</td><td bgcolor='#FFFFFF' class='content_text'>&nbsp;u1</td><td bgcolor='#FFFFFF' class='content_text'>&nbsp;y1</td><td bgcolor='#FFFFFF' class='content_text'>&nbsp;m1</td><td bgcolor='#FFFFFF' class='content_text'>&nbsp;g1</td><td bgcolor='#FFFFFF' class='content_text'>&nbsp;g1</td></tr>")
        '1st row
        If txtEmployerCompanyName1.Text <> "" Or txtEmployerAddress1.Text <> "" Or txtEmployerNatureOfBusiness1.Text <> "" Or txtEmployerJobDescription1.Text <> "" Or txtEmployerStartDate1.Text <> "" Or txtEmployerEndDate1.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate1.Text) & "</td></tr>")
        End If
        '2st row
        If txtEmployerCompanyName2.Text <> "" Or txtEmployerAddress2.Text <> "" Or txtEmployerNatureOfBusiness2.Text <> "" Or txtEmployerJobDescription2.Text <> "" Or txtEmployerStartDate2.Text <> "" Or txtEmployerEndDate2.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate2.Text) & "</td></tr>")
        End If
        '3st row
        If txtEmployerCompanyName3.Text <> "" Or txtEmployerAddress3.Text <> "" Or txtEmployerNatureOfBusiness3.Text <> "" Or txtEmployerJobDescription3.Text <> "" Or txtEmployerStartDate3.Text <> "" Or txtEmployerEndDate3.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate3.Text) & "</td></tr>")
        End If
        '4st row
        If txtEmployerCompanyName4.Text <> "" Or txtEmployerAddress4.Text <> "" Or txtEmployerNatureOfBusiness4.Text <> "" Or txtEmployerJobDescription4.Text <> "" Or txtEmployerStartDate4.Text <> "" Or txtEmployerEndDate4.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate4.Text) & "</td></tr>")
        End If
        ''5st row
        'If txtEmployerCompanyName5.Text <> "" Or txtEmployerAddress5.Text <> "" Or txtEmployerNatureOfBusiness5.Text <> "" Or txtEmployerJobDescription5.Text <> "" Or txtEmployerStartDate5.Text <> "" Or txtEmployerEndDate5.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate5.Text) & "</td></tr>")
        'End If
        ''6st row
        'If txtEmployerCompanyName6.Text <> "" Or txtEmployerAddress6.Text <> "" Or txtEmployerNatureOfBusiness6.Text <> "" Or txtEmployerJobDescription6.Text <> "" Or txtEmployerStartDate6.Text <> "" Or txtEmployerEndDate6.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate6.Text) & "</td></tr>")
        'End If
        ''7st row
        'If txtEmployerCompanyName7.Text <> "" Or txtEmployerAddress7.Text <> "" Or txtEmployerNatureOfBusiness7.Text <> "" Or txtEmployerJobDescription7.Text <> "" Or txtEmployerStartDate7.Text <> "" Or txtEmployerEndDate7.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate7.Text) & "</td></tr>")
        'End If
        ''8st row
        'If txtEmployerCompanyName8.Text <> "" Or txtEmployerAddress8.Text <> "" Or txtEmployerNatureOfBusiness8.Text <> "" Or txtEmployerJobDescription8.Text <> "" Or txtEmployerStartDate8.Text <> "" Or txtEmployerEndDate8.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate8.Text) & "</td></tr>")
        'End If
        ''9st row
        'If txtEmployerCompanyName9.Text <> "" Or txtEmployerAddress9.Text <> "" Or txtEmployerNatureOfBusiness9.Text <> "" Or txtEmployerJobDescription9.Text <> "" Or txtEmployerStartDate9.Text <> "" Or txtEmployerEndDate9.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate9.Text) & "</td></tr>")
        'End If
        ''9st row
        'If txtEmployerCompanyName9.Text <> "" Or txtEmployerAddress9.Text <> "" Or txtEmployerNatureOfBusiness9.Text <> "" Or txtEmployerJobDescription9.Text <> "" Or txtEmployerStartDate9.Text <> "" Or txtEmployerEndDate9.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerCompanyName9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerAddress9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerNatureOfBusiness9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerDesignation9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerJobDescription9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerStartDate9.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtEmployerEndDate9.Text) & "</td></tr>")
        'End If

        Email.Append("</table></td></tr>")
        ''Employer / Experience Details ------ Ends Here

        'Educational Qualification
        Email.Append("<tr><td height='30' colspan='2' align='left' valign='middle' bgcolor='#8F8E8D' style='font-family:Arial; font-size:13px; color:#ffffff; text-decoration:none; text-align:left; font-weight:bold;'>Educational Qualification</td></tr>")
        Email.Append("<tr><td height='30' colspan='2' align='left' valign='middle' bgcolor='#ffffff'><table width='100%' border='0' cellspacing='0' cellpadding='0'>")
        'Heading Row
        Email.Append("<tr align='center'><td width='136' height='28' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '>Degree/Diploma</td><td width='109' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '>Institute</td><td width='126' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '>Board/University</td><td width='51' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '>Year</td><td width='75' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '>Main Subject </td><td width='75' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '>Grade %</td></tr>")
        'Data Row
        'Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;deg 1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;in 1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;u1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;y1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;m1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;g1</td></tr>")
        '1st row
        If txtDegree1.Text <> "" Or txtInstitute1.Text <> "" Or txtSubject1.Text <> "" Or txtUni1.Text <> "" Or txtGrade1.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade1.Text) & "</td></tr>")
        End If
        '2nd row
        If txtDegree2.Text <> "" Or txtInstitute2.Text <> "" Or txtSubject2.Text <> "" Or txtUni2.Text <> "" Or txtGrade2.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade2.Text) & "</td></tr>")
        End If
        '3rd row
        If txtDegree3.Text <> "" Or txtInstitute3.Text <> "" Or txtSubject3.Text <> "" Or txtUni3.Text <> "" Or txtGrade3.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade3.Text) & "</td></tr>")
        End If
        '4th row
        If txtDegree4.Text <> "" Or txtInstitute4.Text <> "" Or txtSubject4.Text <> "" Or txtUni4.Text <> "" Or txtGrade4.Text <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject4.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade4.Text) & "</td></tr>")
        End If
        ''5th row
        'If txtDegree5.Text <> "" Or txtInstitute5.Text <> "" Or txtSubject5.Text <> "" Or txtUni5.Text <> "" Or txtGrade5.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject5.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade5.Text) & "</td></tr>")
        'End If
        ''6th row
        'If txtDegree6.Text <> "" Or txtInstitute6.Text <> "" Or txtSubject6.Text <> "" Or txtUni6.Text <> "" Or txtGrade6.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject6.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade6.Text) & "</td></tr>")
        'End If
        ''7th row
        'If txtDegree7.Text <> "" Or txtInstitute7.Text <> "" Or txtSubject7.Text <> "" Or txtUni7.Text <> "" Or txtGrade7.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject7.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade7.Text) & "</td></tr>")
        'End If
        ''8th row
        'If txtDegree8.Text <> "" Or txtInstitute8.Text <> "" Or txtSubject8.Text <> "" Or txtUni8.Text <> "" Or txtGrade8.Text <> "" Then
        '    Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtDegree8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtInstitute8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtUni8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtYear8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtSubject8.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtGrade8.Text) & "</td></tr>")
        'End If
        Email.Append("</table></td></tr>")

        'Languages Known --------- Starts Here
        Email.Append("<tr><td height='30' colspan='2' align='left' valign='middle' bgcolor='#8F8E8D' style='font-family:Arial; font-size:13px; color:#ffffff; text-decoration:none; text-align:left; font-weight:bold;'>Languages Known </td></tr>")
        Email.Append("<tr><td height='30' colspan='2' align='left' valign='middle' bgcolor='#ffffff'><table width='100%' border='0' cellspacing='0' cellpadding='0'>")
        'Heading Row
        Email.Append("<tr align='center'><td width='136' height='28' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold; padding-left:5px; padding-right:2px; '>Language</td><td width='105' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; font-weight:bold; padding-left:5px; padding-right:2px; '>Read</td><td width='105' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; font-weight:bold; padding-left:5px; padding-right:2px; '>Write</td><td width='105' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; font-weight:bold; padding-left:5px; padding-right:2px; '>Speak</td></tr>")
        'Data Row
        'Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;deg 1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;in 1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;u1</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>&nbsp;y1</td></tr>")
        'Language1
        If Trim(txtLang1.Text) <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtLang1.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-center:5px;'>" & Read1 & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-left:5px; padding-right:2px; '>" & Write1 & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-left:5px; padding-right:2px; '>" & Speak1 & "</td></tr>")
        End If
        'Language2
        If Trim(txtLang2.Text) <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtLang2.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-center:5px;'>" & Read2 & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-left:5px; padding-right:2px; '>" & Write2 & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-left:5px; padding-right:2px; '>" & Speak2 & "</td></tr>")
        End If
        'Language3
        If Trim(txtLang3.Text) <> "" Then
            Email.Append("<tr align='center'><td height='28' bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; padding-left:5px; padding-right:2px; '>" & Trim(txtLang3.Text) & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-center:5px;'>" & Read3 & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-left:5px; padding-right:2px; '>" & Write3 & "</td><td bgcolor='#FFFFFF' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:center; padding-left:5px; padding-right:2px; '>" & Speak3 & "</td></tr>")
        End If

        Email.Append("</table></td></tr>")

        'Resume
        Email.Append("<tr><td height='30' align='left' valign='middle' bgcolor='#ffffff' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left; font-weight:bold;'>Resume</td><td width='556' height='30' align='left' valign='middle' style='font-family:Arial; font-size:12px; color:#000000; text-decoration:none; text-align:left;'>Please find the attached file&nbsp;</td></tr>")

        Email.Append("</table></td></tr>")

        Email.Append("</table></td></tr>")

        Email.Append("</table>")
        Email.Append("</html></body>")

        'Response.Write(Email.ToString())
        'Response.End()

        Dim msg As New MailMessage()
        msg.From = New MailAddress(System.Configuration.ConfigurationManager.AppSettings("MailUserName"))

        msg.To.Add("info@himalayamachine.com")
        'msg.Bcc.Add("rahul.raj@tigermail.in")

        msg.Subject = "New resume submitted for the post of " & Session("position")
        msg.Body = Email.ToString

        'Attach the resume file
        Dim fileName As String = Path.GetFileName(ResumeUpload1.PostedFile.FileName)
        Dim myAttachment As New Attachment(ResumeUpload1.FileContent, fileName)
        msg.Attachments.Add(myAttachment)


        msg.IsBodyHtml = True
        msg.Priority = MailPriority.High

        Dim mailServer As String = System.Configuration.ConfigurationManager.AppSettings("SMTPMailServer")      ' 
        Dim mySmtpClient As New SmtpClient(mailServer)

        Dim basicauthenticationinfo As New System.Net.NetworkCredential(System.Configuration.ConfigurationManager.AppSettings("MailUserName"), System.Configuration.ConfigurationManager.AppSettings("MailPassword"))
        mySmtpClient.UseDefaultCredentials = False
        mySmtpClient.Port = 587
        mySmtpClient.EnableSsl = True
        mySmtpClient.Credentials = basicauthenticationinfo

        Try
            mySmtpClient.Send(msg)
            msg.Dispose()
            Response.Redirect("response-career.aspx#content")
        Catch ex As Exception
            Response.Redirect("response-career.aspx#content")

        End Try

        ''mySmtpClient.Send(msg)
        ''msg.Dispose()

        ' ''code to send the mail ----ends here

        ''Response.Redirect("response-apply-online.aspx")

    End Sub

    Protected Function ResumeUpload(ByVal id As Integer, ByRef CtrlName As FileUpload) As String

        If CtrlName.HasFile Then         'id -> folder name for creation, FolderName -> inwhich folder file is copied, CtrlName -> for which upload control this function works
            Try
                Dim strPath As String = Server.MapPath("upload\resume")
                strPath = strPath & "\" & id & "\"
                If (FolderExists(strPath) = False) Then        'if folder is not exist than create it
                    Directory.CreateDirectory(strPath)

                End If
                Dim s As String
                For Each s In System.IO.Directory.GetFiles(strPath)
                    'System.IO.File.Delete(s)
                Next s
                CtrlName.SaveAs(strPath + CtrlName.FileName)
            Catch
            End Try
            Return CtrlName.FileName
        End If
        Return ""
    End Function

    Public Function FolderExists(ByVal FolderPath As String) As Boolean

        Dim f As New IO.DirectoryInfo(FolderPath)
        Return f.Exists

    End Function

    Function ConvertBlankTextToZero(ByRef strValue As String) As Decimal

        Dim RtrnPara As Decimal
        If Trim(strValue) = "" Then
            RtrnPara = 0
        Else
            RtrnPara = CDbl(strValue)
        End If
        Return RtrnPara

    End Function

    Function ConvertZeroToBlankText(ByVal strValue As Decimal) As String

        Dim RtrnPara As String
        If strValue = 0 Then
            RtrnPara = ""
        Else
            RtrnPara = strValue
        End If
        Return RtrnPara

    End Function

    Public Sub ClearTextBox(ByVal root As Control)

        For Each ctrl As Control In root.Controls

            ClearTextBox(ctrl)

            If TypeOf ctrl Is TextBox Then

                CType(ctrl, TextBox).Text = String.Empty

            End If

        Next ctrl

    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click
        ClearTextBox(Me)
        'hdnEducationalCounter.Value = 3
        'hdnEmployerCounter.Value = 2
    End Sub

    Protected Sub btnTest_Click(sender As Object, e As System.EventArgs) Handles btnTest.Click

        lblTest.Text = txtDOB.Text

        'lblTest.Text = lblTest.Text & "<br/>" & DateTime.ParseExact(txtDOB.Text, "ddMMyyyy", CultureInfo.InvariantCulture)



        Dim LastInsertedApplicnatId = CR.Front_Career_Test(CF.ReplaceStr(txtDOB.Text))

    End Sub

End Class
