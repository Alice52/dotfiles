# bash
context=/home/zack/kong/oneid-aacs/kong/plugins
prefix=mysql

d_uname=yu1252068782
d_pwd=xxx
d_repo=registry.cn-shanghai.aliyuncs.com

image=legacy:${prefix}-$(date +%Y%m%d)
docker build -f Dockerfile $context -t ${image}
docker login --username=$d_uname --password=$d_pwd $d_repo
docker tag $image $d_repo/alice52/$image
docker push $d_repo/alice52/$image
