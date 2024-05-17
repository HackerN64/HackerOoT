pipeline {
    agent {
        label 'oot'
    }

    stages {
        stage('Check formatting (full)') {
            when {
                branch 'main'
            }
            steps {
                echo 'Checking formatting on all files...'
                sh 'python3 tools/check_format.py'
            }
        }
        stage('Check formatting (modified)') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                echo 'Checking formatting on modified files...'
                sh 'python3 tools/check_format.py --verbose --compare-to origin/main'
            }
        }
        stage('Setup gc-eu-mq-dbg') {
            steps {
                sh 'cp /usr/local/etc/roms/oot-gc-eu-mq-dbg.z64 baseroms/gc-eu-mq-dbg/baserom.z64'
                sh 'make -j setup'
            }
        }
        stage('Build gc-eu-mq-dbg (qemu-irix)') {
            when {
                branch 'main'
            }
            steps {
                sh 'make -j ORIG_COMPILER=1'
            }
        }
        stage('Build gc-eu-mq-dbg') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                sh 'make -j RUN_CC_CHECK=0'
            }
        }
        stage('Setup gc-eu-mq') {
            steps {
                sh 'cp /usr/local/etc/roms/oot-gc-eu-mq.z64 baseroms/gc-eu-mq/baserom.z64'
                sh 'make -j setup VERSION=gc-eu-mq'
            }
        }
        stage('Build gc-eu-mq (qemu-irix)') {
            when {
                branch 'main'
            }
            steps {
                sh 'make -j VERSION=gc-eu-mq ORIG_COMPILER=1'
            }
        }
        stage('Build gc-eu-mq') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                sh 'make -j VERSION=gc-eu-mq RUN_CC_CHECK=0'
            }
        }
        stage('Report Progress') {
            when {
                branch 'main'
            }
            steps {
                sh 'mkdir reports'
                sh 'python3 progress.py csv >> reports/progress-oot-nonmatching.csv'
                sh 'python3 progress.py csv -m >> reports/progress-oot-matching.csv'
                sh 'python3 progress.py shield-json > reports/progress-oot-shield.json'
                stash includes: 'reports/*', name: 'reports'
            }
        }
        stage('Update Progress') {
            when {
                branch 'main'
            }
            agent {
                label 'zeldaret_website'
            }
            steps {
                unstash 'reports'
                sh 'cat reports/progress-oot-nonmatching.csv >> /var/www/zelda64.dev/assets/csv/progress-oot-nonmatching.csv'
                sh 'cat reports/progress-oot-matching.csv >> /var/www/zelda64.dev/assets/csv/progress-oot-matching.csv'
                sh 'cat reports/progress-oot-shield.json > /var/www/zelda64.dev/assets/csv/progress-oot-shield.json'
            }
        }
    }
    post {
        always {
            echo "Finished, deleting directory."
            deleteDir()
        }
        cleanup {
            echo "Clean up in post."
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true)
        }
    }
}
