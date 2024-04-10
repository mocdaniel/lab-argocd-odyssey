---
title: Working with the CLI
---

We now caught a first glimpse at the ArgoCD UI and how we can manage Applications from there.

However, *ClickOps* isn't well suited for automated environments such as **CI/CD** pipelines, **E2E testing**, or large-scale scenarios.

That's why ArgoCD provides a fully-fletched CLI, which is already installed to our environments - we just need to log in:

```terminal:execute
prefix: Run
title: Login to ArgoCD from the CLI
command: |
  argocd login \
    argocd-{{< param session_name >}}.{{< param ingress_domain >}} \
    --username admin \
    --password $ARGO_PASSWORD
```

We can then do a fast exploration of the existing resources - we should be able to spot our `first-gitops-app` deployed in the first part of the cluster:

```terminal:execute
prefix: Run
title: Explore the CLI functionalities
command: |
  clear
  argocd app list
  argocd app get argocd/first-gitops-app
  argocd proj list
  argocd proj get default
