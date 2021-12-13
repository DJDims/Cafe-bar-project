BACKUP DATABASE dbCafeBar TO DISK = 'CafeBarFullBackup.bak'

RESTORE DATABASE dbCafeBar FROM DISK = 'CafeBarFullBackup.bak'

RESTORE HEADERONLY FROM DISK = 'CafeBarFullBackup.bak'