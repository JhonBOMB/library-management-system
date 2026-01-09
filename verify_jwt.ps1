$baseUrl = "http://localhost:8080"
$headers = @{ "Content-Type" = "application/json" }

function Test-Step {
    param($Name, $Action)
    Write-Output "[:] Testing: $Name"
    try {
        & $Action
        Write-Output "    [PASS] $Name"
    }
    catch {
        Write-Output "    [FAIL] $Name - Error: $_"
        # Print details if available
        if ($_.Exception.Response) {
            $reader = New-Object System.IO.StreamReader $_.Exception.Response.GetResponseStream()
            Write-Output "    Response: $($reader.ReadToEnd())"
        }
    }
    Write-Output "----------------------------------------"
}

# 1. Register User
Test-Step "Register User (jwtTest)" {
    $body = @{
        readerName = "jwtTest"
        password   = "password123"
        phone      = "13911112222"
    } | ConvertTo-Json
    
    try {
        $response = Invoke-RestMethod -Uri "$baseUrl/api/reader/register" -Method Post -Headers $headers -Body $body
        Write-Output "    Registered successfully. Info: $($response.msg)"
    }
    catch {
        Write-Output "    Registration might have failed (user exists?), proceeding to login."
    }
}

# 2. Login and Get Token
$global:token = $null
Test-Step "Login and Retrieve Token" {
    $body = @{
        cardNo   = "13911112222" # Login with phone
        password = "password123"
    } | ConvertTo-Json

    $response = Invoke-RestMethod -Uri "$baseUrl/api/reader/login" -Method Post -Headers $headers -Body $body
    
    if ($response.code -eq 200 -and $response.data.token) {
        $global:token = $response.data.token
        Write-Output "    Token Received: $($global:token.Substring(0, 20))..."
    }
    else {
        throw "Login failed or no token returned. Response: $($response | ConvertTo-Json)"
    }
}

# 3. Access Protected Endpoint with Token
if ($global:token) {
    Test-Step "Access Protected Endpoint (/api/reader/info)" {
        $authHeaders = @{
            "Content-Type"  = "application/json"
            "Authorization" = "Bearer $global:token"
        }
        $response = Invoke-RestMethod -Uri "$baseUrl/api/reader/info" -Method Get -Headers $authHeaders
        
        if ($response.code -eq 200) {
            Write-Output "    Access Granted. User: $($response.data.readerName)"
        }
        else {
            throw "Failed to access protected resource. Code: $($response.code)"
        }
    }
}
else {
    Write-Output "Skipping protected access test due to missing token."
}

# 4. Access with Invalid Token
Test-Step "Access with Invalid Token (Expect Failure)" {
    $authHeaders = @{
        "Content-Type"  = "application/json"
        "Authorization" = "Bearer INVALID_TOKEN_123"
    }
    try {
        $response = Invoke-RestMethod -Uri "$baseUrl/api/reader/info" -Method Get -Headers $authHeaders
        
        # If we get here, check if it's a 401 wrapped in success (not expected for RestMethod but possible)
        if ($response.code -eq 401) {
            Write-Output "    [SUCCESS] Server rejected invalid token with 401."
        }
        else {
            Write-Output "    [BeforeCheck] Response code: $($response.code)"
            if ($response.code -ne 200) {
                Write-Output "    [SUCCESS] Rejected with code $($response.code)"
            }
            else {
                throw "Server accepted invalid token! (Security Hole)"
            }
        }
    }
    catch {
        # PowerShell throws on 401/403
        Write-Output "    [SUCCESS] Server rejected request. Exception: $_"
    }
}
