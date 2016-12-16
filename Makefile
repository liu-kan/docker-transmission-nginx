tr:
	docker run --name tr -v ~/data/tr/config:/config -p 9091:9091 -e TUSER=l -e TPASS=k -e init=yes -e PUID=1000 -e PGID=1000 -d transmission
build:
	docker build -t transmission .	
