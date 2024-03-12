---
title: Installing ArgoCD
---

First, we are going to install ArgoCD. This can be done using **manifests**
or the provided **Helmchart**. For the sake of easier configurability,
we will use Helm for the installation.

## Configuring the Repository

The Argo Project provides Helmcharts for its subprojects [on GitHub](https://github.com/argoproj/argo-helm).
We can configure the repository like this:

```terminal:execute
prefix: Run
title: Configure the Argo Helm repository
command: |
  helm repo add argo https://argoproj.github.io/argo-helm
  helm repo update
```

We can display the available Helmcharts in the `argo` repository like this:

```terminal:execute
prefix: Run
title: Display available Helmcharts
command: helm search repo argo/
```

We can see the chart `argo/argo-cd` listed, so let's install it.

## Installing ArgoCD

The following command installs ArgoCD and configures it in a way that allows
us to reach it from without our clusters:

```terminal:execute
prefix: Run
title: Install ArgoCD with Helm
command: |
  helm install -n argocd --create-namespace \
    argocd argo/argo-cd \
    --set configs.params."server\.insecure"=true \
    --set server.ingress.enabled=true \
    --set server.ingress.tls=true \
    --set server.ingress.hostname=argocd-{{< param session_name >}}.{{< param ingress_domain >}}
```

This will deploy ArgoCD to our clusters and make it securely available at
[argocd-{{< param session_name >}}.{{< param ingress_domain >}}](argocd-{{< param session_name >}}.{{< param ingress_domain >}}) via HTTPS.
