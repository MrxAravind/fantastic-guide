mega-webdav ./ --public
rclone --config "rclone.conf" copy Blaze: Mega:Test_Backup --transfers 100 --checkers 70  --stats-one-line -P  --log-file “rlog.txt” --log-level INFO  --stats 5s 
