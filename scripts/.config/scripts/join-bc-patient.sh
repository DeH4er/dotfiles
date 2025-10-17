docker container logs soldev-pe-ipc-inpatient-video-app-1 2>/dev/stdout | grep '/join?' | tail -1 | sed 's|.* \(\/join?.*\)|http://localhost:5173\1|' | xargs chromium
