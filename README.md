# rsyslog-docker
A simple container to collect remote syslogs on traditionnal ports udp and tcp 514, to files in /var/log/remote.
Logs are rotated every day, compressed and kept for 7 days.

## Features

 * alpine based
 * crontab entries via parameter
 * ovw for persistent storage of any config file
