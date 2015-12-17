![alt text](https://www.nginx.com/wp-content/themes/nginx-theme/assets/img//logo.png)

# Pull and Run image Nginx
```
$ docker pull sebstinkeste/nginx
```


```
$ docker run -it sebstinkeste/nginx bash

```
# Presentation
The default workdir is /var/www/ and the default Nginx Document Root is /usr/share/nginx/html.

# Environment variables
## Set your nginx.conf

The nginx configuration is dynamic.
```
environment:
	FRONTEND_PORT_80_TCP_PORT: "80"
	DOCUMENT_ROOT: "/var/www/"
	DIRECTORY_INDEX: "index.php index.html"
	SERVER_NAME: "localhost"
	FASTCGI_INDEX: "index.php"
```
## Advanced environment variables
 ```
environment:
	FASTCGI_PASS: "{containerName}_php_1:9000"
	PHPFPM: "{containerName}_php_1:9000" 
```

# Use docker links
[DEPRECATED] Future versions of Docker will not support links - you should remove them for forwards-compatibility.

# Contributors
..* [Sébastien Stinkeste](https://github.com/sebstinkeste)
