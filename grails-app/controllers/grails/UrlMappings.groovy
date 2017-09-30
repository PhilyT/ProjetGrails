package grails

import grails.util.GrailsUtil

class UrlMappings {

    static mappings = {

        "/projet/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }

        }



        "/" (view: "/index" )
        "/index"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
