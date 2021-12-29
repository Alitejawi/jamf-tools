# Jamf Pro users that have access to the database

# Scripts:
SELECT script_id,file_name FROM scripts WHERE script_contents LIKE '%python%';
# Extension Attributes:
SELECT extension_attribute_id,display_name FROM extension_attributes WHERE script_contents_mac LIKE '%python%';
