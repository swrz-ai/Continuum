# Continuum-Monitor

**Enterprise Infrastructure Monitoring** | *v4.0*

[![Version](https://img.shields.io/badge/version-4.0-blue.svg)](https://github.com/swrz-ai/Continuum)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-green.svg)](https://github.com/swrz-ai/Continuum)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/swrz-ai/Continuum)
[![Discord](https://img.shields.io/badge/Discord-Join-5865F2.svg)](https://discord.gg/YOUR_INVITE_CODE)

Native Windows monitoring. Deploys in minutes. **90% lower cost** than traditional enterprise solutions.

⚡ **PowerShell-native architecture** | 📊 **Historical Graphs** | 📞 **Direct Support** | 🗄️ **365-Day Retention**

---

## ✨ Features

### 📊 Core Monitoring

| Feature | Description |
|---------|-------------|
| **Real-time dashboard** | Auto-refreshes every 5 seconds |
| **Multi-tenant support** | Monitor multiple clients from one dashboard |
| **Uptime Percentage** | Per-node uptime tracking with color coding (Green/Yellow/Red) |
| **Response Time** | Ping latency in milliseconds with speed indicators |
| **Historical Graphs** | 12-hour response time and uptime trends using Chart.js |

### 🗄️ Data Protection

| Feature | Description |
|---------|-------------|
| **365-Day Retention** | Automatic daily archiving with auto-delete after 1 year |
| **Archive Viewer** | Browse and view historical archives via web UI |
| **Audit Logging** | Track all dashboard access and failed attempts |

### 🔒 Security

| Feature | Description |
|---------|-------------|
| **SHA-256 Hashing** | API keys stored as hashes, not plain text |
| **Rate Limiting** | 60 requests per minute per IP |
| **Audit Trail** | Complete log of all access attempts |

### 📱 Access & Deployment

| Feature | Description |
|---------|-------------|
| **Mobile Responsive** | Works on phones, tablets, and desktops |
| **Desktop Shortcut** | One-click launch from desktop |
| **Scheduled Task** | Auto-start on Windows boot |
| **10-Minute Setup** | Single PowerShell script |

### 📞 Support & Contact

| Channel | Contact |
|---------|---------|
| **Email** | hello@continuum-monitor.com |
| **LinkedIn** | [Waseem Raza](https://www.linkedin.com/in/waseem-raza-b99752400/) |
| **Discord** | [Join our Discord Server](https://discord.gg/YOUR_INVITE_CODE) |
| **GitHub Issues** | [Technical support](https://github.com/swrz-ai/Continuum/issues) |

---

## 🚀 Quick Start

### Requirements

- Windows 10/11 or Windows Server 2016+
- PowerShell 5.1+ (built-in)
- Administrator access (recommended)
- No additional dependencies

### Installation

```powershell
# Download Continuum Monitor
# Save as Continuum.ps1

# Run Continuum Monitor
powershell -ExecutionPolicy Bypass -File Continuum.ps1

# Access dashboard
# Open browser to: http://localhost:18500/dashboard?tenant=Demo&key=demo-123
