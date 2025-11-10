# WiFi Access Points REST API

## Quick Setup

1. Create the following directory structure:
   project/
   ├── .htaccess
   ├── config/
   │ └── database.php
   ├── models/
   │ ├── WifiAccessPoint.php
   │ └── Commune.php
   └── api/
   └── index.php

2. Copy each file from this document to its respective location

3. Import your SQL database file

4. Update database credentials in `config.php`

5. Test the API:

```bash
curl http://localhost/api/wifi_access_points
```

## Endpoints

- `GET /api/wifi_access_points` - Get all WiFi points
- `GET /api/wifi_access_points/1` - Get single WiFi point
- `GET /api/wifi_access_points?search=keyword` - Search WiFi points
- `POST /api/wifi_access_points` - Create WiFi point
- `PUT /api/wifi_access_points/1` - Update WiFi point
- `DELETE /api/wifi_access_points/1` - Delete WiFi point
- `GET /api/communes` - Get all communes
- `GET /api/communes/1` - Get single commune
- `POST /api/communes` - Create commune
- `PUT /api/communes/1` - Update commune
- `DELETE /api/communes/1` - Delete commune

## Requirements

- PHP 7.4+
- MySQL/MariaDB
- Apache with mod_rewrite enabled
- PDO MySQL extension
