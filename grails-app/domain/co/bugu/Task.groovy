package co.bugu

class Task {
    String content
    Date date

    static belongsTo = [user: User]

    static constraints = {
    }
}
