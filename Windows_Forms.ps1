Cls
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Width = 400
$mainForm.Height = 480
$mainForm.StartPosition = "CenterScreen";
$mainForm.Text = "Config appsettings local";
$mainForm.FormBorderStyle = "SizableToolWindow";

$webBrowser = New-Object System.Windows.Forms.WebBrowser
$webBrowser.IsWebBrowserContextMenuEnabled = $true
$webBrowser.URL = 'http://localhost/ConfigAppsetting/index.html'
$webBrowser.ScriptErrorsSuppressed = $true;
$webBrowser.Dock = "Fill"
$webBrowser.IsWebBrowserContextMenuEnabled = $false;


$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(10, 400)
$button.Size = New-Object System.Drawing.Size(120,23)
$button.Text = "Gerar arquivo";
$button.Add_Click(
    {        
        $appsettings = $webBrowser.Document.GetElementById("appsettings").GetAttribute("innerHTML")

        $json.ConnectionStrings.DefaultConnection = [System.Convert]::ToBase64String(
               [System.Text.UTF8Encoding]::UTF8.GetBytes($json.ConnectionStrings.DefaultConnection))

        
        $json | ConvertTo-Json -depth 100 | Out-File "c:\Temp\\file.json"
    })

$mainForm.Controls.Add($button)
$mainForm.Controls.Add($webBrowser)
$mainForm.ShowDialog()