<?php

xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);


/* Fancy application logic incoming. */
sleep(1);
/* End of fancy application logic. */


$xhProfData = xhprof_disable();
include_once '/opt/xhprof/xhprof_lib/utils/xhprof_lib.php';
include_once '/opt/xhprof/xhprof_lib/utils/xhprof_runs.php';

$xhProf = new XHProfRuns_Default();
$runId = time();
$runName = rand(10000000, 99999999);
$xhProf->save_run($xhProfData, $runName, $runId);
