
set -ex
#20210713
docker_version=snowdreamtech/frpc:0.37.0
docker_name=frpc
docker pull ${docker_version}
docker stop -t 60 ${docker_name} || /bin/true
docker rm ${docker_name} || /bin/true
docker run -it -d \
--restart always \
--privileged=true \
--network host \
 --log-opt mode=non-blocking --log-opt max-buffer-size=4m --log-driver journald \
 -v /work/config/frpc.ini:/etc/frp/frpc.ini \
--name ${docker_name} \
${docker_version}
