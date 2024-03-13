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

We will need to configure a few settings regarding connectivity of ArgoCD, so
copy these values to a new file `argocd-values.yaml` in your editor:

```workshop:copy
prefix: Copy
title: ArgoCD Helm values
text: |
  ---
  configs:
    params:
      server.insecure: true
      server.x.frame.options: ""
      server.content.security.policy: ""
  server:
    ingress:
      enabled: true
      tls: true
      hostname: argocd-{{< param session_name >}}.{{< param ingress_domain >}}
```

Once we created our `argocd-values.yaml`, we can deploy the Helmchart:

```terminal:execute
prefix: Run
title: Install ArgoCD
command: |
  cd ~/eduk8s
  helm install argocd argo/argo-cd \
    --namespace argocd \
    --create-namespace \
    -f argocd-values.yaml
```

This will deploy ArgoCD to our clusters and make it securely available at
[argocd-{{< param session_name >}}.{{< param ingress_domain >}}](argocd-{{< param session_name >}}.{{< param ingress_domain >}}) via HTTPS.
