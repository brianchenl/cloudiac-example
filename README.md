CloudIaC example
===================
CloudIaC 演示项目

该项目用于演示使用 cloudiac 在 aliyun 部署一个 nginx 服务

#### 环境变量依赖

**通过 cloudiac 平台执行时会自动使用绑定的资源账号，不需要设置。**

```bash
export ALICLOUD_ACCESS_KEY=your_access_key
export ALICLOUD_SECRET_KEY=your_secret_key
```

## 目录结构说明
```text
.
├── README.md       # 项目说明文档(必选)
├── main.tf         # terraform 主配置文件(必选)
├── versions.tf     # 指定依赖的 providers 及其版本(必选)
├── variables.tf    # input 变量定义(必选)
├── outputs.tf      # output 变量定义(必选) 
├── ansible         # ansible 相关资源目录(可选)
│   ├── playbook.yml    # ansible playbook
│   └── index.html      # playbook 中使用的文件
├── qa-env.tfvars    # QA 环境 tfvars(可选)
├── prod-env.tfvars  # 生产环境 tfvars(可选)
```

CloudIaC 云模板项目都需要符合以上目录结构规范。

### 具体文件说明
#### README.md
项目说明文档，该文件的内容会在 Iac 平台的云模板概览页展示。

#### versions.tf
该文件中定义依赖的 terraform 版本、providers 及其版本，IaC 会解析该文件进行 providers 的缓存。

#### variables.tf
输入变量定义。

IaC 会解析该文件，在进行云模板的变量配置时会展示解析出的变量名称、描述、默认值。

#### outputs.tf
输出变量定义。

#### tfvars 文件
tfvars 变量定义。

在 tfvars 文件中可以对 variables.tf 中定义的变量进行赋值。
该项目中我们将 qa 环境和生产环境的配置拆分到不同的 tfvars 文件，对应了不同的实例规格、vpc 配置等，
在创建云模板时可以选择绑定的 tfvars 文件，从而实现同一份云模板代码部署多个环境。

可以在 IaC 平台的云模板变量配置页面选择绑定的 tfvars 文件。

#### ansible
ansible playbook 和相关资源文件存放目录。

该目录下的所有 "*.yml" 文件都被认为是 playbook 文件，可以在 IaC 
平台的云模板变量配置页面选择要执行的 playbook，该 playbook 会作为执行入口。

执行 ansible playbook 时的工作目录为入口 playbook 文件所在目录。

