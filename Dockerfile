FROM nginx:alpine

# 設定預設連線的 PORT，讓 Zeabur 的環境變數可以動態覆蓋
ENV PORT=8080
EXPOSE $PORT

# 移除預設的 Nginx 配置
RUN rm /etc/nginx/conf.d/default.conf

# 複製自訂的代理設定到模板資料夾中
# nginx:alpine 的 entrypoint 啟動時會自動讀取 templates 裡的 .template 檔案
# 將裡面的 `${PORT}` 替換成真正的環境變數後，輸出成 .conf 放置在 /etc/nginx/conf.d/ 下
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# 啟動 Nginx (CMD 內建於 nginx:alpine 中，不需要特別重新定義)
