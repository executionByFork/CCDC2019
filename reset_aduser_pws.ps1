Import-Module ActiveDirectory
Add-Type -Assembly System.Web

$group = Read-Host -Prompt 'Input the group you want to change the users passwords in'
Write-Host "The group you selected is $group. Changing passwords now."

$adGroupMemberList = Get-ADGroupMember -Identity "$group"

foreach($user in $adGroupMemberList) {
    $newPassword = [Web.Security.Membership]::GeneratePassword(32,8)
    Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $newPassword -Force)
}