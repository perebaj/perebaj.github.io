---
title: prometheus-operator my first opensource contribution
pubDate 2024-08-30 08:05:01
tags:
---

<img src="/images/gopher.jpeg" alt="async" style="width:200px;"/>

# What is the prometheus-operator?

Before jump into the contribution, let's understand what is the prometheus-operator.

A typical monitoring system is composed of multiple components, like Prometheus, Grafana, and Alert manager. Manage and deploy these components manually is a hard task, and the Prometheus Operator helps you to manage and deploy these components in a Kubernetes cluster. It's creates an abstraction layer, where all resources related to storage, secrets, services and deployments are created automatically.

In summary, it aims to:

- Simplify and automate the configuration of Prometheus monitoring stack.

## Operator = CRD + Custom Controllers

### Controller

In robotics and automation, a control loop is a non-terminating loop that regulates the state of a system, Like a thermostat that regulates the temperature of a room or a PID controller that regulates the speed of a motor.

In Kubernetes, controllers are control loops that watch the state of your cluster, then make or request changes where needed. Each controller tries to move the current cluster state closer to the desired state.

- [Official Documentation](https://kubernetes.io/docs/concepts/architecture/controller/)

### Custom Resource Definition (CRD) and Resources

Before dig into a Custom resource, let's understand what is a resource in Kubernetes.

When you have you first contact with Kubernetes, you will see a lot of "tools", like Pods, Deployments, Services, etc. These are resources that K8s manages.

A Custom Resource is an extension of the Kubernetes API that is not necessarily available in a default Kubernetes installation. It represents a **customization of a particular Kubernetes installation.**

For example, you can create a Custom Resource that controls a database, and create some interfaces to manage it, like create, delete, update, etc.

### Operator

<img src="/images/k8s-operator.png" alt="async" style="width:400px;"/>

People who run workloads on Kubernetes need to use automation to take care of repeatable tasks. The operator pattern captures how you can write code to automate a task beyond what Kubernetes itself provides.

In the end, it makes use of the Custom Resource Definition and the Custom Controller to manage the resources in the Kubernetes cluster.

# Contribution and Learnings

Recently I pushed my first big feature in production in the open source world, or not so big...

I added a new feature to the [prometheus-operator project](https://prometheus-operator.dev/), which is a project that helps you to deploy and manage Prometheus instances in a Kubernetes cluster.

Basically I changed an old logger library to a new one [slog](https://pkg.go.dev/golang.org/x/exp/slog). This takes 20 PRs and 1 month of work. And here are some learnings and findings.

<img src="/images/prometheusPRs.png" alt="prs" style="width:400px;"/>

This project is HUGE, almost 400k lines of code. Of Go, it's more than 95k lines of code. What makes the difference? Documentation, tests, and good practices. This enables everyone to contribute and understand the codebase.

<img src="/images/linesofcode.png" alt="prs" style="width:500px;"/>

## Makefile

I think that this is the entry point for all developers that are starting to get in touch with a new code base, here you can find all useful commands to build, test, lint, and generate code. Simple like that!

And in addition to use these interfaces between the developers and the code, you can also automate some tasks, like the CI/CD pipeline. So, the same commands that you use locally to build and test your code, you can use in the CI/CD pipeline, this avoids miss configurations and errors in the development process.

Useful commands like, create a help function to list all commands, save a lot of time for the developers that are starting to contribute to the project.

```bash
## It's true, im awesome
.PHONY: jojo-is-awesome
jojo-is-awesome:
    @echo "Jojo is awesome"

## Display help for all targets
.PHONY: help
help:
	@awk '/^.PHONY: / { \
		msg = match(lastLine, /^## /); \
			if (msg) { \
				cmd = substr($$0, 9, 100); \
				msg = substr(lastLine, 4, 1000); \
				printf "  ${GREEN}%-30s${RESET} %s\n", cmd, msg; \
			} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

param-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Param \"$*\" is missing, use: make $(MAKECMDGOALS) $*=<value>"; \
		exit 1; \
	fi
```

Then, when you type `make help` you will see all the commands that you can use in the project.

<img src="/images/helpcommand.png" alt="prs" style="width:400px;"/>


Other things like tooling. You don't want to overwrite your local tools, like golangci-lint, mockgen, etc. So, you can use the Makefile to download and install these tools in a specific directory, like `./tmp/bin`.

```bash
### create a new folder to store the tools binaries
TOOLS_BIN_DIR ?= $(shell pwd)/tmp/bin
$(TOOLS_BIN_DIR):
	mkdir -p $(TOOLS_BIN_DIR)

## Install tools from tools.go
.PHONY: install-tools
install-tools: download
	@echo Installing tools from tools.go
	@cat tools.go | grep _ | awk -F'"' '{print $$2}' | GOBIN=$(TOOLS_BIN_DIR) xargs -tI % go install %
```

Create a tools.go file to list all the tools that you want to install.

```go
// +build tools

package tools

import (
	_ "github.com/golang/mock/mockgen"
	_ "github.com/golangci/golangci-lint/cmd/golangci-lint"
)
```

And when you type `make install-tools` all the tools will be installed in the `./tmp/bin` directory. And you can use them in the Makefile, with the `$(TOOLS_BIN_DIR)/toolname` command.

More details about it [here](https://marcofranssen.nl/manage-go-tools-via-go-modules)

## Good Documentation

All that you need to contribute was already thought and documented. At least the mundane tasks. Like how to contribute, how to test, how to set up the integration tests, etc.

What I learned with that, is all things can be located in the GitHub repository. I said that, because all the companies that I already worked for, have spread documentation in different places, like Notion, Google Docs and so on. This is a terrible practice! Git has a good feature to store and, mainly, discuss things, like PRs, issues, and roadmaps. So, use it!

## Async

I don't claim for any online meeting in this entire process. They just have biweekly meetings to discuss the future of the project. All the other problems, are solved asynchronously using Git or creating a thread in Slack.

## Structured Logs

Here is an example of how to use the slog Library.

[#6743](https://github.com/prometheus-operator/prometheus-operator/pull/6743)

# Important Resorces

- [A deep dive to Prometheus Operator - Jayapriya Pai](https://www.youtube.com/watch?v=Uph_Say4D3M)
