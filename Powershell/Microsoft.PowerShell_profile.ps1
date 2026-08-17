Invoke-Expression (& { (zoxide init powershell | Out-String) })

function .. { z '..' }
function ... { z '../..' }

function touch { New-Item -ItemType File -Name @args -Path . }

function ser { winget search $args }
