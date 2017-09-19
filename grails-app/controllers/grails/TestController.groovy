package grails

class TestController {

    def testService

    def index() { render testService.serviceMethod() }
}
