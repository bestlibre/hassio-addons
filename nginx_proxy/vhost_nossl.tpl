server {
	server_name ${VHOST};
	listen 80 ${DEFAULT_SERVER};
	listen [::]:80 ${DEFAULT_SERVER};
	location ~ /.well-known {
                allow all;
		root /ssl/wk/;
        }

	location / {
		 proxy_pass http://172.17.0.1:${PORT};
	}
}
