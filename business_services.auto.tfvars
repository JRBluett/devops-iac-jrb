business_services = {
  "inbound_digitalimage"          = { name = "Inbound digitalimage", description = "Inbound digitalimage services", business_service_list = ["Inbound imessage", "Inbound bajamessages"], service_list = []  },
  "outbound_digitalimage"         = { name = "Outbound digitalimage", description = "Outbound digitalimage sending services", business_service_list = ["Outbound imessage", "Outbound bajamessages"], service_list = [] },
  "inbound_bajamessages"      = { name = "Inbound bajamessages", description = "Inbound bajamessages services", business_service_list = [], service_list = ["bajamessages_outbound"] },
  "outbound_bajamessages"     = { name = "Outbound bajamessages", description = "Outbound bajamessages services", business_service_list = [], service_list = [] },
  "inbound_imessage"         = { name = "Inbound imessage", description = "Inbound imessage services", business_service_list = [], service_list = [] }
  "outbound_imessage"        = { name = "Outbound imessage", description = "Outbound imessage services", business_service_list = [], service_list = [] }
  "pagerdutytestservice" = { name = "PagerDutyTestService", description = "This business service is responsible for integrations and other business not yet ready for production use.", business_service_list = [], service_list = [] }
}