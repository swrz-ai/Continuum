# Continuum Monitor

📄 **MIT Licensed** - Free for commercial use, modification, and distribution.

## Cross-Platform Infrastructure Monitoring | v5.0

![Version](https://img.shields.io/badge/version-5.0-green)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue)
![License](https://img.shields.io/badge/license-MIT-orange)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey)
![Discord](https://img.shields.io/badge/discord-join-7289da)
[![Website](https://img.shields.io/badge/Website-Continuum_Monitor-blue?logo=githubpages)](https://swrz-ai.github.io/Continuum-Monitor/)

**Monitor anything, anywhere. Deploys in minutes. Up to 95% lower cost than traditional enterprise solutions.**

⚡ **PowerShell-native** | 🐧 **Cross-Platform** | 📊 **Interactive Graphs** | 💬 **Slack & Discord** | 🤖 **AI-Ready**

---

## 🤖 AI-Ready Infrastructure Monitoring

Continuum Monitor is built differently:

| Feature | Benefit |
|---------|---------|
| **Infrastructure-based pricing** | Monitor unlimited nodes, no per-seat costs |
| **System of Record** | Immutable audit logs and 365-day retention for compliance and AI training |
| **API-first ready** | Easy integration with AI agents and automation workflows |
| **Self-hosted** | Your monitoring data stays on your infrastructure |
| **95% lower cost** | Compare: traditional infrastructure solutions vs Continuum ($99/month unlimited hosts) |

> *"Continuum Monitor monitors the infrastructure that powers your business."*

---

## ✨ Features

### 📊 Monitoring Capabilities
| Category | Features |
|----------|----------|
| **Operating Systems** | Windows, Linux, macOS |
| **Ports & Services** | SSH (22), MySQL (3306), PostgreSQL (5432), RDP (3389), any TCP port |
| **Web Services** | HTTP/HTTPS endpoints, APIs, websites |
| **Security** | SSL certificate expiry tracking |

### 📈 Analytics & Visualization
| Category | Features |
|----------|----------|
| **Uptime Tracking** | Per-node percentage with color coding (Green/Yellow/Red) |
| **Response Time** | Ping latency in milliseconds with speed indicators |
| **Interactive Graphs** | Chart.js with zoom, pan, and double-click reset |
| **Data Retention** | 365-day automatic archiving with auto-delete |



### 🔔 Alerts & Notifications
| Channel | Support |
|---------|---------|
| **Console** | Real-time status changes |
| **Email** | Coming in v5.1 |

---

## 🔒 Security Features

| Feature | Description | Status |
|---------|-------------|--------|
| **IP Whitelisting** | Restrict access to specific IP addresses/ranges | ✅ Optional |
| **HTTPS Support** | SSL/TLS encryption for secure dashboard access | ✅ Optional |
| **Rate Limiting** | 60 requests/minute per IP to prevent abuse | ✅ Active |
| **Audit Logging** | Complete access logs with timestamps and IPs | ✅ Active |
| **SHA-256 Hashing** | API keys encrypted, never stored in plain text | ✅ Active |
| **Security Headers** | CSP, X-Frame-Options, XSS protection | ✅ Active |
| **Multi-tenant Isolation** | Separate API keys and data per client | ✅ Active |

---

## 🏭 Industrial IoT Monitoring (NEW in v5.0)

Monitor industrial equipment alongside your IT infrastructure:

**Supported Protocols:**
- 🔌 **Modbus TCP** - PLCs, sensors, flow meters, pressure gauges
- 📡 **SNMP** - Industrial routers, power monitors, network devices
- 🏭 **Factory floor monitoring** - SCADA integration

## Quick Start

```powershell
# Download the stable IoT version
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/swrz-ai/Continuum-Monitor/main/Continuum_IoT_Stable.ps1" -OutFile "Continuum_Monitor.ps1"

# Run it
powershell -ExecutionPolicy Bypass -File "Continuum_Monitor.ps1"
