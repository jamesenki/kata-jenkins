pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                hangoutsNotify message: "This is Chris Gallivan",token: "8TAhr5dP97wKtVlaaWya6Hn5l", threadByJob: true

            }
        }
    }
}
