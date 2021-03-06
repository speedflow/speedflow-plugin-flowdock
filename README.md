# Speedflow plugin Flowdock

[![Build Status](https://travis-ci.org/speedflow/speedflow-plugin-flowdock.svg?branch=master)](https://travis-ci.org/speedflow/speedflow-plugin-flowdock)
[![Dependency Status](https://gemnasium.com/speedflow/speedflow-plugin-flowdock.svg)](https://gemnasium.com/speedflow/speedflow-plugin-flowdock)
[![Gem Version](https://badge.fury.io/rb/speedflow-plugin-flowdock.svg)](https://badge.fury.io/rb/speedflow-plugin-flowdock)
[![Code Climate](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock/badges/gpa.svg)](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock)
[![Test Coverage](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock/badges/coverage.svg)](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock/coverage)
[![Inline docs](http://inch-ci.org/github/speedflow/speedflow-plugin-flowdock.svg?branch=master)](http://inch-ci.org/github/speedflow/speedflow-plugin-flowdock)

:package: A Speedflow plugin to work with Flowdock.

## How to install?

`gem install speedflow-plugin-flowdock`

## How to configure?

`.speedflow.yml` :
```yml
---
plugins:
  - flowdock

# ...

flowdock:
  token: "{FLOWDOCK_TOKEN}"
  flow:  "{FLOWDOCK_FLOW_ID}"
```

`~/.zshrc` or `~/.bashrc` :
```sh
# Flowdock
export FLOWDOCK_TOKEN="..."
export FLOWDOCK_FLOW_ID="..."
```

### How to use in my flow?

`.speedflow.yml` :
```yml
#...

flow:
  test:
    - plugin: flowdock
      action: notify
      arguments:
        message:
          default: "Test"
```

or

`.speedflow.yml` :
```yml
#...

flow:
  test:
    - plugin: flowdock
      action: notify
      arguments:
        message:
          default: "Test"
        flow:
          default: "{FLOWDOCK_FLOW_ID}"
        tags:
          default: "other,flow"
```
