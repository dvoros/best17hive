# Azure loader

Scripts in this directory prepare an Azure HDInsight cluster to host the
workshop.

## Scripts

Usage:

```
# Copy public key to access cluster later. Will prompt for ssh password.
./copy-key.bash veszprem17-ssh.azurehdinsight.net

# Do the actual loading. This will take a while...
./load-data.bash veszprem17-ssh.azurehdinsight.net
```

## Manual steps

Not yet automated:

 - Enabling ACID: log into Ambari, toggle the switch and restart all affected
