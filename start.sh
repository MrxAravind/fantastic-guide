mega-webdav ./ --public
rclone --config "rclone.conf" copy DropBox: FMega:Test_Backup --transfers 200  --stats-one-line -P  --log-file “rlog.txt” --log-level INFO  --stats 2s
