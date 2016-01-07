<?php

if (function_exists('xhprof_sample_enable')) {
    ini_set('xhprof.sampling_interval', 50000);
    ini_set('xhprof.sampling_depth', 1);
    xhprof_sample_enable();

    register_shutdown_function(function() {
        $xhProfData = xhprof_sample_disable();
        include_once '/opt/xhprof/xhprof_lib/utils/xhprof_lib.php';
        include_once '/opt/xhprof/xhprof_lib/utils/xhprof_runs.php';

        $xhProf = new XHProfRuns_Default();
        $runId = time();
        $runName = rand(10000000, 99999999);
        $xhProf->save_run($xhProfData, $runName, $runId);
    });
}
