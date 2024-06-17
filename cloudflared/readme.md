## http 端口可以直接暴露在公网

## ssh 端口可以通过 access 暴露到浏览器

## tcp 端口需要 client

1. ~~使用 docker 的方式过于麻烦: 还有 docker 内证书问题~~: 目前放弃
2. 安装 cloudflared
   - brew install cloudflared
3. 登录 cloudflared
   - cloudflared login
4. 在 tunnel 内创建 TCP 流量转发
   - `mysql.hubby.top` : `tcp://172.17.0.7:3306`
5. 修改本地 host 文件: 之后本机就使用 tunnel.hubby.top 访问远程机器
   - `127.0.0.1 tunnel.hubby.top`
6. 配置 config.conf

   ```conf
   [service1]
   hostname=mq.hubby.top
   url=0.0.0.0:3306

   [service2]
   hostname=xx
   url=0.0.0.0:xxx
   ```

7. 执行 `cloudflared-tcp.sh` 脚本
8. 停止穿透则执行 `cloudflared-tcp-stop.sh` 脚本
