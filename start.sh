mega-webdav ./ --public
curl http://127.0.0.1:4443/0qtxWLTY/Cloud%20Drive
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| tee /etc/apt/sources.list.d/ngrok.list \
	&& apt update \
	&& apt install ngrok
 ngrok config add-authtoken 2Z2kdXlY24QHUw0dnyrGTk51XxI_6nD7jCbSWw6KcDwx1VEek
 nohup ngrok http --domain=relative-fair-reptile.ngrok-free.app 4443 &
 python3 keep_alive.py
