FROM nginx
COPY ./nginx.conf /etc/nginx/nginx.conf

# 创建一个工作用的目录，就是一个新文件夹 放项目
RUN mkdir -p /data
# 将当前目录下的项目文件都 拷贝到那个新的文件中去， 
COPY ./  /data
# 指定工作目录， 就是cd 进入到这个目录中去 
WORKDIR /data

RUN nginx