NSCA Client
===========

NSCA is a Linux/Unix daemon allows you to integrate passive alerts and checks
from remote machines and applications with Nagios. Useful for processing
security alerts, as well as redundant and distributed Nagios setups.

**This client allows you to send easily passive alerts and checks.**

Usage:
------

```ruby
NSCA::Client.servers << NSCA::Client::RemoteServer.new(:host => '172.0.0.1')
service = NSCA::Client::Service.new(:name => 'TestMessage')
NSCA::Client.critical service
```
