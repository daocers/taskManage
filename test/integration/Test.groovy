import grails.test.GrailsUnitTestCase
import co.bugu.*
/**
 * Created with IntelliJ IDEA.
 * User: lenovo
 * Date: 13-6-1
 * Time: 上午9:10
 * To change this template use File | Settings | File Templates.
 */
class Test extends GrailsUnitTestCase {

    void testAdd(){
        def user1 = new User(name: 'allen', password: '12345')

        user1.save()

        assert User.count() == 1
    }
}
