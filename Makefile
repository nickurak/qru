all:
	docker build . -t qru
	docker tag qru atrus/qru
	docker tag qru docker.io/atrus/qru

