twobrightlights
===============
[![Code Climate](https://codeclimate.com/repos/555cd0dde30ba046f8008c0e/badges/85c467445b11292c58a7/gpa.svg)](https://codeclimate.com/repos/555cd0dde30ba046f8008c0e/feed)
[![Test Coverage](https://codeclimate.com/repos/555cd0dde30ba046f8008c0e/badges/85c467445b11292c58a7/coverage.svg)](https://codeclimate.com/repos/555cd0dde30ba046f8008c0e/coverage)
## Development environment setup
### Git project setup
    $ cd code
    $ mkdir tbl-api
    $ cd tbl-api
    $ git clone -b development git@git.xogrp.com:planning/twobrightlights_api.git
    
### Setup Git Pivotal Tracker Integration
#### Ref: https://github.com/nebhale/git-pivotal-tracker-integration  
    $ gem install git-pivotal-tracker-integration
    
#### Usage
    $ git start [ type | story-id ] # Creates branch and starts story
    $ git commit ...
    $ git commit ...                # Your existing development process
    $ git commit ...
    $ git finish [--no-complete]    # Merges and destroys branch, pushes to origin, and finishes story
#### Configuration  
You will be prompted to enter your Pivotal tracker __API Token__ and the project Id

| Name               | Description                                                                                                                             |
|:------------------ |:--------------------------------------------------------------------------------------------------------------------------------------- |
| pivotal.api-token  | Your Pivotal Tracker API Token. This can be found in your [profile](https://www.pivotaltracker.com/profile) and should be set globally. |
| pivotal.project-id | The Pivotal Tracker project id for the repository your are working in. This can be found in the project's URL and should be set.        |
**Note:** You will want to be on the branch you want to branch from when starting a story. 

### Postgres Setup 
#### Local Postgres Server
[Postgres.app](http://postgresapp.com)  
1. Download Postgres.app  
2. Double click Postgres.app  
3. Add /Applications/Postgres.app/Contents/Versions/9.4/bin to your $PATH  
Done!
#### Local Database Setup
    $ rake db:reset  

### Setup AWS Local Environment 
    launchctl setenv AWS_ACCESS_KEY_ID "AKIAIV2KSCVT........"
    launchctl setenv AWS_SECRET_ACCESS_KEY "k7rwWU9UpOkiCTNwLTauTudeZPxiKLZ7........"
    launchctl setenv AWS_REGION "us-east-1"
Access keys can be obtained from within the [passwordstate](http://passwords.xogrp.com)

### s3 Buckets
| Env   | Bucket              |
| ----- | :---------------- : |
| dev   | xo-tbl-bucket-dev   |
| qa    | xo-tbl-bucket-qa    |
| prod  | xo-tbl-bucket-prod  |


### s3 Bucket folders
| Folders           | Content             |
| ------------------|: -------------------|
| %app_name%/assets | application assets  |
| albums/%album_id% | user album data     |
| static            | misc static content |

                              
### Server Information
|  Env |                  Domain                       |    Database Name     |               Database Endpoint                          |
| ---- |:--------------------------------------------- | :------------------- |:---------------------------------------------------------|
| qa   | xo-tbl-ruby-api-qa-env.elasticbeanstalk.com   | two_bright_lights_qa | xo-tbl-api-qa.cppaqkytfyow.us-east-1.rds.amazonaws.com   |
| prod | beta-api.twobrightlights.com                  | two_bright_lights   | |

### Project Links
[New Relic](https://rpm.newrelic.com/accounts/986324)  
[Code Climate](https://codeclimate.com/repos/555cd0dde30ba046f8008c0e/feed)  
[Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1335634)  
[Basecamp](https://basecamp.com/2091348/projects/9176266)  
[XO AWS Console](http://awsconsole.xogrp.com)  
[Honeybadger qa](https://app.honeybadger.io/projects/43590/faults?resolved=f)