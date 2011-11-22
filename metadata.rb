maintainer        "Paper Cavalier"
maintainer_email  "code@papercavalier.com"
license           "Apache 2.0"
description       "Installs and configures Redis 2.2.1"
version           "0.1.6"

recipe "redis::source", "Installs redis from source and adds init script"

%w{ ubuntu debian }.each do |os|
  supports os
end

depends "build-essential"


attribute "redis/version",
  :display_name => "Redis version",
  :description  => "Which Redis version will be installed",
  :default      => "2.4.3"

attribute "redis/source",
  :display_name => "Redis source file",
  :description  => "Downloaded location for Redis"

attribute "redis/checksum",
  :display_name => "Redis source file checksum",
  :description  => "Will make sure the source file is the real deal",
  :default      => "d917e721a11e38969d92070e9c6476598c6e4621"

attribute "redis/bins",
  :display_name => "Redis scripts",
  :description  => "After make, these are the scripts which will become available"

attribute "redis/dir",
  :display_name => "Redis installation path",
  :description  => "Redis will be installed here",
  :default      => "/opt/redis-2.4.3"

attribute "redis/datadir",
  :display_name => "Redis data store",
  :description  => "All Redis data will be stored here",
  :default      => "/var/db/redis"

attribute "redis/config",
  :display_name => "Redis config",
  :description  => "Path to Redis config file",
  :default      => "/etc/redis.conf"

attribute "redis/logfile",
  :display_name => "Redis log file",
  :description  => "Redis will log to this file",
  :default      => "/var/log/redis.log"

attribute "redis/pidfile",
  :display_name => "Redis PID file",
  :description  => "Path to Redis PID",
  :default      => "/var/run/redis.pid"

attribute "redis/port",
  :display_name => "Redis port",
  :description  => "Accept connections on the specified port",
  :default      => "6379"

attribute "redis/timeout",
  :display_name => "Redis timeout",
  :description  => "Close the connection after a client is idle for this many seconds (0 to disable)",
  :default      => "300"

attribute "redis/databases",
  :display_name => "Redis databases",
  :description  => "Number of databases",
  :default      => "16"

attribute "redis/slave_serve_stale_data",
  :display_name => "Redis slave serve stale data",
  :description  => "if slave-serve-stale-data is set to 'yes' (the default) the slave will still reply to client requests, possibly with out of data data",
  :default      => "yes"

attribute "redis/max_memory",
  :display_name => "Redis max memory",
  :description  => "Don't use more memory than the specified amount of MBs",
  :default      => "256"

attribute "redis/max_memory_policy",
  :display_name => "Redis max memory policy",
  :description  => "Redis will select what to remove when maxmemory is reached",
  :default      => "volatile-lru"

attribute "redis/max_memory_samples",
  :display_name => "Redis max memory policy sample size",
  :description  => "By default, Redis will check three keys and pick the one that was used less recently",
  :default      => "3"

attribute "redis/snapshots",
  :display_name => "Redis snapshots",
  :description  => "Will save the DB if both the given number of seconds and the given number of write operations against the DB occurred.",
  :default      => { 900 => 1, 300 => 10, 60 => 10000 }

attribute "redis/rdbcompression",
  :display_name => "Redis rdbcompression",
  :description  => "Compress string objects using LZF when dump .rdb databases",
  :default      => "yes"

attribute "redis/dbfilename",
  :display_name => "Redis dbfilename",
  :description  => "The filename where to dump the DB",
  :default      => "redis_state.rdb"

attribute "redis/bind_address",
  :display_name => "Redis bind address",
  :description  => "Redis will listen on all IP addresses by default",
  :default      => "0.0.0.0"

attribute "redis/unix_socket",
  :display_name => "Redis unix socket",
  :description  => "There is no default, so Redis will not listen on a unix socket when not specified.",
  :default      => nil

attribute "redis/loglevel",
  :display_name => "Redis log level",
  :description  => "Sets server verbosity. Will be moderately verbose, what you want in production probably",
  :default      => "notice"

attribute "redis/syslog_enabled",
  :display_name => "Redis syslog",
  :description  => "Redis will log to the syslog",
  :default      => "no"

attribute "redis/syslog_ident",
  :display_name => "Redis syslog identity",
  :description  => "Redis will use this syslog identity",
  :default      => "redis"

attribute "redis/syslog_facility",
  :display_name => "Redis syslog facility",
  :description  => "Redis will use this syslog facility. Must be USER or between LOCAL0-LOCAL7",
  :default      => "local0"

attribute "redis/max_clients",
  :display_name => "Redis max clients",
  :description  => "Redis will set the max number of connected clients at the same time",
  :default      => "256"

attribute "redis/appendonly",
  :display_name => "Redis appendonly mode",
  :description  => "When this mode is enabled Redis will append every write operation received in a file",
  :default      => "no"

attribute "redis/appendonly_filename",
  :display_name => "Redis appendonly filename",
  :description  => "The name of the append only file",
  :default      => "appendonly.aof"

attribute "redis/appendfsync",
  :display_name => "Redis fsync flush setting",
  :description  => "Tells the Operating System to actually write data on disk instead to wait for more data in the output buffer",
  :default      => "everysec"

attribute "redis/no_appendfsync_on_rewrite",
  :display_name => "Redis AOF fsync policy tuning",
  :description  => "In some Linux configurations Redis may block too long on the fsync() call",
  :default      => "no"

attribute "redis/vm_enabled",
  :display_name => "Redis VM enabled",
  :description  => "Virtual Memory allows Redis to work with datasets bigger than the actual amount of RAM needed to hold the whole dataset in memory",
  :default      => "no"

attribute "redis/vm_swap_file",
  :display_name => "Redis VM swap file",
  :description  => "This is the path of the Redis swap file",
  :default      => "/tmp/redis.swap"

attribute "redis/vm_max_memory",
  :display_name => "Redis VM max memory",
  :description  => "Configures the VM to use at max the specified amount of RAM",
  :default      => "/tmp/redis.swap"

attribute "redis/vm_page_size",
  :display_name => "Redis VM page size",
  :description  => "Redis swap files is split into pages",
  :default      => "32"

attribute "redis/vm_pages",
  :display_name => "Redis VM pages",
  :description  => "Number of total memory pages in the swap file",
  :default      => "134217728"

attribute "redis/vm_max_threads",
  :display_name => "Redis VM max threads",
  :description  => "Max number of VM I/O threads running at the same time",
  :default      => "4"

attribute "redis/hash_max_zipmap_entries",
  :display_name => "Redis hash max zipmap entries",
  :description  => "Hashes are encoded in a special way (much more memory efficient) when they have at max a given numer of elements, and the biggest element does not exceed a given threshold",
  :default      => "512"

attribute "redis/hash_max_zipmap_value",
  :display_name => "Redis hash max zipmap value",
  :description  => "Hashes are encoded in a special way (much more memory efficient) when they have at max a given numer of elements, and the biggest element does not exceed a given threshold",
  :default      => "64"

attribute "redis/list_max_ziplist_entries",
  :display_name => "Redis list max ziplist entries",
  :description  => "Similarly to hashes, small lists are also encoded in a special way in order to save a lot of space",
  :default      => "512"

attribute "redis/list_max_ziplist_value",
  :display_name => "Redis list max ziplist value",
  :description  => "Similarly to hashes, small lists are also encoded in a special way in order to save a lot of space",
  :default      => "64"

attribute "redis/set_max_intset_entries",
  :display_name => "Redis max intset entries",
  :description  => "The following configuration setting sets the limit in the size of the set in order to use this special memory saving encoding",
  :default      => "512"

attribute "redis/active_rehashing",
  :display_name => "Redis active rehashing",
  :description  => "Active rehashing uses 1 millisecond every 100 milliseconds of CPU time in order to help rehashing the main Redis hash table",
  :default      => "yes"

attribute "redis/include_config_files",
  :display_name => "Redis include configuration files",
  :description  => "Include one or more other config files here",
  :default      => []