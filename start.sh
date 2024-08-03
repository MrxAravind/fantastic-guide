mega-webdav ./ --public
rclone --config "rclone.conf" copy Blaze: FMega:Test_Backup --transfers 300  --stats-one-line -P  --log-file “rlog.txt” --log-level INFO  --stats 2s
