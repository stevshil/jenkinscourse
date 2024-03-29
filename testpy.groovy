pipelineJob("testpy") {
    definition {
        cps {
            sandbox(true)
            script("""
                node {
                    git url: 'https://github.com/stevshil/jenkinscourse.git', branch: 'main'

                    def myImage = docker.build("pyimage:\${BUILD_NUMBER}","-f ./pyweb-solution/Dockerfile ./pyweb-solution")

                }

                pipeline {
                    agent any
                    stages {
                        stage("List container") {
                            steps {
                                sh "docker images | grep pyimage"
                            }
                        }
                        stage("Push image") {
                            steps {
                                echo "docker push pyimage:\${BUILD_NUMBER}"
                            }
                        }
                        stage("Clean Up") {
                            steps {
                                sh '''
                                images=""
                                for img in `docker images | grep pyimage | awk '{print \$3}' | sort -n | uniq`
                                do
                                    images="\$images \$img"
                                done
                                docker rmi -f \${images}
                                '''
                            }
                        }
                    }
                }
            """)
        }
    }
}