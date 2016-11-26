# Description

This application watches the _Purdue University UniTime Student Scheduling
Assistant_ to find when specified classes are no longer full. When a class opens
up, a Google Hangout message is sent to notify the student that the class has
opened up.

# Requirements

This application was tested with:
* [Fedora](https://getfedora.org/) 25
* [Ruby](https://www.ruby-lang.org) 2.3
* [Bundler](http://bundler.io/) 1.13.4

Other distributions and older versions of these requirements may work but have
not been tested.

# Installation

```bash
git clone https://github.com/cvoltz/watch-schedule.git
cd watch-schedule
bundle install --binstubs --deployment --without test development
```

# Configuration

## Credentials

Login credentials can be provided via environment variables like this:

```bash
export WATCH_SCHEDULE_USER=username
export WATCH_SCHEDULE_PASSWORD=secret
```

or in the [YAML](http://yaml.org/spec/1.2/spec.html) configuration file
`~/.watch-schedule.yml` like this:
```yaml
---
:user: username
:password: secret
```

# Running

```bash
./watch-schedule.rb
```

# License

Copyright © 2016 [Christopher Voltz](mailto:christopher@voltz.ws)

Released under the [GNU General Public License, version 3.0 or
later](https://www.gnu.org/licenses/gpl.txt)
