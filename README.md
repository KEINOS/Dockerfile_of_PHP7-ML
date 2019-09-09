[![](https://img.shields.io/docker/cloud/automated/keinos/php7-ml)](https://hub.docker.com/r/keinos/php7-ml "Docker Cloud Automated build")
[![](https://img.shields.io/docker/cloud/build/keinos/php7-ml)](https://hub.docker.com/r/keinos/php7-ml/builds "Docker Cloud Build Status")

# Dockerfile of PHP7-ML

Dockerfile of PHP-ML, the Machine Learning Library for PHP, on Alpine Linux.

```bash
docker pull keinos/php7-ml:latest
```

## Basic Info

- Source: https://github.com/KEINOS/Dockerfile_of_PHP7-ML @ GitHub
- Image: https://hub.docker.com/r/keinos/php7-ml @ Docker Hub
  - Target architecture: x86_64 (Intel, AMD)
- Base Image: [keinos/php7-composer-alpine](https://hub.docker.com/r/keinos/php7-composer-alpine)
- User: `www-data`
- Entry Point: not set
- Composer: Installed under `/usr/bin/composer`
- Working Directory: `/app` (alias of `/home/www-data`)
- PHP-ML: Installed under `/app/vendor/ai` via composer
- `/app/composer.json` :

    ```json
    {
        "require": {
            "php-ai/php-ml": "^0.8.0"
        }
    }
    ```

## Sample Usage

Mount the script on `/app` and run.

```shellsession
$ docker run --rm -it -v $(pwd)/sample.php:/app/sample.php keinos/php7-ml:latest php /app/sample.php
```

- Sample script:

    ```php
    <?php
    /* sample.php */

    require_once __DIR__ . '/vendor/autoload.php';

    use Phpml\Classification\KNearestNeighbors;

    $samples = [[1, 3], [1, 4], [2, 4], [3, 1], [4, 1], [4, 2]];
    $labels  = ['a', 'a', 'a', 'b', 'b', 'b'];

    $classifier = new KNearestNeighbors();
    $classifier->train($samples, $labels);

    echo $classifier->predict([3, 2]);
    // returns 'b'
    ```
