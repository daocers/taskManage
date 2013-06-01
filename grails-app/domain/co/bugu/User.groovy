package co.bugu

class User {
    String userName
    String password

    static hasMany = [tasks: Task]

    static constraints = {
        tasks(nullable: true)
    }
}
