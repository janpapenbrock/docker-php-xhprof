docker-php-xhprof
=================

Basic POC of installing a custom xhprof revision into the official Docker PHP image.

Run it
-------

To try, simply run

    docker-compose up
    
And visit [http://localhost/](http://localhost/) in your browser.

A new `.xhprof` data file should have been created in `xhprof/`.

Use it
------

To use it in your project, copy the relevant parts from `Dockerfile` and `htdocs/index.php` into your application.
