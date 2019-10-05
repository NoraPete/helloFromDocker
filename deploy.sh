eb init 'helloFromDocker'\
 --region eu-west-2\
 --source codecommit/'NoraPete'/'helloFromDocker'

eb codesource local

eb deploy
