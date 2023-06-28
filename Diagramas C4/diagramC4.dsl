workspace "PC-Diseño" {
!impliedRelationships "false"
!identifiers "hierarchical"

model {
    Tourist = person "Tourist" "person who is interested in the application for travel purposes" "Tourist"
    Administrador = person "General Administrator" "Manage and organize functions" "Administrator"
    Provider = person "Tourist service provider" "Person who manages a company in the tourism sector." "Provider"
    Visitor = person "Visitor" "Person who is interested in the application." "Visitor"
    
    
    
    Tripboost = softwareSystem "Tripboost" "Management and sales application in the travel sector" "Tripboost" {
        
        AndroidApp = container "Android application" "application available on android platform." "" "APP"
        IOSApp = container "IOS application" "application available on IOS platform." "" "APP"
        LandingPage = container "Landing Page" "Display of the product from the landing page." "Html, CSS y js" "MobileApps"
        APIGateway = container "API Gateway" "Connection door between the microservices that exist with the web platforms and applications." "TypeScrip,Node js" "Gateway"
        AplicacionWeb = container "Aplicación web" "Web platform where different data and information accessible to service providers are managed." "Html, CSS, js y node js" "MobileApps"
        
    
        DataBase1 = container "Data Base Tourist managment" "Data Base of tourist managment" "mySQL" "DataBase"
        DataBase2 = container "Data Base Service provider" "Data Base of service provider" "mySQL" "DataBase"
        DataBase3 = container "Data Base Suscripcion and feedback" "Data Base of suscripcion and feedback" "mySQL" "DataBase"
        DataBase4 = container "Data Base Booking and travel experience" "Data Base of booking and travel experience" "mySQL" "DataBase"
        
        Service1 = container "Tourist Managment" "Management of all activities carried out by the tourist" "TypeScrip,Node js" "Microservices1"{
            login = component "Login Controller" "Manages and verifies access to the system and database" "" "Component"
            summary = component "Summary of tourist user accounts Controller" "Collects and stores information about tourists in the application accounts" "" "Component"
            trip = component "Trip information Controller" "Collects and stores travel information" "" "Component"
            tracking = component "Route traking Component" "Performs the route tracking process" "" "Component"
            security = component "Security Component" "Collects and verifies the data submitted for the database" "" "Component"
            incident = component "Incident notification Component" "Carry out the notification process" "" "Component"
        }
        Service2 = container "Service provider" "All services offered to providers" "TypeScrip,Node js" "Microservices1"{
            route = component "Route Controller" "Obtains information about the routes within the application" "" "Component"
            meal = component "Meal Controller" "Obtains information of the meals within the application" "" "Component"
            aircraft = component "Aircraft route Component" "Obtain information on flights and their routes within the application" "" "Component"
            accommodation = component "Accommodation Controller" "Obtains information about the accommodations within the application" "" "Component"
            modify = component "Modification and update Component" "Allows the modification of the data that is passed to the database" "" "Component"

        }
        Service3 = container "Suscripcion and feedback" "App subscriptions and feedback handling" "TypeScrip,Node js" "Microservices1"{
            suscripcion = component "Suscripcion Controller" "Request the information required to sign up for an account" "" "Component"
            feedback = component "Feedback Component" "Performs the feedback of the application and its tourist subscription processr" "" "Component"
            update = component "Update Component" "It is the process of improving the account with the enablement of new functions" "" "Component"
            payment = component "Payment Component" "Is the payment request process that will be sent to the external system" "" "Component"
            accounts = component "Accounts Controller" "It is the information stored within the user account that can be improved according to the subscription" "" "Component"
            security = component "Security Component" "Collects and verifies the data submitted for the database" "" "Component"
        }
        Service4 = container "Booking and travel experience" "Management of all reservations within the application" "TypeScrip,Node js" "Microservices1" {
            booking = component "Booking Controller" "It is the process in which reservations are made within the application" "" "Component"
            modify = component "Modify or update Component" "It is the process of modifying the reservations that have been made" "" "Component"
            notify = component "Notify Component" "It is the notification process about the confirmation of the reservation to the user" "" "Component"
            security = component "Security Component" "Collects and verifies the data submitted for the database" "" "Component"
        }
        
        
    }
    
    FirebaseCloudMessaging = softwareSystem "Fire Base Cloud Messaging" "Notification sending platform" "ExternalPlataform"
    Stripe = softwareSystem "Stripe" "As a payment gateway provider" "ExternalPlataform"
    Aviationstack = softwareSystem "AviacionStack" "Platform managment on aircraft flights" "ExternalPlataform"
    GoogleMaps = softwareSystem "Google Maps" "Platform for maps and route tracking" "ExternalPlataform"
    

    Tourist -> Tripboost.AndroidAPP "Uses"
    Tourist -> Tripboost.IOSApp "Uses"
    Provider -> Tripboost.AplicacionWeb "Uses"
    Visitor -> Tripboost.LandingPage "Visualize"
    Administrador -> Tripboost.AndroidAPP "Manage and supervise"
    Administrador -> Tripboost.IOSApp "Manage and supervise"
    Administrador -> Tripboost.LandingPage "Manage and supervise"
    Administrador -> Tripboost.AplicacionWeb "Manage and supervise"

    Tripboost.APIGateway -> Tripboost.Service1 "Makes API informacion"
    Tripboost.APIGateway -> Tripboost.Service2 "Makes API informacion"
    Tripboost.APIGateway -> Tripboost.Service3 "Makes API informacion"
    Tripboost.APIGateway -> Tripboost.Service4 "Makes API informacion"
    
    Tripboost.AplicacionWeb -> Tripboost.APIGateway "Request informacion"
    

    Tripboost.LandingPage -> Tripboost.IOSApp ""
    Tripboost.LandingPage -> Tripboost.AndroidApp ""
    
    Tripboost.AndroidApp -> Tripboost.APIGateway "Redirects"
    Tripboost.IOSApp -> Tripboost.APIGateway "Redirects"
    
    Administrador -> Tripboost "Manage processes"
    Tripboost -> Stripe "Send payment request" "External system"

    Tripboost.Service4 -> Tripboost.DataBase4 "Send information on the data base"
    Tripboost.Service3 -> Tripboost.DataBase3 "Send information on the data base"
    Tripboost.Service2 -> Tripboost.DataBase2 "Send information on the data base"
    Tripboost.Service1 -> Tripboost.DataBase1 "Send information on the data base"
   
    Tripboost.Service3 -> Stripe "Send nequest of payment" 
    Tripboost.Service4 -> FirebaseCloudMessaging "Send notification or message"
    Tripboost.Service1 -> FirebaseCloudMessaging "Send notification or message"
    Tripboost.Service2 -> Aviationstack "Send request of information about flights" 
    Tripboost.Service1 -> GoogleMaps "Send request of map and route information"
    
    Stripe -> Tripboost.IOSApp "Send confirmation of payment request"
    Stripe -> Tripboost.AndroidApp "Send confirmation of payment request"
    FirebaseCloudMessaging -> Tripboost.AndroidApp "Send notifications and messages"
    FirebaseCloudMessaging -> Tripboost.IOSApp "Send notifications and messagest"
    FirebaseCloudMessaging -> Tripboost.AplicacionWeb "Send notifications and messages"
    Aviationstack -> Tripboost.AplicacionWeb "Send flight information"
    GoogleMaps -> Tripboost.IOSApp "Show the requested information"
    GoogleMaps -> Tripboost.AndroidApp "Show the requested information"
    

    Visitor -> Tripboost "See the application information"""
    Tourist -> Tripboost "Uses" ""
    Provider -> Tripboost "Uses" ""
    
    Tripboost -> FirebaseCloudMessaging "Send Notification or message" "External system"
    Tripboost -> Aviationstack "Send request of informacion" "External system"
    Tripboost -> GoogleMaps "Send request of data maps" "External system"
    
    Tripboost.APIGateway -> Tripboost.Service1.login "Send information"
    Tripboost.APIGateway -> Tripboost.Service1.summary "Send information"
    Tripboost.APIGateway -> Tripboost.Service1.trip "Send information"

    Tripboost.Service1.login -> Tripboost.Service1.security "Uses"
    Tripboost.Service1.summary -> Tripboost.Service1.security "Uses"
    Tripboost.Service1.trip -> Tripboost.Service1.incident "Uses"
    Tripboost.Service1.trip -> Tripboost.Service1.tracking "Uses"
    
    Tripboost.Service1.security -> Tripboost.DataBase1 "Send and save information"
    Tripboost.Service1.tracking -> GoogleMaps "Request information"
    Tripboost.Service1.incident -> FirebaseCloudMessaging "Request information"
    
    
    Tripboost.APIGateway -> Tripboost.Service2.route "Send information"
    Tripboost.APIGateway -> Tripboost.Service2.meal "Send information"
    Tripboost.APIGateway -> Tripboost.Service2.accommodation "Send information"

    Tripboost.Service2.route -> Tripboost.Service2.aircraft "Uses"
    Tripboost.Service2.route -> Tripboost.Service2.modify "Uses"
    Tripboost.Service2.meal -> Tripboost.Service2.modify "Uses"
    Tripboost.Service2.accommodation -> Tripboost.Service2.modify "Uses"
    
    Tripboost.Service2.modify -> Tripboost.DataBase2 "Send and save information"
    Tripboost.Service2.aircraft -> Aviationstack "Request information"
    

    Tripboost.APIGateway -> Tripboost.Service3.suscripcion "Send information"
    Tripboost.APIGateway -> Tripboost.Service3.accounts "Send information"

    Tripboost.Service3.accounts -> Tripboost.Service3.feedback "Uses"
    Tripboost.Service3.update -> Tripboost.Service3.accounts "Uses"
    Tripboost.Service3.accounts -> Tripboost.Service3.security "Uses"
    Tripboost.Service3.suscripcion -> Tripboost.Service3.update "Uses"
    Tripboost.Service3.feedback -> Tripboost.Service3.security "Uses"
    Tripboost.Service3.suscripcion -> Tripboost.Service3.payment "Uses"
    
    Tripboost.Service3.security -> Tripboost.DataBase3 "Send and save information"
    Tripboost.Service3.payment -> Stripe "Request payment informacion"
    
    
    Tripboost.APIGateway -> Tripboost.Service4.booking "Send information"

    Tripboost.Service4.booking -> Tripboost.Service4.modify "Uses"
    Tripboost.Service4.booking -> Tripboost.Service4.notify "Uses"
    Tripboost.Service4.booking -> Tripboost.Service4.security "Uses"
    Tripboost.Service4.modify -> Tripboost.Service4.security "Uses"

    Tripboost.Service4.security -> Tripboost.DataBase4 "Send and save information"
    Tripboost.Service4.notify -> FirebaseCloudMessaging "Request information"
   
}

views {
    systemContext Tripboost "Context" "Context Diagram" {
        include Tourist
        include Provider
        include Visitor
        include Administrador
        include Tripboost
        include FirebaseCloudMessaging
        include Stripe
        include GoogleMaps
        include Aviationstack
        autolayout
    }

    container Tripboost "Containers" "Tripboost Container View" {
        
        include Provider
        include Administrador
        include Tourist
        include Visitor
        
        include Tripboost.AndroidApp
        include Tripboost.IOSApp
        include Tripboost.Landingpage
        include Tripboost.AplicacionWeb
        include Tripboost.APIGateway
        
        include Tripboost.Service1
        include Tripboost.Service2
        include Tripboost.Service3
        include Tripboost.Service4
        
        
        include Tripboost.DataBase1
        include Tripboost.DataBase2
        include Tripboost.DataBase3
        include Tripboost.DataBase4


        include FirebaseCloudMessaging
        include Stripe
        include Aviationstack
        include GoogleMaps
        autolayout
    }
    
    component Tripboost.Service1 "Component_microservice_1" {
        
        
        include Tripboost.DataBase1
        include Tripboost.APIGateway
        
        include Tripboost.Service1.tracking
        include Tripboost.Service1.login
        include Tripboost.Service1.summary
        include Tripboost.Service1.trip
        include Tripboost.Service1.security
        include Tripboost.Service1.incident
        
        include GoogleMaps
        include FirebaseCloudMessaging

        autolayout
    }
    component Tripboost.Service2 "Component_microservice_2" {


        include Tripboost.APIGateway
        include Tripboost.DataBase2
        
        include Tripboost.Service2.aircraft
        include Tripboost.Service2.route
        include Tripboost.Service2.meal
        include Tripboost.Service2.accommodation
        include Tripboost.Service2.modify

        
        include Aviationstack

        autolayout
    }
    component Tripboost.Service3 "Component_microservice_3" {
        
        include Tripboost.APIGateway
        include Tripboost.DataBase3
        
        include Tripboost.Service3.suscripcion
        include Tripboost.Service3.feedback
        include Tripboost.Service3.update
        include Tripboost.Service3.payment
        include Tripboost.Service3.accounts
        include Tripboost.Service3.security
        
        include Stripe

        autolayout
    }
    component Tripboost.Service4 "Component_microservice_4" {
    
        include Tripboost.APIGateway
        include Tripboost.DataBase4
        
        include Tripboost.Service4.booking
        include Tripboost.Service4.modify
        include Tripboost.Service4.notify
        include Tripboost.Service4.security

        include FirebaseCloudMessaging

        autolayout
    }

    styles {
        element "Administrator" {
            shape "Person"
            background "#908279"
            color "#ffffff"
        }

        element "DataBase" {
            shape "Cylinder"
            background "#262d46"
            color "#ffffff"
        }
        element "Person" {
            shape "Person"
            background "#767872"
            color "#ffffff"
        }
        element "APP" {
            shape "MobileDevicePortrait"
            background "#ecbb5c"
        }
        element "MobileApps" {
            shape "WebBrowser"
            background "#aeced2"
        }
        element "Visitor" {
            shape "Person"
            background "#3412de"
            color "#ffffff"
        }
        element "ExternalPlataform"{
            shape "RoundedBox"
            background "#ff745f"
        }
        element "Gateway"{
            shape "RoundedBox"
            background "#8caaa2"
        }
    }
}
}
