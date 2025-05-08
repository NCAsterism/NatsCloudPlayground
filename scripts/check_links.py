#!/usr/bin/env python3
"""
Link checker for Markdown files in the GitHub Pages portfolio.
This script checks for broken internal links in Markdown files.
"""

import os
import re
import sys
from pathlib import Path
from urllib.parse import urlparse

# Regular expression for Markdown links
LINK_PATTERN = re.compile(r'\[([^\]]+)\]\(([^)]+)\)')

def is_external_link(link):
    """Check if a link is external (http/https) or internal."""
    parsed = urlparse(link)
    return parsed.scheme in ('http', 'https')

def get_all_files(base_dir='.', extension='.md'):
    """Get all files with the given extension in the directory and subdirectories."""
    files = []
    for root, _, filenames in os.walk(base_dir):
        for filename in filenames:
            if filename.endswith(extension):
                files.append(os.path.join(root, filename))
    return files

def extract_links(file_path):
    """Extract all Markdown links from a file."""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    links = []
    for match in LINK_PATTERN.finditer(content):
        link_text = match.group(1)
        link_url = match.group(2)
        links.append((link_text, link_url, match.start()))
    
    return links

def resolve_relative_path(base_file, link_path):
    """Resolve a relative path from the base file."""
    base_dir = os.path.dirname(base_file)
    if link_path.startswith('/'):
        # Absolute path from repo root
        full_path = os.path.join(os.getcwd(), link_path.lstrip('/'))
    else:
        # Relative path
        full_path = os.path.normpath(os.path.join(base_dir, link_path))
    
    return full_path

def check_links(base_dir='docs'):
    """Check all internal links in Markdown files."""
    md_files = get_all_files(base_dir, '.md')
    broken_links = []
    
    for file_path in md_files:
        print(f"Checking: {file_path}")
        links = extract_links(file_path)
        
        for link_text, link_url, position in links:
            # Skip external links, anchors, and email links
            if (is_external_link(link_url) or 
                link_url.startswith('#') or 
                link_url.startswith('mailto:') or
                link_url == ''):
                continue
            
            # Handle anchor links to the same page
            if '#' in link_url:
                link_url = link_url.split('#')[0]
                if link_url == '':
                    continue
            
            # Resolve the full path
            target_path = resolve_relative_path(file_path, link_url)
            
            # Check if the file exists
            if not os.path.exists(target_path):
                line_number = content_to_line_number(file_path, position)
                broken_links.append({
                    'file': file_path,
                    'line': line_number,
                    'link_text': link_text,
                    'link_url': link_url,
                    'resolved_path': target_path
                })
    
    return broken_links

def content_to_line_number(file_path, position):
    """Convert a character position to a line number."""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    return content[:position].count('\n') + 1

def main():
    """Main function."""
    base_dir = 'docs'
    if len(sys.argv) > 1:
        base_dir = sys.argv[1]
    
    print(f"Checking links in {base_dir}...")
    broken_links = check_links(base_dir)
    
    if broken_links:
        print("\nBroken links found:")
        for link in broken_links:
            print(f"{link['file']}:{link['line']} - [{link['link_text']}]({link['link_url']}) -> {link['resolved_path']}")
        print(f"\nTotal broken links: {len(broken_links)}")
        return 1
    else:
        print("\nNo broken links found.")
        return 0

if __name__ == '__main__':
    sys.exit(main()) 