function Prompt-YesNoCancel ($title, $message) {
    
    [console]::Beep(5000,100);[console]::Beep(5000,100);[console]::Beep(5000,100);[console]::Beep(5000,100);

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $title
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = 'CenterScreen'

    $YesButton = New-Object System.Windows.Forms.Button
    $YesButton.Location = New-Object System.Drawing.Point(25,120)
    $YesButton.Size = New-Object System.Drawing.Size(75,23)
    $YesButton.Text = 'YES'
    $YesButton.DialogResult = [System.Windows.Forms.DialogResult]::Yes
    $form.AcceptButton = $YesButton
    $form.Controls.Add($YesButton)

    $NoButton = New-Object System.Windows.Forms.Button
    $NoButton.Location = New-Object System.Drawing.Point(100,120)
    $NoButton.Size = New-Object System.Drawing.Size(75,23)
    $NoButton.Text = 'No'
    $NoButton.DialogResult = [System.Windows.Forms.DialogResult]::No
    $form.AcceptButton = $NoButton
    $form.Controls.Add($NoButton)

    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Location = New-Object System.Drawing.Point(175,120)
    $cancelButton.Size = New-Object System.Drawing.Size(75,23)
    $cancelButton.Text = 'Cancel'
    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.CancelButton = $cancelButton
    $form.Controls.Add($cancelButton)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(280,20)
    $label.Text = $message
    $form.Controls.Add($label)

    #$textBox = New-Object System.Windows.Forms.TextBox
    #$textBox.Location = New-Object System.Drawing.Point(10,40)
    #$textBox.Size = New-Object System.Drawing.Size(260,20)
    #$form.Controls.Add($textBox)

    $form.Topmost = $true

    #$form.Add_Shown({$textBox.Select()})
    $result = $form.ShowDialog()
    Return $result
}
