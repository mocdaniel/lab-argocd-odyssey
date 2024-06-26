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

{{< note >}}
**Your environment is ephemeral.**

As soon as you end the session, the generated GitHub token allowing you to interact with GitHub via the `gh`
CLI will be deleted along with everything else you created.
{{< /note >}}

## Forking and Cloning the Example Repository

After successfully logging in, we can **fork and clone** the example repository:

```terminal:execute
prefix: Run
title: Fork and clone the example repository
command: |
  gh repo fork mocdaniel/gitops-examples \
    --clone \
    --fork-name gitops-examples
```

## Exploring the Example Repository

The repository contains **multiple directories** with Kubernetes manifests to be consumed by ArgoCD.

Notably, there seems to be a **first GitOps application** example in `first-gitops-app/`:

```terminal:execute
prefix: Run
title: Examine gitops-examples/
command: |
  tree ~/gitops-examples
```

Let's have a closer look at what we're defining:

```editor:open-file
prefix: Editor
title: Open first-gitops-app/deployment.yaml
file: ~/gitops-examples/first-gitops-app/deployment.yaml
```

## Making Our First Commit

As we just saw, our `Ingress` resource in `ingress.yaml` isn't quite ready to be deployed yet -
we need to define a **valid hostname**.

For your environment, this could be e.g.

`https://nginx-{{< param session_name >}}.{{< param ingress_domain >}}`

### Updating Our Manifest

We can update our `ingress.yaml` manifests using sed:

```terminal:execute
prefix: Run
title: Set a valid Ingress hostname using sed
command: |
  sed -i \
    's/<valid-domain-here>/nginx-{{< param session_name >}}.{{< param ingress_domain >}}/g' \
    ~/gitops-examples/first-gitops-app/ingress.yaml
```

Double-check that the changes have been made in the editor:

```editor:open-file
prefix: Editor
title: Open first-gitops-app/ingress.yaml
file: ~/gitops-examples/first-gitops-app/ingress.yaml
```

### Commiting and Pushing Our Changes

As a last step, to get our changes onto GitHub for ArgoCD to read them, we need to **commit and push**:

```terminal:execute
prefix: Run
title: Commit and push the changes to ingress.yaml
command: |
  cd ~/gitops-examples
  git add ./first-gitops-app
  git commit -m "Fix Ingress hostname"
  git push -u origin main
```