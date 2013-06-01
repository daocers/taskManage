import co.bugu.User

class BootStrap {

    def init = { servletContext ->

        def user1 = new User(name: "allen", password: "123456")

        if(user1.save()){
            System.out.println("user1 is saved")
        }
    }
    def destroy = {
    }
}
