# Azure loader

Scripts in this directory prepare an Azure HDInsight cluster to host the
workshop.

Usage:

```
# Copy public key to access cluster later. Will prompt for ssh password.
./copy-key.bash veszprem17-ssh.azurehdinsight.net

# Do the actual loading. This will take a while...
./load-data.bash veszprem17-ssh.azurehdinsight.net
```
