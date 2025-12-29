resource_group = {
  rg1 = {
    resource_group_name          = "Daksh1"
    resource_group_name_location = "central india"
  }
  rg2 = {
    resource_group_name          = "Daksh3"
    resource_group_name_location = "south india"
  }
}
azurerm_virtual_network = {
  vnet1 = {
    vnetname                = "prodvnet1"
    vnetlocation            = "central india"
    vnetresource_group_name = "Daksh1"
    vnetaddress_space       = ["10.0.0.0/16"]
  }
}
prodsubnet = {
  subnet1 = {
    subnetname           = "prod-subnet1"
    resource_group_name  = "Daksh1"
    virtual_network_name = "prodvnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnetname           = "prod-subnet2"
    resource_group_name  = "Daksh1"
    virtual_network_name = "prodvnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
prodnic = {
  nic1 = {
    nicname     = "prodnic1"
    niclocation = "centralindia"
    rgname      = "Daksh1"
    subnetkey   = "subnet1"
    pipkey      = "pip1"
  }
  nic2 = {
    nicname     = "prodnic2"
    niclocation = "centralindia"
    rgname      = "Daksh1"
    subnetkey   = "subnet2"
    pipkey      = "pip2"
  }
}
prodpip = {
  pip1 = {
    pipname     = "prodpip1"
    piprgname   = "Daksh1"
    piplocation = "centralindia"
  }
  pip2 = {
    pipname     = "prodpip2"
    piprgname   = "Daksh1"
    piplocation = "centralindia"
  }
}

vm = {
  vm1 = {
    vmname     = "frontendvm"
    rgname     = "Daksh1"
    rglocation = "centralindia"
    nickey     = "nic1"
  }
  vm2 = {
    vmname     = "backenddvm"
    rgname     = "Daksh1"
    rglocation = "centralindia"
    nickey     = "nic2"
  }
}

sqlserver = {
sql1 ={
   sqlservername = "prodsqlmyserver"
    rgname = "Daksh1"
    sqllocation = "centralindia"
    sqlserver_admin = "mysqladmin"
    sqlserver_password = "Adminpass@123456"
    mssql_firewall_rule = "prodsql_serverrule"
    serverkey = "sql1"
  }
}
mysqldatabase = {

  database1 = {
   mysql_database_name = "prodsql_database"
    sqlservername = "prodsqlmyserver"
    rgname = "Daksh1"
  }
}