server {
	server_name ${VHOST};
  listen 80 ${DEFAULT_SERVER};
	listen [::]:80 ${DEFAULT_SERVER};
	location ~ /.well-known {
                allow all;
		root /ssl/wk/;
        }
	location / {
		return 301 https://$host$request_uri;
	}
}

server {
	server_name ${VHOST};
  listen 443 ssl http2 ${DEFAULT_SERVER};
	listen [::]:443 ssl http2 ${DEFAULT_SERVER};

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
	ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4';

	ssl_prefer_server_ciphers on;
	ssl_session_timeout 5m;
	ssl_session_tickets off;

	ssl_certificate /ssl/letsencrypt/live/${VHOST}/fullchain.pem;
	ssl_certificate_key /ssl/letsencrypt/live/${VHOST}/privkey.pem;

	ssl_dhparam /data/dhparam.pem;

	location / {
		 proxy_pass http://172.17.0.1:${PORT};
	}
	location ~ /.well-known {
                allow all;
		root /ssl/wk/;
        }
}