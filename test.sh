#!/bin/bash 
/var/www/vendor/bin/drush --version

/var/www/vendor/bin/drush site-install standard --yes --account-name=admin --account-pass=admin --site-name=Test --db-url=pgsql://docker:docker@postgres:5432/drupal

/var/www/vendor/bin/drush --yes dl devel health_check bootstrap_business
/var/www/vendor/bin/drush --yes en devel_generate health_check bootstrap_business

/var/www/vendor/bin/drush --yes config:set system.theme default bootstrap_business
/var/www/vendor/bin/drush --yes config-set system.theme admin bootstrap_business

/var/www/vendor/bin/drush generate-users 3
/var/www/vendor/bin/drush generate-content --types=article --languages='en' 15
