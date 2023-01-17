#!/bin/sh
chmod 775 _site
find _site -type d -exec chmod 775 {} \;
rsync -rvlpt _site/ spinoza.embl.de:/g/huber/www-huber/users/whuber/2301-GHGA-best-analysis-practices

#ssh spinoza.embl.de rm -r /g/huber/www-huber/users/whuber/2301-GHGA-best-analysis-practices
#scp -pr _site/ spinoza.embl.de:/g/huber/www-huber/users/whuber/2301-GHGA-best-analysis-practices
