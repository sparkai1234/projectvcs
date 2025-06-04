# Screenshots for Airtable Support Email

These screenshots will help demonstrate the interface vs API discrepancy:

## Screenshot 1: Airtable Interface Showing All Records
**What to capture:**
- Full Airtable interface showing the "Contacts Full" table
- Record count showing **17,007 records** in the bottom status bar
- Korean field names visible (이름, 회사, 직함, etc.)
- Multiple pages of data scrollable
- URL showing Base ID: `apptH56xIB43Cf2r8`

**How to take:**
1. Open https://airtable.com/apptH56xIB43Cf2r8/tbl6FcXjgBqyHciOD
2. Ensure full table view is visible
3. Look for record count at bottom (should show "17,007 records")
4. Take full browser screenshot

## Screenshot 2: API Response in Browser/Postman
**What to capture:**
- API request to: `https://api.airtable.com/v0/apptH56xIB43Cf2r8/tbl6FcXjgBqyHciOD?maxRecords=100`
- Response showing only 100 records with offset
- Second request using offset token
- Third request showing no more offset available

**How to take:**
1. Use Postman or browser dev tools
2. Make API requests as shown above
3. Screenshot each response showing the pagination issue

## Screenshot 3: Team Plan Verification
**What to capture:**
- Airtable account settings showing Team Plan status
- API key management page showing proper permissions
- Usage dashboard showing no limit violations

**File naming for email:**
- `interface_17007_records.png`
- `api_pagination_issue.png` 
- `team_plan_status.png`

## Alternative: Screen Recording
Consider creating a short screen recording (2-3 minutes) showing:
1. Interface with all 17,007 records
2. API testing showing only 200 records accessible
3. Pagination stopping after page 2

This provides even stronger evidence of the discrepancy. 