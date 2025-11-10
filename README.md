# WiFi Access Points REST API

## Project Structure

```
wifi-api/
├── config.php      # Database configuration
├── functions.php   # Helper functions (echo_json, printr)
├── headers.php     # Header management functions
├── index.php       # Main API entry point
└── README.md       # This file
```

## Quick Setup

1. Ensure you have the following files in your project directory:

   - `config.php` - Database configuration
   - `functions.php` - Helper functions
   - `headers.php` - Header management
   - `index.php` - Main API file

2. Import your SQL database file (see [Import Database](#import-database) section below)

3. Update database credentials in `config.php`:

   - `DB_HOST` - Database host (default: localhost)
   - `DB_NAME` - Database name (default: training_ws_three)
   - `DB_USER` - Database user (default: root)
   - `DB_PASS` - Database password (default: empty)

4. Test the API:

```bash
# Get all WiFi access points
curl http://localhost/wifi-api/index.php?route=wifi_access_points

# Get documentation
curl http://localhost/wifi-api/index.php?route=
```

## Import Database

Before using the API, you need to import the database SQL file. The database name should be `training_ws_three` (or update the `DB_NAME` in `config.php` to match your database name).

### Method 1: Using phpMyAdmin (Recommended for XAMPP/WAMP)

1. Open phpMyAdmin in your browser (usually `http://localhost/phpmyadmin`)

2. Click on "New" in the left sidebar to create a new database

3. Enter the database name: `training_ws_three`

4. Select "utf8_general_ci" or "utf8mb4_general_ci" as the collation

5. Click "Create"

6. Select the newly created database from the left sidebar

7. Click on the "Import" tab at the top

8. Click "Choose File" and select your `.sql` file

9. Click "Go" at the bottom to import the database

### Method 2: Using MySQL Command Line

1. Open your terminal/command prompt

2. Navigate to the directory containing your `.sql` file

3. Run the following command (replace `username` and `password` with your MySQL credentials):

```bash
mysql -u username -p training_ws_three < database.sql
```

Or if you need to create the database first:

```bash
mysql -u username -p -e "CREATE DATABASE training_ws_three;"
mysql -u username -p training_ws_three < database.sql
```

### Method 3: Using MySQL Workbench

1. Open MySQL Workbench and connect to your MySQL server

2. Go to `Server` → `Data Import`

3. Select "Import from Self-Contained File" and browse to your `.sql` file

4. Under "Default Target Schema", select `training_ws_three` or create a new schema with that name

5. Click "Start Import"

### Verify Database Import

After importing, verify that the following tables exist:

- `wifi_access_points` - Contains WiFi access point data
- `communes` - Contains commune data

You can verify by running:

```bash
mysql -u username -p -e "USE training_ws_three; SHOW TABLES;"
```

## API Endpoints

The API uses query parameters to specify routes and IDs. All responses are in JSON format.

### WiFi Access Points

- `GET ?route=wifi_access_points` - Get all WiFi access points
- `GET ?route=wifi_access_points&id=1` - Get single WiFi access point by ID
- `POST ?route=wifi_access_points` - Create new WiFi access point (requires JSON body)
- `PUT ?route=wifi_access_points&id=1` - Update WiFi access point (requires JSON body and ID)
- `DELETE ?route=wifi_access_points&id=1` - Delete WiFi access point by ID

### Communes

- `GET ?route=communes` - Get all communes
- `GET ?route=communes&id=1` - Get single commune by ID
- `POST ?route=communes` - Create new commune (requires JSON body)
- `PUT ?route=communes&id=1` - Update commune (requires JSON body and ID)
- `DELETE ?route=communes&id=1` - Delete commune by ID

### Documentation

- `GET ?route=` - Get API documentation with all available endpoints

## Example Requests

```bash
# Get all WiFi access points
curl http://localhost/wifi-api/index.php?route=wifi_access_points

# Get single WiFi access point
curl http://localhost/wifi-api/index.php?route=wifi_access_points&id=1

# Create new WiFi access point
curl -X POST http://localhost/wifi-api/index.php?route=wifi_access_points \
  -H "Content-Type: application/json" \
  -d '{"name":"WiFi Point","address":"123 Main St"}'

# Update WiFi access point
curl -X PUT http://localhost/wifi-api/index.php?route=wifi_access_points&id=1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Updated WiFi Point"}'

# Delete WiFi access point
curl -X DELETE http://localhost/wifi-api/index.php?route=wifi_access_points&id=1
```

## Response Format

All responses follow a consistent JSON format:

**Success Response:**

```json
{
  "hits": 1,
  "route": "wifi_access_points",
  "data": [...]
}
```

**Error Response:**

```json
{
	"message": "Error description",
	"code": "Error Code",
	"route": "wifi_access_points"
}
```

## Requirements

- PHP 7.4+
- MySQL/MariaDB
- PDO MySQL extension
