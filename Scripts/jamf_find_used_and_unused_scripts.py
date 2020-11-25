#!/usr/bin/env python3

import argparse
import logging
import os
import requests

import credentials
import jamf


def main():
    # Define paths and change the context to the repo
    base_path = os.path.dirname(os.path.abspath(__file__))
    api_url = '<your_api_url_goes_here>'
    # Create a credentials.py file and make sure it contains api_user and api_pass, so they are not parsed into the script itself, but called from
    api_user = credentials.api_user
    api_pass = credentials.api_pass

    # Initalise a log for the email
    log_level = logging.DEBUG if options.debug else logging.INFO
    logging.basicConfig(format='[%(asctime)s] [%(levelname)-7s] %(message)s', level=log_level)
    logging.info('Starting')

    logging.info('Logging into the API')
    api = jamf.JamfClassic(api_url, api_user, api_pass)

    logging.info('Collecting script data')
    script_data = api.get_data('scripts')
    if script_data.success:
        # For each script id in 'Scripts', add it to the list of scripts
        all_scripts = [script['id'] for script in script_data.data['scripts']]

    else:
        logging.critical('Failed to pull script data')
        
    # Initialise data collection variables
    used_scripts = []    
    unused_scripts = []

    logging.info('Collecting policy data')
    policies_data = api.get_data('policies')
    if policies_data.success:
        # For each script id in 'Scripts', add it to the list of scripts
        for policy_data in policies_data.data['policies']:
            policy_details = api.get_data('policies', 'id', policy_data['id'])
            for policy_script in policy_details.data['policy']['scripts']:
                used_scripts.append (policy_script['id'])
    else:
        logging.critical('Failed to pull policy data')

    logging.info('Sorting used and unused scripts')
    # Remove duplicates
    used_scripts = sorted(set(used_scripts), key=used_scripts.index)
    unused_scripts = sorted(unused_scripts)

    # Loop through the script ids in the scripts array
    for script_id in all_scripts:
        if not script_id in used_scripts:
            unused_scripts.append(script_id)
    print('Used scripts', used_scripts)
    for used_script in used_scripts:
        script_name = next(
            (script['name'] for script in script_data.data['scripts'] if script['id'] == used_script), None)
        print(script_name)

    print('#' * 120)
    # Look for unused scripts in the unused scripts array
    print ('Unused scripts',unused_scripts)
    for unused_script in unused_scripts:
        script_name = next(
            (script['name'] for script in script_data.data['scripts'] if script['id'] == unused_script), None)
        print (script_name)

    logging.info('Done')


if __name__ == '__main__':
    # Create parser
    parser = argparse.ArgumentParser(description='Find used and unused scripts')
    """
    Debug
    """
    parser.add_argument('--debug',
                        action='store_true', dest='debug', default=False,
                        help=argparse.SUPPRESS)

    options = parser.parse_args()
 
    main()

