# 2 File Watch Options

# Runs the command block each time the file changes
function watch($command, $file) {
    $this_time = (get-item $file).LastWriteTime
    $last_time = $this_time
    while($true) {
        if ($last_time -ne $this_time) {
            $last_time = $this_time
            invoke-command $command
        }
        sleep 1
        $this_time = (get-item $file).LastWriteTime
    }
}

# Waits until the file changes, runs the block, then exits
function waitfor($command, $file) {
    $this_time = (get-item $file).LastWriteTime
    $last_time = $this_time
    while($last_time -eq $this_time) {
        sleep 1
        $this_time = (get-item $file).LastWriteTime
    }
    invoke-command $command
}
