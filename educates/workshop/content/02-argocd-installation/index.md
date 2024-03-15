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

```editor:append-lines-to-file
prefix: Editor
title: Create ArgoCD Helm values file
file: ~/argocd-values.yaml
text: |
  ---
  configs:
    params:
      server.insecure: true                    # Let the Ingress handle TLS
      server.x.frame.options: '""'             # Allow embedding
      server.content.security.policy: '""'     # Allow embedding
  server:
    ingress:
      enabled: true                            # Enable Ingress
      tls: true                                # Enable TLS for Ingress
      hostname: argocd-{{< param session_name >}}.{{< param ingress_domain >}}
```

Once we created our `argocd-values.yaml`, we can deploy the Helmchart:

```terminal:execute
prefix: Run
title: Install ArgoCD
command: |
  cd ~
  helm install argocd argo/argo-cd \
    --namespace argocd \
    --create-namespace \
    -f argocd-values.yaml
```
