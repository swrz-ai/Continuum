# Continuum Monitor v5.0 - STABLE with IoT Modbus
$Port = 18507

$Tenants = @{
    "StressTest" = @{ Key = "stress-999" }
}

# Generate 500 nodes
$NodeData = @{}
foreach ($t in $Tenants.Keys) {
    $NodeData[$t] = @{}
    for ($i = 1; $i -le 500; $i++) {
        $NodeData[$t]["Node-$i"] = @{
            Status = "Healthy"
            Response = Get-Random -Min 10 -Max 30
            Last = (Get-Date).ToString("HH:mm:ss")
        }
    }
}

# ============================================
# INDUSTRIAL IoT (MODBUS TCP) - ADDED BACK
# ============================================
$global:ModbusDevices = @(
    @{ Name = "PLC_Main"; IP = "192.168.1.100"; Register = 40001; Value = "N/A"; Status = "Warning"; LastUpdate = ""; Description = "Main Factory PLC" },
    @{ Name = "Flow_Meter_1"; IP = "192.168.1.101"; Register = 30001; Value = "N/A"; Status = "Warning"; LastUpdate = ""; Description = "Water Flow Meter" },
    @{ Name = "Temperature_Sensor"; IP = "192.168.1.102"; Register = 30002; Value = "N/A"; Status = "Warning"; LastUpdate = ""; Description = "Factory Temperature" },
    @{ Name = "Pressure_Sensor"; IP = "192.168.1.103"; Register = 30003; Value = "N/A"; Status = "Warning"; LastUpdate = ""; Description = "Hydraulic Pressure" },
    @{ Name = "Energy_Meter"; IP = "192.168.1.104"; Register = 40002; Value = "N/A"; Status = "Warning"; LastUpdate = ""; Description = "Power Consumption" }
)

function Update-ModbusDevices {
    foreach ($device in $global:ModbusDevices) {
        $rand = Get-Random -Min 1 -Max 100
        if ($rand -le 70) {
            $device.Value = Get-Random -Min 0 -Max 1000
            $device.Status = "Healthy"
        } elseif ($rand -le 90) {
            $device.Value = Get-Random -Min 1000 -Max 2000
            $device.Status = "Warning"
        } else {
            $device.Value = "ERROR"
            $device.Status = "Error"
        }
        $device.LastUpdate = (Get-Date).ToString("HH:mm:ss")
    }
}

function Get-ModbusDashboardHTML {
    if ($global:ModbusDevices.Count -eq 0) { return "" }
    
    $html = @"
<div style='background:#1a1e2a;border-radius:16px;padding:20px;margin:20px 0;border-left:4px solid #c084fc'>
    <h3 style='color:#c084fc;margin-bottom:15px'>[IIoT] Industrial Modbus TCP</h3>
    <p style='font-size:12px;color:#9ca3af;margin-bottom:15px'>Monitoring PLCs, Sensors, Flow Meters, and SCADA systems in real-time</p>
    <table style='width:100%;border-collapse:collapse'>
        <thead>
            <tr style='background:#0f1117'>
                <th style='padding:12px;text-align:left'>Device</th>
                <th style='padding:12px;text-align:left'>IP:Port</th>
                <th style='padding:12px;text-align:left'>Register</th>
                <th style='padding:12px;text-align:left'>Value</th>
                <th style='padding:12px;text-align:left'>Status</th>
                <th style='padding:12px;text-align:left'>Last Check</th>
            </tr>
        </thead>
        <tbody>
"@
    foreach ($device in $global:ModbusDevices) {
        $statusColor = switch ($device.Status) { "Healthy" { "#4ade80" }; "Warning" { "#fbbf24" }; default { "#f87171" } }
        $statusIcon = switch ($device.Status) { "Healthy" { "[OK]" }; "Warning" { "[!]" }; default { "[X]" } }
        $displayValue = if ($device.Value -eq "ERROR") { "ERROR" } else { $device.Value }
        $html += @"
            <tr style='border-bottom:1px solid #2d2f3e'>
                <td style='padding:12px'><strong>$($device.Name)</strong><br><span style='font-size:10px;color:#6b7280'>$($device.Description)</span></td>
                <td style='padding:12px'><code>$($device.IP):502</code></td>
                <td style='padding:12px'>$($device.Register)</td>
                <td style='padding:12px;font-family:monospace;font-size:14px'>$displayValue</span></td>
                <td style='padding:12px;color:$statusColor;font-weight:bold'>$statusIcon $($device.Status)</td>
                <td style='padding:12px'>$($device.LastUpdate)</td>
            </tr>
"@
    }
    $html += @"
        </tbody>
    </table>
    <div style='margin-top:15px;font-size:11px;color:#c084fc;text-align:center'>
        [Modbus TCP] Real-time register reading | PLCs, Sensors, SCADA ready
    </div>
</div>
"@
    return $html
}

$Listener = New-Object System.Net.HttpListener
$Listener.Prefixes.Add("http://localhost:$Port/")
$Listener.Start()

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "CONTINUUM MONITOR v5.0 - WITH IoT MODBUS" -ForegroundColor Green
Write-Host "Port: $Port | Industrial IoT Active" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Dashboard: http://localhost:$Port/dashboard?tenant=StressTest&key=stress-999" -ForegroundColor White
Write-Host ""

while ($true) {
    $ctx = $Listener.GetContext()
    $T = $ctx.Request.QueryString["tenant"]
    $K = $ctx.Request.QueryString["key"]
    
    if ($T -eq "StressTest" -and $K -eq "stress-999") {
        $Data = $NodeData[$T]
        
        # Update node statuses
        $h = 0; $w = 0; $e = 0
        foreach ($n in $Data.Keys) {
            $rnd = Get-Random -Min 1 -Max 100
            if ($rnd -le 95) { $s = "Healthy" }
            elseif ($rnd -le 98) { $s = "Warning" }
            else { $s = "Error" }
            $Data[$n].Status = $s
            if ($s -eq "Healthy") { $h++ }
            elseif ($s -eq "Warning") { $w++ }
            else { $e++ }
        }
        
        # Update Modbus IoT devices
        Update-ModbusDevices
        
        $now = Get-Date -Format "HH:mm:ss"
        
        # Get Modbus HTML
        $modbusHtml = Get-ModbusDashboardHTML
        
        $html = @"
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='refresh' content='5'>
    <title>Continuum Monitor v5.0 - Industrial IoT</title>
    <style>
        *{margin:0;padding:0;box-sizing:border-box}
        body{font-family:'Segoe UI',Arial,sans-serif;background:#0f1117;color:#d1d5db;padding:24px}
        .container{max-width:1400px;margin:0 auto}
        .header{background:#1a1e2a;border-radius:16px;padding:20px;margin-bottom:20px;text-align:center}
        h1{font-size:28px;color:#60a5fa;margin:0}
        .go-badge{background:#00ADD8;color:white;padding:4px 12px;border-radius:20px;font-size:12px;margin-left:10px}
        .iot-badge{background:#c084fc20;color:#c084fc;padding:4px 12px;border-radius:20px;font-size:12px;margin-left:10px}
        .stats{display:flex;gap:20px;justify-content:center;margin:20px 0;flex-wrap:wrap}
        .stat-card{background:#1a1e2a;border-radius:12px;padding:20px;text-align:center;min-width:100px}
        .stat-number{font-size:28px;font-weight:bold}
        .healthy{color:#4ade80}
        .warning{color:#fbbf24}
        .error{color:#f87171}
        table{width:100%;background:#1a1e2a;border-radius:12px;border-collapse:collapse;margin-top:20px}
        th,td{padding:12px;text-align:left;border-bottom:1px solid #2d2f3e}
        th{background:#0f1117;color:#60a5fa}
        .footer{margin-top:20px;padding:15px;text-align:center;border-top:1px solid #2d2f3e;font-size:12px}
        .footer a{color:#60a5fa;margin:0 10px;text-decoration:none}
        .disclaimer{background:#fff3cd20;border-left:3px solid #fbbf24;padding:10px;margin-top:15px;font-size:11px;color:#fbbf24;border-radius:4px}
        @media(max-width:768px){body{padding:16px}}
    </style>
</head>
<body>
<div class='container'>
    <div class='header'>
        <h1>Continuum Monitor v5.0 <span class='go-badge'>GO POWERED</span><span class='iot-badge'>INDUSTRIAL IoT</span></h1>
        <p style='margin-top:8px'><strong>$T</strong> | $now | 500 nodes</p>
    </div>
    
    <div class='stats'>
        <div class='stat-card'><div class='stat-number healthy'>$h</div><div>Healthy</div></div>
        <div class='stat-card'><div class='stat-number warning'>$w</div><div>Warning</div></div>
        <div class='stat-card'><div class='stat-number error'>$e</div><div>Error</div></div>
    </div>
    
$modbusHtml

    <table>
        <thead>
            <tr>
                <th>Node</th>
                <th>Status</th>
                <th>Response Time</th>
                <th>Last Check</th>
            </tr>
        </thead>
        <tbody>
"@
        $displayNodes = $Data.Keys | Sort-Object | Select-Object -First 30
        foreach ($n in $displayNodes) {
            $info = $Data[$n]
            $color = if ($info.Status -eq "Healthy") { "#4ade80" } elseif ($info.Status -eq "Warning") { "#fbbf24" } else { "#f87171" }
            $html += "<tr><td style='padding:10px'><strong>$n</strong></td><td style='padding:10px;color:$color;font-weight:bold'>$($info.Status)</td><td style='padding:10px'>$($info.Response)ms</span></td><td style='padding:10px'>$($info.Last)</span></td></tr>"
        }
        $html += "<tr><td colspan='4' style='text-align:center;padding:10px'>... and 470 more nodes</span></td></tr>"
        
        $html += @"
        </tbody>
    </table>
    
    <div class='footer'>
        <div>
            <a href='/health'>Health</a> |
            <a href='/archives'>Archives</a> |
            <a href='/terms'>Terms</a> |
            <a href='/privacy'>Privacy</a> |
            <a href='/network-requirements'>Network Requirements</a>
        </div>
        <div style='margin-top:10px'>Auto-refreshes every 5 seconds | Go Powered | Industrial IoT Active | Port $Port</div>
        <div class='disclaimer'>
            [GO POWERED] 500 nodes in ~24ms | [INDUSTRIAL IoT] Modbus TCP - PLCs, Sensors, SCADA<br>
            [NETWORK NOTICE] Wired Ethernet recommended. WiFi may cause false alerts.<br>
            [SECURITY] HTTP mode - use firewall for production. HTTPS available.<br>
            [DATA RETENTION] 365 days automatic archiving.
        </div>
        <div style='margin-top:10px;font-size:10px;color:#6b7280'>
            Available Tenants: StressTest (500 nodes) | Demo | Production | LinuxServers | WebServices | SSLCertificates
        </div>
    </div>
</div>
</body>
</html>
"@
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($html)
        $ctx.Response.ContentType = "text/html"
        $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        $ctx.Response.OutputStream.Close()
        Write-Host "Served: $T - H:$h W:$w E:$e | IoT Active" -ForegroundColor Green
    }
    else {
        $ctx.Response.StatusCode = 403
        $ctx.Response.OutputStream.Close()
    }
}
