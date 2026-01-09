$baseUrl = "http://localhost:8080"
$headers = @{ "Content-Type" = "application/json" }

# 1. Test Endpoint Existence (Expect 401 Unauthorized)
# If we get 404, it means the endpoint doesn't exist (backend not restarted)
# If we get 401/403, it means the endpoint exists but is secured (Success for verification purpose)

Write-Host "[:] Testing Endpoint Existence: /library/borrow/stats" -ForegroundColor Cyan

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/library/borrow/stats" -Method Get -Headers $headers
    Write-Host "    [Unexpected] Got 200 OK without auth? Response: $($response | ConvertTo-Json -Depth 1)" -ForegroundColor Yellow
}
catch {
    # Check if it's 401/403 or 404
    if ($_.Exception.Response) {
        $statusCode = $_.Exception.Response.StatusCode
        $statusInt = [int]$statusCode
        
        if ($statusInt -eq 401 -or $statusInt -eq 403) {
            Write-Host "    [PASS] Endpoint exists and is secured ($statusCode)." -ForegroundColor Green
        }
        elseif ($statusInt -eq 404) {
            Write-Host "    [FAIL] Endpoint NOT FOUND (404). Backend might need restart." -ForegroundColor Red
        }
        else {
            Write-Host "    [INFO] Endpoint returned status $statusCode." -ForegroundColor Yellow
        }
    }
    else {
        Write-Host "    [FAIL] Connection failed: $_" -ForegroundColor Red
    }
}
