# build-protobuf
编译protobuf的脚本。

编译出的protoc不包含非系统的动态库依赖，并且编译出的静态库可用于生成其他动态库（-PIC）。

# 使用方法：
1. 下载protobuf源码：https://github.com/protocolbuffers/protobuf/releases
- 记得下载前缀为protobuf-cpp的，因为这里面已经生成好了configure文件。
2. 解压压缩包
3. 运行`bash build-protobuf.sh protobuf-x.x.x`，在当前目录下生成protobuf_x_x_x文件夹，里面包含了编译好的文件。
