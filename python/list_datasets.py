from nlpsandboxclient import client

data_node_host = "http://data-node:8080/api/v1"

datasets = client.list_datasets(host=data_node_host)

for dataset in datasets:
  print(dataset)