docker_version=registry.cn-beijing.aliyuncs.com/poolin_public/oagent:latest
docker pull ${docker_version}

docker_name=oagent

docker stop -t 3 $docker_name
docker rm $docker_name

docker run \
-itd --name oagent \
--dns 119.29.29.29 \
--dns 223.5.5.5 \
-p 6000-6100:6000-6100 \
--restart=always \
--log-opt max-size=500m \
--log-opt max-file=3 \
-d ${docker_version}