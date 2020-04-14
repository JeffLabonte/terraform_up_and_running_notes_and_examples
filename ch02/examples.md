```
terraform plan
```
This latter command will prompt you a interactive terminal to add the value of server\_port


If you don't want the interactive version:

```
terraform plan --var "server_port=8080"
```

Or it is possible to set it as an environment variable:

```
export TF_VAR_server_port=8080
terraform plan
```