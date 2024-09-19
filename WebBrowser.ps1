Add-Type -AssemblyName System.Windows.Forms
$URL1 = 'http://www.wikipedia.com'
$URL2 = 'https://adminscache.wordpress.com'
$URL3 = 'http://www.microsoft.com'

# WinForm Setup
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Font = 'Comic Sans MS,9'
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.BackColor = [System.Drawing.Color]::DarkSlateBlue
#$mainForm.Text =  System.Windows.Forms.WebBrowser Class
$mainForm.Width = 960
$mainForm.Height = 700

# Main Browser
$webBrowser1 = New-Object System.Windows.Forms.WebBrowser
$webBrowser1.IsWebBrowserContextMenuEnabled = $true
$webBrowser1.URL = $URL1
$webBrowser1.Width = 600
$webBrowser1.Height = 600
$webBrowser1.Location = “50, 25”
$mainForm.Controls.Add($webBrowser1)


# First Selectable Browser
$webBrowser2 = New-Object System.Windows.Forms.WebBrowser
$webBrowser2.IsWebBrowserContextMenuEnabled = $false
$webBrowser2.URL = $URL1
$webBrowser2.Width = 200
$webBrowser2.Height = 150
$webBrowser2.Location = 1700, 501
$mainForm.Controls.Add($webBrowser2)


# First Select Checkbox
$selectCheckbox1 = New-Object System.Windows.Forms.Checkbox
$selectCheckbox1.Location = '910,120'
$selectCheckbox1.Checked = $true
$selectCheckbox1.add_Click({
     $webBrowser1.URL = $URL1
     $selectCheckbox2.Checked = $false
     $selectCheckbox3.Checked = $false
     })
$mainForm.Controls.Add($selectCheckbox1)
$mainForm.ShowDialog()