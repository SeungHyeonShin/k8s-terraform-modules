# K8S Objects Terraforming

쿠버네티스 클러스터 구성 후 거진 필수로 생성하는 오브젝트 파일들을 Terraform으로 정의하였습니다.
해당되는 오브젝트 파일들의 values.yaml 파일은 >> [여기](https://github.com/SeungHyeonShin/eks-project/tree/master/kube-objects) << 에서 확인하시고 커스터마이징 할 수 있습니다.

사용자가 정의할 수 있는 변수들은 아래와 같습니다.

  * 만약 Datadog으로 모니터링을 구성하고자 하면  `prometheus_or_datadog`변수를 `false`로 넣어주시고 `datadog-path`, `datadog-apikey` 값을 추가로 넣어주시면 됩니다.
  
## Inputs

| Name | Description | Default | Required |
|------|-------------|---------|:--------:|
|config_path|Input Your kube_config files| `"~/.kube/config"`|`no`
|node-handler-ns| Set the name of the namespace. | `"node_handler"` | `no`
|cicd-ns| Set the name of the name space. | `"cicd"` | `no`
|nginx-ns| Set the name of the name space. | `"nginx"` | `no`
|monitoring-ns| Set the name of the name space. | `"monitoring"` | `no`
|node-handler-path| Input the path to Node-Handler' values.yaml here | `{}` | `yes` | `yes`
|jenkins-path| Input the path to Jenkins' values.yaml here | `{}` | `yes`
|argo-path| Input the path to Argo' values.yaml here | `{}` | `yes`
|nginx-path| Input the path to nginx-ingress-controller' values.yaml here | `{}` | `yes`
|metric-path| Input the path to metric-server' values.yaml here | `{}` | `yes`
|prometheus-path| Input the path to prometheus' values.yaml here | `{}` | `yes`
|grafana-path| Input the path to grafana' values.yaml here" | `{}` | `yes`
|datadog-path| Input the path to datadog' values.yaml here |`{}` | `no`
|datadog-apikey| Input Your Datadog's APIKeys |`{}` | `no`
|prometheus_or_datadog| If yes, deploy Prometheus, if false, deploy datadog. default is prometheus | `true` | `no`

사용예제입니다.

## Usage Example
```
############   K8S Objects Modules ###################
module "k8s" {
  source = "git::https://github.com/SeungHyeonShin/k8s-terraform-modules.git//kube-object?ref=v1.0.0"
  config_path = "~/.kube/kubeconfig_${local.cluster_name}"

  node-handler-path = "../kube-objects/node-handler/values.yaml"
  jenkins-path = "../kube-objects/cicd/jenkins/values.yaml"
  argo-path = "../kube-objects/cicd/argo/values.yaml"
  nginx-path = "../kube-objects/nginx-controller/values.yaml"
  metric-path = "../kube-objects/monitoring/metric-server/values.yaml"
  prometheus-path = "../kube-objects/monitoring/prometheus/values.yaml"
  grafana-path = "../kube-objects/monitoring/grafana/values.yaml"
}
```