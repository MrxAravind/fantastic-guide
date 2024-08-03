mega-webdav ./ --public
rclone --config "rclone.conf" serve ftp Mega: --addr :8080 --vfs-cache-mode full
