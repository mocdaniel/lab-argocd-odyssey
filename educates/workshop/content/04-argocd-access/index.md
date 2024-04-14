---
title: Accessing ArgoCD
---

During the installation, ArgoCD created an `admin` user with a **random password**
which gets written to a Kubernetes secret called `argocd-initial-admin-secret`.

Before logging in for the first time, we need to fetch it from the cluster:

```terminal:execute
prefix: Run
title: Get ArgoCD admin password from Secret
command: |
  ARGO_PASSWORD=$(kubectl get secret argocd-initial-admin-secret \
    --namespace argocd \
    --output jsonpath={.data.password} | base64 -d)
  echo $ARGO_PASSWORD
```

With our passwords extracted, we can switch to ArgoCD's login page by clicking below:

```dashboard:reload-dashboard
prefix: Open
title: Open ArgoCD
name: ArgoCD
url: https://argocd-{{< param session_name >}}.{{< param ingress_domain >}}
```

Let's take some time to explore ArgoCD's UI in the next section!
