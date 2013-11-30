name             'drupal'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures drupal'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends "application", "3.0.0"
depends "application_php", "2.0.0"
depends "mysql"
depends "database"
