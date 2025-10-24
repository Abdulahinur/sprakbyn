# Autopush för Språkbyn – var 5:e sekund, robust & självgående
$branch = "wip/live"
$intervalSeconds = 5

Set-Location "C:\Users\abdu_\sprakbyn"

git rev-parse --is-inside-work-tree 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) { exit 1 }

$cur = (git branch --show-current).Trim()
if ($cur -ne $branch) {
  git checkout -B $branch | Out-Null
  git push -u origin $branch 2>$null | Out-Null
}

function Test-Online {
  try { Test-NetConnection github.com -Port 443 -InformationLevel Quiet } catch { $false }
}

while ($true) {
  try {
    if (Test-Online) {
      git fetch origin | Out-Null
      git rev-parse --verify origin/$branch 2>$null | Out-Null
      if ($LASTEXITCODE -eq 0) { git rebase origin/$branch | Out-Null }
    }

    $status = git status --porcelain
    if ($status) {
      git add . | Out-Null
      $msg = "auto: $(Get-Date -Format o) on $env:COMPUTERNAME"
      git commit -m $msg | Out-Null

      if (Test-Online) {
        git push | Out-Null
        Add-Content -Path "C:\Users\abdu_\sprakbyn\autopush.log" -Value "Pushed: $msg"
      } else {
        Add-Content -Path "C:\Users\abdu_\sprakbyn\autopush.log" -Value "Offline: $(Get-Date -Format o)"
      }
    }
  } catch {
    Add-Content -Path "C:\Users\abdu_\sprakbyn\autopush.log" -Value "Fel: $($_.Exception.Message)"
    git rebase --abort 2>$null | Out-Null
  }

  Start-Sleep -Seconds $intervalSeconds
}

