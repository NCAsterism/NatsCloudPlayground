#!/usr/bin/env python3
"""
Script to rename files and folders to follow snake_case convention.
This helps maintain consistency across the repository.
"""

import os
import re
import sys
from pathlib import Path

def to_snake_case(name):
    """
    Convert a string to snake_case.
    - Replace spaces with underscores
    - Replace camelCase with snake_case
    - Replace PascalCase with snake_case
    - Replace kebab-case with snake_case
    """
    # Handle file extensions separately
    if '.' in name:
        base_name, extension = name.rsplit('.', 1)
        return to_snake_case(base_name) + '.' + extension

    # Replace hyphens and spaces with underscores
    s1 = re.sub(r'[-\s]+', '_', name)
    
    # Insert underscore between camelCase
    s2 = re.sub(r'([a-z0-9])([A-Z])', r'\1_\2', s1)
    
    # Convert to lowercase
    return s2.lower()

def should_skip(path, skip_dirs):
    """Check if the path should be skipped."""
    for skip_dir in skip_dirs:
        if path.startswith(skip_dir):
            return True
    return False

def rename_to_snake_case(directory='.', recursive=True, dry_run=True, skip_dirs=None):
    """
    Rename files and directories to snake_case.
    
    Args:
        directory: The directory to start from
        recursive: Whether to process subdirectories
        dry_run: If True, only print what would be renamed without actually renaming
        skip_dirs: List of directories to skip
    """
    if skip_dirs is None:
        skip_dirs = ['.git', '.github', '.vscode', '.cursor', 'node_modules']
    
    skip_dirs = [os.path.normpath(os.path.join(directory, d)) for d in skip_dirs]
    
    renamed = []
    
    # Get all directories and files
    for root, dirs, files in os.walk(directory, topdown=False):
        if should_skip(root, skip_dirs):
            continue
        
        # Rename files first
        for file in files:
            if file.startswith('.'):  # Skip hidden files
                continue
                
            original_path = os.path.join(root, file)
            snake_case_name = to_snake_case(file)
            
            if snake_case_name != file:
                new_path = os.path.join(root, snake_case_name)
                
                if dry_run:
                    print(f"Would rename: {original_path} -> {new_path}")
                else:
                    try:
                        os.rename(original_path, new_path)
                        print(f"Renamed: {original_path} -> {new_path}")
                        renamed.append((original_path, new_path))
                    except Exception as e:
                        print(f"Error renaming {original_path}: {e}")
        
        # Then rename directories
        if recursive:
            for dir_name in dirs:
                if dir_name.startswith('.'):  # Skip hidden directories
                    continue
                    
                original_path = os.path.join(root, dir_name)
                
                if should_skip(original_path, skip_dirs):
                    continue
                    
                snake_case_name = to_snake_case(dir_name)
                
                if snake_case_name != dir_name:
                    new_path = os.path.join(root, snake_case_name)
                    
                    if dry_run:
                        print(f"Would rename dir: {original_path} -> {new_path}")
                    else:
                        try:
                            os.rename(original_path, new_path)
                            print(f"Renamed dir: {original_path} -> {new_path}")
                            renamed.append((original_path, new_path))
                        except Exception as e:
                            print(f"Error renaming directory {original_path}: {e}")
        
        if not recursive:
            break
    
    return renamed

def fix_markdown_links(renamed, directory='.'):
    """
    Fix links in Markdown files after renaming.
    
    Args:
        renamed: List of tuples (original_path, new_path)
        directory: The directory to scan for Markdown files
    """
    if not renamed:
        return
    
    md_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.md'):
                md_files.append(os.path.join(root, file))
    
    for md_file in md_files:
        with open(md_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        updated_content = content
        for original_path, new_path in renamed:
            # Get relative paths for both
            rel_original = os.path.relpath(original_path, os.path.dirname(md_file))
            rel_new = os.path.relpath(new_path, os.path.dirname(md_file))
            
            # Replace links
            updated_content = updated_content.replace(
                f'({rel_original})', 
                f'({rel_new})'
            )
            
            # Replace other potential reference formats
            updated_content = updated_content.replace(
                f'"{rel_original}"', 
                f'"{rel_new}"'
            )
        
        if updated_content != content:
            with open(md_file, 'w', encoding='utf-8') as f:
                f.write(updated_content)
            print(f"Updated links in {md_file}")

def main():
    """Main function."""
    import argparse
    
    parser = argparse.ArgumentParser(description='Rename files and directories to snake_case')
    parser.add_argument('directory', nargs='?', default='.', help='Directory to process')
    parser.add_argument('--no-recursive', action='store_true', help='Do not process subdirectories')
    parser.add_argument('--apply', action='store_true', help='Actually rename files (without this, it\'s a dry run)')
    parser.add_argument('--fix-links', action='store_true', help='Fix Markdown links after renaming')
    parser.add_argument('--skip', nargs='+', default=[], help='Additional directories to skip')
    
    args = parser.parse_args()
    
    print(f"Processing directory: {args.directory}")
    print(f"{'Applying' if args.apply else 'Dry run'} changes...")
    
    skip_dirs = ['.git', '.github', '.vscode', '.cursor', 'node_modules'] + args.skip
    
    renamed = rename_to_snake_case(
        directory=args.directory,
        recursive=not args.no_recursive,
        dry_run=not args.apply,
        skip_dirs=skip_dirs
    )
    
    if args.fix_links and args.apply and renamed:
        print("\nFixing Markdown links...")
        fix_markdown_links(renamed, args.directory)
    
    if not args.apply:
        print("\nThis was a dry run. Use --apply to actually rename files.")
    
    return 0

if __name__ == '__main__':
    sys.exit(main()) 