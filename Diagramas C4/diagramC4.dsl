workspace "CODEX" "Tripboost" {
!impliedRelationships "false"
!identifiers "hierarchical"

model {
    Tourist = person "Tourist" "Person interested in travel" "Tourist"
    ProviderTourist = person "ProviderTourist" "Person who works in the tourism sector" "Provider"
    Administrador = person "Administrador" "Manage and organize functions" "Administrator"
    SQME = softwareSystem "TripBoost" "Safety, Quality, Management System, App" "SQME" {
        BD = container "BD" "Database" "Oracle" "Oracle"
        ServidorApps = container "Application Server" "Wildfly" "JEE 8080" "Wildfly" {
            Motordeflujo = component "Flow Engine" "" "Java EE" "Component"
            GestordeFormularios = component "DataBase Manager" "programming language" "Java C++" "Component"
            AppService = component "App Service" "Incident WS" "REST" "REST"
            ConectorExterno = component "External Connector" "" "Component"
            ConectorBD = component "Database Connector" "Database Connector" "" "Component"
        }
        CellAPP = container "Cell App"
    }
    SistemadeGestiondeInformacion = softwareSystem "Information Management System" "Route, food and lodging, General Control" "Safety"
    TouristCustomer = softwareSystem "Tourist Customer" "See all the information of the tourist companies" "TouristCustomer"
    TouristCompanyInterface = softwareSystem "Tourist Company Interface" "Provider" "TouristCompanyInterface"
    Administrador -> SQME "Manage processes" "App"
    SistemadeGestiondeInformacion -> SQME "Update all information" "APP"
    SQME -> TouristCustomer "Present the information"
    SQME -> TouristCompanyInterface "Show information"
    SQME.ServidorApps -> SQME.BD "Information and personal Data"
    Administrador -> SQME.CellAPP "Authorizes"
    ProviderTourist -> SQME.CellAPP "Upload tourism business data"
    Tourist -> SQME.CellAPP "Load Personal Data"
    SQME.ServidorApps -> TouristCompanyInterface "Show Updates in App"
    SQME.ServidorApps -> TouristCustomer "Show Updates in App"
    SistemadeGestiondeInformacion -> SQME.ServidorApps "Reads and updates"
    SQME.CellAPP -> SQME.ServidorApps "Updates"
    Tourist -> SQME "Load and display information" "APP"
    ProviderTourist -> SQME "Load information" "App"
}

views {
    systemContext SQME "Context" "Context Diagram" {
        include Tourist
        include ProviderTourist
        include Administrador
        include SQME
        include SistemadeGestiondeInformacion
        include TouristCustomer
        include TouristCompanyInterface
    }

    container SQME "Containers" "SQME Container View" {
        include Tourist
        include SQME.BD
        include SQME.ServidorApps
        include ProviderTourist
        include SQME.CellAPP
        include Administrador
        include SistemadeGestiondeInformacion
        include TouristCustomer
        include TouristCompanyInterface
    }

    component SQME.BD "Component" {
        include Tourist
        include ProviderTourist
        include SQME.CellAPP
        include Administrador
        include SQME.ServidorApps.Motordeflujo
        include SQME.ServidorApps.GestordeFormularios
        include SQME.ServidorApps.AppService
        include SQME.ServidorApps.ConectorExterno
        include SQME.ServidorApps.ConectorBD
        include SistemadeGestiondeInformacion
        include TouristCustomer
        include TouristCompanyInterface
    }

    styles {
        element "Administrator" {
            shape "Person"
            background "#908279"
            color "#ffffff"
        }
        element "Oracle" {
            shape "Cylinder"
            background "#262d46"
            color "#ffffff"
        }
        element "Person" {
            shape "Person"
            background "#767872"
            color "#ffffff"
        }
        element "SQME" {
            shape "RoundedBox"
            background "#ecbb5c"
        }
        element "Representante" {
            shape "Person"
            background "#3412de"
            color "#ffffff"
        }
    }

}
}