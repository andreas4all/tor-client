Docker TOR client
=================

This is small docker container for TOR client. With this container you can create TOR socks for another programs.

This container is based on Alpine linux. Container size is approx. 15MB.

We using two ports - 9050 and 9051.

How to run?

	docker run -p 9050:9050 -p 9051:9051 -e PASSWORD=yourPassword --name tor_client tor:0.1.0

Environment PASSWORD is for control TOR client. Default is _emptyPassword_.