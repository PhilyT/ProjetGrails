import grails.mbds.projet.UtilisateurPasswordEncoderListener
// Place your Spring DSL code here
beans = {
    utilisateurPasswordEncoderListener(UtilisateurPasswordEncoderListener, ref('hibernateDatastore'))
}
