#!/usr/bin/env python3
"""
DIVA Personnel Data Scraper
Extracts investment portfolio and personnel data from DIVA portal
Based on actual HTML structure analysis
"""

import requests
import re
import time
import json
from bs4 import BeautifulSoup
from urllib.parse import urljoin
import pandas as pd
from datetime import datetime
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class DIVAPersonnelScraper:
    def __init__(self):
        self.base_url = "http://diva.kvca.or.kr"
        self.personnel_url = "/div/dii/DivItmMnpwrInq"
        self.session = requests.Session()
        
        # Set headers to mimic browser
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'ko-KR,ko;q=0.8,en-US;q=0.5,en;q=0.3',
            'Accept-Encoding': 'gzip, deflate',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1',
        })
        
        self.data = []
        
    def get_page_data(self, page_num=1, year_month="2025-04", total_view=False):
        """
        Extract personnel data from a specific page
        """
        logger.info(f"Scraping page {page_num} for {year_month}")
        
        try:
            # Prepare form data based on actual HTML form
            form_data = {
                'BAS_YYMM': year_month,
                'TOTAL_YN': 'Y' if total_view else 'N',
                'PAGE_INDEX': str(page_num),
                'PAGE_UNIT': '5',  # Based on HTML
            }
            
            # Make POST request (form submits to same page)
            response = self.session.post(
                urljoin(self.base_url, self.personnel_url),
                data=form_data,
                timeout=30
            )
            response.raise_for_status()
            
            # Parse HTML
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Extract data from table
            personnel_data = self._extract_table_data(soup, year_month, page_num)
            
            # Check for pagination info
            pagination_info = self._extract_pagination_info(soup)
            
            return personnel_data, pagination_info
            
        except requests.RequestException as e:
            logger.error(f"Request failed for page {page_num}: {e}")
            return [], None
        except Exception as e:
            logger.error(f"Error processing page {page_num}: {e}")
            return [], None
    
    def _extract_table_data(self, soup, year_month, page_num):
        """
        Extract personnel data from table rows
        """
        personnel_data = []
        
        # Find the personnel table
        table = soup.find('table')
        if not table:
            logger.warning(f"No table found on page {page_num}")
            return personnel_data
        
        tbody = table.find('tbody')
        if not tbody:
            logger.warning(f"No tbody found on page {page_num}")
            return personnel_data
        
        rows = tbody.find_all('tr')
        logger.info(f"Found {len(rows)} data rows on page {page_num}")
        
        for row_idx, row in enumerate(rows):
            try:
                cells = row.find_all('td')
                if len(cells) < 5:
                    continue
                
                # Extract company info
                company_cell = cells[0]
                company_link = company_cell.find('a')
                
                if company_link:
                    company_name = company_link.get_text(strip=True)
                    
                    # Extract company ID from onClick
                    onclick = company_link.get('onclick', '')
                    company_id_match = re.search(r"openComInfoPop\('([^']+)'\)", onclick)
                    company_id = company_id_match.group(1) if company_id_match else None
                else:
                    company_name = company_cell.get_text(strip=True)
                    company_id = None
                
                # Extract numeric data
                total_personnel = self._clean_number(cells[1].get_text(strip=True))
                professional_staff = self._clean_number(cells[2].get_text(strip=True))
                investment_review = self._clean_number(cells[3].get_text(strip=True))
                management = self._clean_number(cells[4].get_text(strip=True))
                
                # Create record
                record = {
                    'company_name': company_name,
                    'company_id': company_id,
                    'total_personnel': total_personnel,
                    'professional_staff': professional_staff,
                    'investment_review_staff': investment_review,
                    'management_staff': management,
                    'reference_year_month': year_month,
                    'page_number': page_num,
                    'row_index': row_idx + 1,
                    'extracted_at': datetime.now().isoformat(),
                    'source_url': f"{self.base_url}{self.personnel_url}"
                }
                
                personnel_data.append(record)
                logger.debug(f"Extracted: {company_name} - {total_personnel} total staff")
                
            except Exception as e:
                logger.warning(f"Error extracting row {row_idx} on page {page_num}: {e}")
                continue
        
        return personnel_data
    
    def _extract_pagination_info(self, soup):
        """
        Extract pagination information
        """
        try:
            paging_div = soup.find('div', class_='paging')
            if not paging_div:
                return None
            
            # Find all page links
            page_links = paging_div.find_all('a', onclick=True)
            max_page = 1
            
            for link in page_links:
                onclick = link.get('onclick', '')
                page_match = re.search(r'f_linkPage\((\d+)\)', onclick)
                if page_match:
                    page_num = int(page_match.group(1))
                    max_page = max(max_page, page_num)
            
            return {
                'max_page': max_page,
                'has_pagination': max_page > 1
            }
            
        except Exception as e:
            logger.warning(f"Error extracting pagination info: {e}")
            return None
    
    def _clean_number(self, text):
        """
        Clean and convert text to number
        """
        if not text:
            return 0
        
        # Remove non-numeric characters except commas and periods
        cleaned = re.sub(r'[^\d,.]', '', text)
        
        try:
            # Handle comma-separated numbers
            return int(cleaned.replace(',', ''))
        except (ValueError, AttributeError):
            return 0
    
    def scrape_all_pages(self, year_month="2025-04", max_pages=None, delay=2):
        """
        Scrape all available pages
        """
        logger.info(f"Starting full scrape for {year_month}")
        
        # Get first page to determine total pages
        page_data, pagination_info = self.get_page_data(1, year_month)
        self.data.extend(page_data)
        
        if not pagination_info:
            logger.warning("Could not determine pagination info")
            return self.data
        
        total_pages = pagination_info.get('max_page', 1)
        if max_pages:
            total_pages = min(total_pages, max_pages)
        
        logger.info(f"Found {total_pages} total pages to scrape")
        
        # Scrape remaining pages
        for page_num in range(2, total_pages + 1):
            logger.info(f"Scraping page {page_num}/{total_pages}")
            
            page_data, _ = self.get_page_data(page_num, year_month)
            self.data.extend(page_data)
            
            # Delay between requests
            time.sleep(delay)
        
        logger.info(f"Scraping complete! Extracted {len(self.data)} records")
        return self.data
    
    def save_data(self, filename=None):
        """
        Save extracted data to files
        """
        if not self.data:
            logger.warning("No data to save")
            return
        
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        
        # Save as JSON
        json_filename = filename or f"diva_personnel_data_{timestamp}.json"
        with open(json_filename, 'w', encoding='utf-8') as f:
            json.dump(self.data, f, ensure_ascii=False, indent=2)
        logger.info(f"Data saved to {json_filename}")
        
        # Save as CSV
        csv_filename = json_filename.replace('.json', '.csv')
        df = pd.DataFrame(self.data)
        df.to_csv(csv_filename, index=False, encoding='utf-8-sig')
        logger.info(f"Data saved to {csv_filename}")
        
        return json_filename, csv_filename
    
    def get_summary_stats(self):
        """
        Get summary statistics of extracted data
        """
        if not self.data:
            return {}
        
        df = pd.DataFrame(self.data)
        
        stats = {
            'total_companies': len(df),
            'total_personnel_sum': df['total_personnel'].sum(),
            'average_company_size': df['total_personnel'].mean(),
            'largest_company': df.loc[df['total_personnel'].idxmax(), 'company_name'],
            'most_professional_staff': df.loc[df['professional_staff'].idxmax(), 'company_name'],
            'extraction_date': datetime.now().isoformat()
        }
        
        logger.info(f"Summary: {stats['total_companies']} companies, {stats['total_personnel_sum']} total personnel")
        return stats

def main():
    """
    Main execution function
    """
    scraper = DIVAPersonnelScraper()
    
    try:
        # Scrape all pages for current month
        logger.info("🚀 Starting DIVA Personnel Data Scraper")
        
        data = scraper.scrape_all_pages(
            year_month="2025-04",  # Current available month
            max_pages=5,  # Test with first 5 pages initially
            delay=2  # 2 second delay between requests
        )
        
        # Save data
        json_file, csv_file = scraper.save_data()
        
        # Print summary
        stats = scraper.get_summary_stats()
        print("\n📊 EXTRACTION SUMMARY:")
        print(f"Companies extracted: {stats['total_companies']}")
        print(f"Total personnel across all companies: {stats['total_personnel_sum']}")
        print(f"Average company size: {stats['average_company_size']:.1f} people")
        print(f"Largest company: {stats['largest_company']}")
        print(f"Data saved to: {json_file}")
        
        return data
        
    except Exception as e:
        logger.error(f"Scraping failed: {e}")
        raise

if __name__ == "__main__":
    main() 