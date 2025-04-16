$AuditAdmin = @(
 "ApplyRecord", "Copy", "Create", "FolderBind", "HardDelete", "Move",
 "MoveToDeletedItems", "SendAs", "SendOnBehalf", "SoftDelete", "Update",
 "UpdateCalendarDelegation", "UpdateFolderPermissions", "UpdateInboxRules"
)

$AuditDelegate = @(
 "ApplyRecord", "Create", "FolderBind", "HardDelete", "Move", 
 "MoveToDeletedItems", "SendAs", "SendOnBehalf", "SoftDelete", "Update",
 "UpdateFolderPermissions", "UpdateInboxRules"
)

$AuditOwner = @(
 "ApplyRecord", "Create", "HardDelete", "MailboxLogin", "Move",
 "MoveToDeletedItems", "SoftDelete", "Update", "UpdateCalendarDelegation",
 "UpdateFolderPermissions", "UpdateInboxRules"
)

$MBX = Get-EXOMailbox -ResultSize Unlimited | Where-Object { $_.RecipientTypeDetails -eq "UserMailbox" }
$MBX | Set-Mailbox -AuditEnabled $true `
-AuditLogAgeLimit 90 -AuditAdmin $AuditAdmin -AuditDelegate $AuditDelegate `
-AuditOwner $AuditOwner
