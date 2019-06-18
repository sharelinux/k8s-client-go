## k8s client-go deployment

[![Golang](https://img.shields.io/badge/go-1.12.6-green.svg)](https://golang.org/)

---
### 项目描述
```
基于 kubernetes client-go 创建k8s Deployment (github版本: release-12.0).
计划 
1. 后续想基于client-go 对service、statefulset等controller,资源操作 
2. 基于client-go封装一套资源API，前端页面直接对其api实现容器创建、滚动升级、删除；    
```

### 编译
- 本平台编译
  make build

- 支持linux平台编译
  make build-linux


### 参考
- 参考1: https://github.com/kubernetes/client-go
- 参考2: https://github.com/kubernetes/client-go/blob/master/INSTALL.md#go-modules
- 参考3: https://github.com/kubernetes/client-go/blob/master/examples/create-update-delete-deployment/main.go


### 实现功能描述
基本调试通Deployment 的创建和删除;
注意: 需要测试集群的k8s kubeconfig文件, 放在机器上${HOME}/.kube/config


### ChangeLog
#### v0.0.1 (2019-06-18)
    - 检出官方client-go 并检出tag release-12.0
    - 调试官方Deployment 示例;
    - 在测试k8s集群进项验证通过
