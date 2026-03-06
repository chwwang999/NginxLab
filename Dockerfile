FROM nginx:alpine

# 移除預設的 Nginx 配置
RUN rm /etc/nginx/conf.d/default.conf

# 複製我們自訂的代理配置文件到容器中
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露 80 port
EXPOSE 80

# 啟動 Nginx
CMD ["nginx", "-g", "daemon off;"]
