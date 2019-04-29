# Wirepas Gateway

This registry contains the manifest for the
[Wirepas gateway](https://github.com/wirepas/gateway).

The manifest contains the
[x86 and ARM builds for the gateway and updates](https://cloud.docker.com/u/wirepas/repository/docker/wirepas/gateway).

<!--- START --->

image: [wirepas/gateway](https://hub.docker.com/r/wirepas/wirepas/gateway)

tags:

  -  latest
<!--- END --->


Each platform build is present on wirepas/gateway-_target_.

Available targets and tags:


<!--- STARTx86 --->

image: [wirepas/gateway-x86](https://hub.docker.com/r/wirepas/wirepas/gateway-x86)

tags:

  -  latest
<!--- ENDx86 --->


<!--- STARTrpi --->

image: [wirepas/gateway-rpi](https://hub.docker.com/r/wirepas/wirepas/gateway-rpi)

tags:

  -  latest

  -  1.1.0
<!--- ENDrpi --->

