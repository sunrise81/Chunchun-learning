# Validate index.html question format
# Check that opts is an array, not a string

$html = Get-Content index.html -Raw -Encoding UTF8

# Find opts:"..." patterns (wrong format)
$errorPattern = 'opts":"[^"]+"'

$errors = [regex]::Matches($html, $errorPattern)

if ($errors.Count -gt 0) {
    Write-Host "ERROR: Found $($errors.Count) format errors:" -ForegroundColor Red
    foreach ($e in $errors) {
        Write-Host "  $($e.Value)" -ForegroundColor Yellow
    }
    exit 1
} else {
    Write-Host "OK: Format check passed!" -ForegroundColor Green
    exit 0
}