# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission

if [[ ! -f "student-submission/ListExamples.java" ]]
then
    echo "wrong files submitted"
    exit
fi

rm -rf autograder
mkdir autograder
cp TestListExamples.java autograder
cp student-submission/ListExamples.java autograder
cp lib/hamcrest-core-1.3.jar autograder
cp lib/junit-4.13.2.jar autograder

cd autograder
javac -cp .:hamcrest-core-1.3.jar:junit-4.13.2.jar *.java
if [[$? -eq 0]]
then 
    echo "successfully compile"
else
    echo "compile error"
fi

set +e

java -cp .:hamcrest-core-1.3.jar:junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
