# Email to Airtable Support

**To:** support@airtable.com  
**Subject:** API Pagination Issue - Unable to Access All Records Despite Team Plan (Base: apptH56xIB43Cf2r8)

---

Dear Airtable Support Team,

I am experiencing a critical API access limitation that is preventing me from accessing the full dataset in my Airtable base, despite being on a **Team Plan** with proper permissions.

## **Issue Summary**
- **Base ID**: `apptH56xIB43Cf2r8`
- **Table ID**: `tbl6FcXjgBqyHciOD` (Contacts Full)
- **Expected Records**: 17,007 (visible in Airtable interface)
- **API Accessible**: Only 200 records maximum via API
- **Account Plan**: Team Plan (should allow 50,000 records)

## **Problem Description**
The Airtable interface correctly displays all 17,007 contact records that were successfully uploaded via Excel import. However, when accessing the same data through the REST API, I can only retrieve a maximum of 200 records across 2 pages of pagination before the API stops returning offset tokens.

**Important Note**: I have reviewed your [API call limits documentation](https://support.airtable.com/docs/managing-api-call-limits-in-airtable) and confirmed this issue is **NOT related to documented rate limits or monthly call limits**. We are well under the 5 requests/second limit and not receiving any 429 status codes.

## **Technical Evidence**

### **Interface vs API Discrepancy:**
- ✅ **Airtable Interface**: Shows 17,007 contacts, all data visible and scrollable
- ❌ **REST API**: Returns maximum 200 records, then stops pagination

### **API Behavior Observed:**
```
GET /v0/apptH56xIB43Cf2r8/tbl6FcXjgBqyHciOD?maxRecords=200
Response: 100 records + offset token ✅

GET /v0/apptH56xIB43Cf2r8/tbl6FcXjgBqyHciOD?maxRecords=100&offset={token}
Response: 100 records + NO offset token ❌
```

### **Inconsistent Offset Behavior:**
- When requesting `maxRecords=200`: API returns offset token
- When using offset for pagination: API stops returning offset after page 2
- This suggests pagination logic is not working correctly for large datasets

### **Rate Limit Compliance:**
- ✅ **Request frequency**: <1 request/second (well under 5/second limit)
- ✅ **No 429 errors**: No rate limit violations detected
- ✅ **No monthly limit issues**: Team Plan monthly usage well within limits

## **What I've Tested**

1. **Multiple Pagination Methods**: Standard pagination, aggressive pagination, small batch sizes
2. **Different API Endpoints**: Table name vs direct table ID access
3. **Various Parameters**: Different sorting, filtering, field selection
4. **View Access**: Tested different views and metadata endpoints
5. **Account Verification**: Confirmed Team Plan status and permissions
6. **Rate Limit Verification**: Confirmed compliance with documented API limits

## **API Test Results**
```
✅ Base metadata access: Working
✅ Table metadata access: Working  
✅ First 100 records: Working
✅ Records 101-200: Working
❌ Records 201+: No offset returned, pagination stops
✅ Rate limits: No violations (well under 5 req/sec)
✅ Status codes: All 200 (no 429 errors)
```

## **Expected vs Actual Behavior**

**Expected (Team Plan):**
- Access to all 17,007 records via API pagination
- Consistent offset tokens until end of dataset
- Full compatibility between interface and API

**Actual:**
- API access limited to 200 records
- Pagination stops prematurely without offset
- Major discrepancy between interface (17,007) and API (200)

## **Impact on Business**
This limitation is preventing me from building a critical VC intelligence system that needs to process all contact data through API integrations. The system is designed to match contacts with VC companies using fuzzy logic, but cannot function with only 1.2% of the expected dataset.

## **Request for Resolution**
Since this issue is **not explained by your documented API limits**, could you please:

1. **Investigate** why the API pagination stops at 200 records when the interface shows 17,007
2. **Verify** if this is a known limitation or bug with large datasets on Team plans
3. **Provide** a solution or workaround to access all records via API
4. **Confirm** that Team Plan should indeed allow access to 17,007 records through the API

## **Technical Environment**
- **API Key**: `patOUfAsek4nbpvHm...` (Team Plan key)
- **Programming Language**: Python with requests library
- **Upload Method**: Excel file import through Airtable interface
- **Data Size**: 17,007 records across 14 fields (primarily text)

## **Additional Information**
I can provide API logs, code samples, or screen recordings demonstrating the issue if helpful. The base is accessible with the provided credentials for your technical team to investigate.

Thank you for your assistance in resolving this critical issue.

Best regards,

[Your Name]
[Your Email]
[Your Company]

---

**Attachment Suggestions:**
- Screenshots showing 17,007 records in interface
- API response logs showing pagination stopping at 200 records
- Code sample demonstrating the pagination issue 