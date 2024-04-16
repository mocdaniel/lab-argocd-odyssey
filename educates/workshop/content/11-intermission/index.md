---
title: Intermission
---

**We learned a lot already** - from installing and accessing ArgoCD to deploying our first applications and working with the CLI - let's recap:

## ArgoCD and its Architecture

- ArgoCD is a GitOps engine consisting of multiple microservices
- ArgoCD can be installed in multiple ways - we chose **Helm**
- ArgoCD features a **UI**, as well as a **CLI** that communicates with the server via **gRPC**
- ArgoCD manages **Applications** in so-called **Projects**, and deploys from **RepoSources** to **Destinations**

## Applications from Manifests

- Applications can be created from a collection of **Kubernetes manifests**
- Applications can define **sub-paths** within repositories to deploy manifests from
- Applications can deploy manifests from repositories' directory trees **recursively**

## Applications from Helmcharts

- Applications can be created from Helmcharts in .tar.gz **archives**, **OCI artifacts**, or **git repositories**.
- Applications can define ad-hoc **values** to override default behavior of Helmcharts
- Applications can reference **value files** within a repository to use

## Imperative vs. Declarative Setups

While we looked at different ways of deploying Applications with ArgoCD (*Manifests* vs. *Helmcharts*, *UI* vs. *CLI*), we always acted **imperatively** - we told ArgoCD exactly what to do and how to do it.

While this may work just fine when we're the only ones operating our ArgoCD instances, it becomes messier when multiple operators are involved - what if someone misses a `--helm-set` flag when updating an Application via CLI, or introduces a typo in the UI?

That's why there are concepts like Application CRDs and App-of-Apps in place to shift our setups to a (more) **declarative** approach.

So grab a coffee, take a short break, and keep going!