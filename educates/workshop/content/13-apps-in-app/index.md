---
title: The Apps-in-App Pattern
---

**Applications managing Applications?** Sounds confusing at first, but makes a lot of sense, if you think about it:

- single entrypoint into the whole deployment
- automated rollout, reconciliation and enforcement of multiple Applications

Common usecases for Apps-in-App deployments are bootstrapping scenarios: Imagine you need to deploy a whole lot of 'foundational' Applications to a cluster - wouldn't it be nice to only have to deploy a single Application that is in charge of all the others?

For this workshop, we are going to build an **App-of-Apps for our two demo Applications**, `first-gitops-app` and `podinfo`. Let's get going!

## Recreate Our Application Manifests

First, let's recreate our already existing Applications as CRDs - they would look like this:

```editor:append-lines-to-file
prefix: Editor
title: Create first-gitops-app Application CRD
file: ~/gitops-examples/apps/first-gitops-app.yaml
text: |
  apiVersion: argoproj.io/v1alpha1
  kind: Application
  metadata:
    name: first-gitops-app
    namespace: argocd
  spec:
    destination:
      namespace: first-gitops-app
      server: https://kubernetes.default.svc
    project: default
    source:
      path: first-gitops-app
      repoURL: https://github.com/mocdaniel/gitops-examples
      targetRevision: HEAD
    syncPolicy:
      syncOptions:
        - CreateNamespace=true
```

```editor:append-lines-to-file
prefix: Editor
title: Create podinfo Application CRD
file: ~/gitops-examples/apps/podinfo.yaml
text: |
  apiVersion: argoproj.io/v1alpha1
  kind: Application
  metadata:
    name: podinfo
    namespace: argocd
  spec:
    destination:
      namespace: podinfo
      server: https://kubernetes.default.svc
    project: cli-apps
    source:
      chart: podinfo
      helm:
        parameters:
          - name: replicaCount
            value: "2"
          - name: ui.message
            value: Podinfo + ArgoCD = ✨Demo Time✨
          - name: ingress.enabled
            value: "true"
          - name: ingress.className
            value: contour
          - name: ingress.hosts[0].host
            value: podinfo-educates-cli-w03-s001.192.168.1.104.nip.io
          - name: ingress.hosts[0].paths[0].path
            value: "/"
          - name: ingress.hosts[0].paths[0].pathType
            value: "ImplementationSpecific"
      repoURL: ghcr.io/stefanprodan/charts
      targetRevision: 6.6.2
    syncPolicy:
      automated:
        selfHeal: true
      syncOptions:
        - CreateNamespace=true
```