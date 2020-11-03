################
## K8S Provider
variable "config_path" {
  default = "~/.kube/config"
}

##################################
## Set the name of the name space.
variable "node-handler-ns" {
  default = "node-handler"
}
variable "cicd-ns" {
  default = "cicd"
}
variable "nginx-ns" {
  default = "nginx"
}
variable "monitoring-ns" {
  default = "monitoring"
}

####################
## Necessary Objects... (cluster_autoscaler, node_handler, CICD, Nginx-ingress)
variable "node-handler-path" {
  description = "Input the path to Node-Handler' values.yaml here"
}
variable "jenkins-path" {
  description = "Input the path to Jenkins' values.yaml here"
}
variable "argo-path" {
  description = "Input the path to Argo' values.yaml here"
}
variable "nginx-path" {
  description = "Input the path to nginx-ingress-controller' values.yaml here"
}

####################
## Monitoring Pods
variable "metric-path" {
  description = "Input the path to metric-server' values.yaml here"
}
variable "prometheus-path" {
  description = "Input the path to prometheus' values.yaml here"
}
variable "grafana-path" {
  description = "Input the path to grafana' values.yaml here"
}
variable "datadog-path" {
  description = "Input the path to datadog' values.yaml here"
  default = ""
}
variable "datadog-apikey" {
  description = "Input Your Datadog's APIKeys"
  default = "<DATADOG_APIKEYS>"
}

####################
## Select one of the monitoring tools.
variable "prometheus_or_datadog" {
  description = "If true, deploy Prometheus, if false, deploy datadog. default is prometheus"
  default = "true"
}
