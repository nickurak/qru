all:
	podman build . -t qru
	podman tag qru atrus/qru
	podman tag qru docker.io/atrus/qru

