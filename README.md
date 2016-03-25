# Speedflow plugin Flowdock

[![Build Status](https://travis-ci.org/speedflow/speedflow-plugin-flowdock.svg?branch=master)](https://travis-ci.org/speedflow/speedflow-plugin-flowdock)
[![Gem Version](https://badge.fury.io/rb/speedflow-plugin-flowdock.svg)](https://badge.fury.io/rb/speedflow-plugin-flowdock)
[![Code Climate](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock/badges/gpa.svg)](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock)
[![Test Coverage](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock/badges/coverage.svg)](https://codeclimate.com/github/speedflow/speedflow-plugin-flowdock/coverage)
[![Inline docs](http://inch-ci.org/github/speedflow/speedflow-plugin-flowdock.svg?branch=master)](http://inch-ci.org/github/speedflow/speedflow-plugin-flowdock)

:package: A Speedflow plugin to work with Flowdock.

## How to install this plugin?

`gem install speedflow-plugin-flowdock`

## How to configure this plugin?

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

### How to use this plugin?

`.speedflow.yml` :
```yml
flow:
  test:
    - plugin: flowdock
      action: notify
      arguments:
        message:
          default: "Test"
```

or

```yml
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
