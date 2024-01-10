// seedjob.groovy

// create an array with pipeline names
pipeline = "Simple_Job"
create_pipeline(pipeline)

// a method that creates a basic pipeline with the given parameter name
def create_pipeline(String name) {
    pipelineJob(name) {
        definition {
            cps {
                sandbox(true)
                script("""
// this is an example declarative pipeline that shows a Kubernetes Job to launch a maven container
pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        container('maven') {
          sh 'echo "Git cloning the repo"'
        }
      }
    }
    stage('Build') {
      steps {
        container('maven') {
          sh 'echo "Doing a docker build"'
        }
      }
    }
  }
}

""")
            }
        }
    }
}