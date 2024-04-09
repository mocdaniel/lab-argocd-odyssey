---
title: Bootstrapping Our GitOps Repository
---

To be practitioners of GitOps, we need a **Git repository** to act as our **source of truth**.

For this workshop, we will use an example repository:
[`mocdaniel/gitops-examples`](https://github.com/mocdaniel/gitops-examples).

To build on the example stubs provided in the repository, we will want to have our own copy -
let's **fork** the repository on GitHub and clone it to our environment.

## Logging in to GitHub

Our environments come with `gh` preinstalled, GitHub's official CLI. First, we need to log in -
just execute below command and follow the directions in your terminal.

```terminal:execute
prefix: Run
title: Log in to GitHub using its CLI
command: |
  gh auth login \
    -p https \
    -h github.com \
    -w
```

## Forking and Cloning the Example Repository

After successfully logging in, we can **fork and clone** the example repository:

```workshop:copy
prefix: Copy
title: Fork and clone the example repository
text: |
  gh repo fork mocdaniel/gitops-examples \
    --clone \
    --fork-name gitops-examples
```

## Exploring the Example Repository

The forked repository should be cloned to our environments by now - let's have a look in the editor.

```editor:open-file
prefix: Editor
title: Open the example repository's README.md
file: ~/gitops-examples/README.md
```

The repository contains **multiple directories** with Kubernetes manifests to be consumed by ArgoCD.
Notably, there seems to be a **first GitOps application** example in `first-gitops-app/`:

```terminal:execute
prefix: Run
title: List the contents of first-gitops-app/
command: |
  ls -l ~/gitops-examples/first-gitops-app/
```