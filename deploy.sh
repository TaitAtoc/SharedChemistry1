#!/bin/bash
# FTP credentials
FTP_SERVER="ftp.sharedchemistry.com"
FTP_USER="sharedchemistry"
FTP_PASS="BT9S6sV7vkdb7Qj"

# Path to the local files to be uploaded
LOCAL_DIR="./public"

# FTP destination folder (ensure this is correct for your hosting)
REMOTE_DIR="/home/sharedchemistry/public_html/"

# Upload the site files to the live server using lftp
lftp -u $FTP_USER,$FTP_PASS $FTP_SERVER -e "mirror -R $LOCAL_DIR $REMOTE_DIR; quit"