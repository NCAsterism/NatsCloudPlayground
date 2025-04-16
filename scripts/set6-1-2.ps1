$AdminActions = @(
 "ApplyRecord", "Copy", "Create", "FolderBind", "HardDelete",
 "Move", "MoveToDeletedItems", "SendAs", "SendOnBehalf", "SoftDelete",
 "Update", "UpdateCalendarDelegation", "UpdateFolderPermissions", 
 "UpdateInboxRules"
 )

$DelegateActions = @(
 "ApplyRecord", "Create", "FolderBind", "HardDelete", "Move", 
 "MoveToDeletedItems", "SendAs", "SendOnBehalf", "SoftDelete", "Update",
 "UpdateFolderPermissions", "UpdateInboxRules"
)

$OwnerActions = @(
 "ApplyRecord", "Create", "HardDelete", "MailboxLogin", "Move",
 "MoveToDeletedItems", "SoftDelete", "Update", "UpdateCalendarDelegation",
 "UpdateFolderPermissions", "UpdateInboxRules"
)

function VerifyActions {
 param (
 [string]$type,
 [array]$actions,
 [array]$auditProperty,
 [string]$mailboxName
 )

 $missingActions = @()
 $actionCount = 0

 foreach ($action in $actions) {
 if ($auditProperty -notcontains $action) {
 $missingActions += " Failure: Audit action '$action' missing from $type"
 $actionCount++
 }
 }

 if ($actionCount -eq 0) {
 Write-Host "[$mailboxName]: $type actions are verified." -ForegroundColor Green
 } else {
 Write-Host "[$mailboxName]: $type actions are not all verified." -ForegroundColor Red
 foreach ($missingAction in $missingActions) {
 Write-Host " $missingAction" -ForegroundColor Red
 }
 }
}

$mailboxes = Get-EXOMailbox -PropertySets Audit,Minimum -ResultSize Unlimited | 
 Where-Object { $_.RecipientTypeDetails -eq "UserMailbox" }

foreach ($mailbox in $mailboxes) {
 Write-Host "--- Now assessing [$($mailbox.UserPrincipalName)] ---"

 if ($mailbox.AuditEnabled) {
 Write-Host "[$($mailbox.UserPrincipalName)]: AuditEnabled is true" -ForegroundColor Green
 } else {
 Write-Host "[$($mailbox.UserPrincipalName)]: AuditEnabled is false" -ForegroundColor Red
 }

 VerifyActions -type "AuditAdmin" -actions $AdminActions -auditProperty $mailbox.AuditAdmin `
 -mailboxName $mailbox.UserPrincipalName
 VerifyActions -type "AuditDelegate" -actions $DelegateActions -auditProperty $mailbox.AuditDelegate `
 -mailboxName $mailbox.UserPrincipalName
 VerifyActions -type "AuditOwner" -actions $OwnerActions -auditProperty $mailbox.AuditOwner `
 -mailboxName $mailbox.UserPrincipalName

 Write-Host
}
