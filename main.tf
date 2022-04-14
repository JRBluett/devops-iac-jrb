terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# # Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = ""
}


variable "business_services" {
  type = map(object({
    name        = string
    description = string
    business_service_list = list(string)
    service_list = list(string)
  }))
}

variable "chicken" {
  default = ["egg1", "egg2", "egg3"]
}


locals {
  # environment = keys(var.business_services)
  # environment = values(var.business_services)
  # environment = [ for n in values(var.business_services) : n.business_service_list if length(n.business_service_list) > 0 ]
  step1 = { for k, v in var.business_services : "${k}_step1" => [ for e in v.business_service_list : [k,e] ] if length(v.business_service_list) > 0 }
  step2 = flatten([ for i in local.step1 : [ for t in i :  { key = t[0], value = t[1] } ] ])
  step3 = [ for v in local.step2 : v ]
  step3ditto = [ for v in local.step2 : v ]

  environment = flatten([ for i in local.step1 : [ for t in i :  { key = t[0], value = t[1] } ] ])
  # environment = zipmap( keys(var.business_services), [ for n in values(var.business_services) : n.business_service_list if length(n.business_service_list) > 0 ] )
  # environment = setproduct(keys(var.business_services), values(var.business_services))
  # environment = { for n, val in var.business_services : { for k, v in {key = n, business_service = val.business_service_list} : {dependent = k, dependency = v} } if length(n.business_service_list) > 0 }
  deadSimple = var.chicken
  simple = [for n in var.chicken : n ]
}

output "out" {
  # value = [local.step1, local.step2, local.step3, local.environment]
  # value = local.environment
  value = flatten([local.step3, local.step3ditto])
}