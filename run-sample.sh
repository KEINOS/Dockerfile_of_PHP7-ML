#!/bin/sh
# Note: Mount this file on /app directory, which PHP-ML is installed.

cat <<TITLE
=============================================================================
 Running Sample Script
 - Testing the Classification of Nearest Neighbors' method.
=============================================================================
TITLE

path_dir_current=$(pwd)
path_file_script="${path_dir_current}/sample.php"

# Create source code
cat <<'SOURCECODE' > $path_file_script
<?php

require_once __DIR__ . '/vendor/autoload.php';

use Phpml\Classification\KNearestNeighbors;

$samples = [[1, 3], [1, 4], [2, 4], [3, 1], [4, 1], [4, 2]];
$labels  = ['a', 'a', 'a', 'b', 'b', 'b'];

$classifier = new KNearestNeighbors();
$classifier->train($samples, $labels);

echo $classifier->predict([3, 2]);
// return 'b'

SOURCECODE

# Run test
expect='b'; echo 'Expect:' $expect
result=$(php $path_file_script); echo 'Result:' $result

if [ ${expect} = ${result} ]; then
   echo 'OK: Test passed'
   exit 0
fi

echo 'NG: Test failed'
exit 1
