package grails.mbds.projet

import grails.gorm.transactions.Transactional
import grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile

@Transactional
class ImagePersistenceService {

    String uploadFile( MultipartFile file, String name, String destinationDirectory ) {


        def storagePathDirectory = new File( destinationDirectory )

        if( !storagePathDirectory.exists() ){
            println("creating directory ${destinationDirectory}")
            if(storagePathDirectory.mkdirs()){
                println "SUCCESS"
            }else{
                println "FAILED"
            }
        }

        // Store file

        if(!file.isEmpty()){
            file.transferTo( new File("${destinationDirectory}/${name}") )
            println("Saved File: ${destinationDirectory}/${name}")
            return "${destinationDirectory}/${name}"
        }else{
            println "File: ${file.inspect()} was empty"
            return null
        }
    }
}
