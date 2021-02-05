Template for composer packages (PHP 7.4)
========================================

## Setup
* Clone this boilerplate
    ```
    NEW_PROJECT_NAME=FOOBAR; \
    git clone https://github.com/ebln/template-php-package-7.4.git ${NEW_PROJECT_NAME} && cd ${NEW_PROJECT_NAME}
    
    git remote set-url origin git@github.com-ebln:ebln/${NEW_PROJECT_NAME}.git
    git push --set-upstream origin main
    
    nano ./.provision/init.sh
    sh   ./.provision/init.sh
    ```
* Configure PhpStorm → CLI Interpreters
  * Server		`Docker`
  * Config… 	`./.provision/docker-compose.yml`
  * Service 	`php`
  * Env. vars. 	`XDEBUG_REMOTE_HOST=172.17.0.1`
  * Lifecycle   `run`
