# Continuum - Enterprise Infrastructure Monitoring

PowerShell-native infrastructure monitoring system. Real-time dashboard, multi-tenant, 90% cheaper than traditional enterprise solutions.

![Version](https://img.shields.io/badge/version-4.0-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-green)
![License](https://img.shields.io/badge/license-MIT-brightgreen)

---

## Features

### Core Monitoring
- ✅ **Real-time dashboard** - 5-second auto-refresh
- ✅ **Multi-type monitoring** - Ping, HTTP, HTTPS, Port, Service
- ✅ **Multi-tenant support** - Monitor multiple clients from one dashboard
- ✅ **Instant alerts** - Email notifications on status change
- 
- ### Data Protection
- ✅ **Auto-backup** - Hourly backups of Continuum configuration (30-day retention)
- ✅ **1-Year Data Retention** - Archive server status history for compliance and trend analysis (365-day retention)

### Data & Reports
- ✅ **CSV/JSON/HTML export** - One-click report generation
- ✅ **1-year data retention** - Automatic monthly archiving
- ✅ **Auto-backup** - Hourly backups, 30-day retention
- ✅ **Scheduled daily reports** - Automatic email reports

### Advanced Features
- ✅ **Mobile responsive dashboard** - Works on phones and tablets
- ✅ **Enhanced health check** - Detailed system status endpoint
- ✅ **Maintenance windows** - Schedule downtime without alerts
- ✅ **Multi-channel alerts** - Email, Telegram, Slack, Teams, Discord

---

## Quick Start

### Requirements
- Windows 10/11 or Windows Server 2016+
- PowerShell 5.1+ (built-in)
- No additional dependencies

### Installation

```powershell
# Clone the repository
git clone https://github.com/swrz-ai/Continuum.git
cd Continuum

# Run Continuum
.\Continuum_Final.ps1
