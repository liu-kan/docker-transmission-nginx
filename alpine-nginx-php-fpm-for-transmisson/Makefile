http:
	docker run -d --name nginx -p 443:443 -p 80:80 -v `pwd`/ssl:/etc/nginx/ssl --link tr:tr anphpf
build:
	docker build -t anphpf .	
