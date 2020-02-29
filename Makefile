all:
	podman build . -t atrus/qru
	podman tag atrus/qru qru

