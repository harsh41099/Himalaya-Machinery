Imports System.Net.Mail

Partial Class contactus
    Inherits System.Web.UI.Page

    Private Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click

         Dim strEmail As New StringBuilder

            strEmail.Append("")
            strEmail.Append("<html>")
            strEmail.Append("<body>")
            strEmail.Append("<table width='750' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>")
            strEmail.Append("<tr><td height='35' bgcolor='#3E4095' style='font:bold 15px Arial, Helvetica, sans-serif; color:#FFFFFF;'>&nbsp;&nbsp;Enquiry</td></tr>")
            strEmail.Append("<tr><td>&nbsp;</td></tr>")
            strEmail.Append("<tr><td align='center'><table width='725' border='0' cellpadding='4' cellspacing='1' bgcolor='#CCCCCC'>")

            strEmail.Append("<tr><td width='135' height='35' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>Name</td><td width='590' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>" & Trim(txtFullName.Text) & "</td></tr>")
            strEmail.Append("<tr><td height='35' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>Company</td><td align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>" & Trim(txtCompanyName.Text) & "</td></tr>")
            strEmail.Append("<tr><td height='35' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>Address</td><td align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>" & Trim(txtAddress.Text) & "</td></tr>")
            strEmail.Append("<tr><td height='35' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>Country</td><td align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>" & Trim(ddlCountry.SelectedItem.Text()) & "</td></tr>")
            strEmail.Append("<tr><td height='35' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>Email</td><td align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>" & Trim(txtEmail.Text) & "</td></tr>")
            strEmail.Append("<tr><td height='35' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>Contact Number</td><td align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>" & Trim(txtContactNumber.Text) & "</td></tr>")
            strEmail.Append("<tr><td height='80' align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>Message</td><td align='left' valign='middle' bgcolor='#FFFFFF' style='font:12px Verdana, Arial, Helvetica, sans-serif; color:#000000; padding-left:15px;'>" & Trim(txtMessage.Text) & "</td></tr>")

            strEmail.Append("</table></td></tr>")
            strEmail.Append("<tr><td>&nbsp;</td></tr>")
            strEmail.Append("<tr><td height='35' bgcolor='#3E4095' style='font:9px Verdana, Arial, Helvetica, sans-serif; color:#fff;'>&nbsp;</td></tr>")
            strEmail.Append("</table>")
            strEmail.Append("</body>")
            strEmail.Append("</html>")

            'Response.Write(strEmail.ToString())
            'Response.End()

            Dim msg As New MailMessage()
            msg.From = New MailAddress(System.Configuration.ConfigurationManager.AppSettings("MailUserName"))
            msg.To.Add("info@himalayamachine.com")
            'msg.Bcc.Add("rahul.raj@tigermail.in")

            msg.Subject = "New enquiry submitted"
            msg.Body = strEmail.ToString

            msg.IsBodyHtml = True
            msg.Priority = MailPriority.High

            Dim mailServer As String = System.Configuration.ConfigurationManager.AppSettings("SMTPMailServer")
            Dim mySmtpClient As New SmtpClient(mailServer)

            Dim basicauthenticationinfo As New System.Net.NetworkCredential(System.Configuration.ConfigurationManager.AppSettings("MailUserName"), System.Configuration.ConfigurationManager.AppSettings("MailPassword"))
            mySmtpClient.UseDefaultCredentials = False
            mySmtpClient.Port = 587
            mySmtpClient.EnableSsl = True
            mySmtpClient.Credentials = basicauthenticationinfo


            Try
                mySmtpClient.Send(msg)
                msg.Dispose()

                pnlMandatory.Visible = False 
                pnlEnquiry.Visible = False 
                pnlMessage.Visible = True

            Catch ex As Exception
                pnlMandatory.Visible = True 
                pnlEnquiry.Visible = True 
                pnlMessage.Visible = False 
            End Try

    End Sub

End Class
