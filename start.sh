mega-webdav ./ --public
rclone --config "rclone.conf" serve webdav Mega: --addr :8080 --vfs-cache-mode full --transfers 100
