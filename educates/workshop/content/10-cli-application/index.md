---
title: Creating Applications from the CLI
---

Now that we have created a new project, we are going to deploy [Podinfo](https://github.com/stefanprodan/podinfo),
a demo application for cloud-native practices.

Throughout this section, we'll look at a few new concepts within ArgoCD:

- How to create Applications from the CLI
- How to deploy [Helmcharts](https://helm.sh) using ArgoCD
- How to deploy OCI artifacts using ArgoCD

Let's get right to it!

## Creating the Podinfo Application

Podinfo is available as Helmchart, which allows us to

1. get the bundled manifests (either as **tar archive** or **OCI artifact**),
2. have their contents rendered by ArgoCD
3. deploy them to our cluster without having to know or access the *actual* manifests.

### Creating Applications with the CLI

Similarly to `argocd proj create`, we can add a new application with `argocd app create` - there's just a *few* more parameters to choose from (145 to be precise).

Luckily enough, we can look at the CLI's help output to find examples for deploying Helmcharts:

```terminal:execute
prefix: Run
title: Display examples to deploy Helm applications
command: |
  clear
  argocd app create --help | grep "Create a Helm app" -A 1
```

The second example looks good! It seems like all we need to pass is

- the **project** (the example implicitly deploys to the `default` project)
- the **source repository**
- the **helm chart**
- the **revision**
- the **destination namespace**
- the **destination Kubernetes server**

Let's forge our `argocd app create` command, getting the missing information from
[**Podinfo's GitHub repository**](https://github.com/stefanprodan/podinfo#helm) and ArgoCD (e.g. via the Web UI):

```workshop:copy
prefix: Copy&Paste
title: Forge the argocd app create command
text: |
  argocd app create podinfo \
    --project \
    --repo \
    --helm-chart \
    --revision \
    --dest-namespace \
    --dest-name \
    --sync-option CreateNamespace=true \
    --sync-policy auto
```

{{< note >}}
**I added two things for you already:**

- `sync-option CreateNamespace=true` so we don't get the same **sync error** as with our `first-gitops-app`.
- `--sync-policy auto` so our application **syncs and (re-)deploys** Podinfo **automatically** as soon as it registers changes to the source Helmchart or Application definition.
{{< /note >}}

Once created, we can check the state of our `podinfo` Application:

```terminal:execute
prefix: Run
title: Check the state of the Podinfo Application
command: |
  argocd app get argocd/podinfo
```


### Passing Values to our Helm Application

One of the advantages of Helmcharts opposed to Kubernetes manifests is the deployment's easy configurability:

You can pass so-called **values** that can define anything from the number of replicas to additional labels and annotations or the FQDN of an Ingress resource.

We are now going to update our `podinfo` application to also deploy an Ingress object so we can reach it over the web, similar to our `first-gitops-app` application. We can do so by passing the values below to the `argocd app set` command.

For a list of all configurable values of the Podinfo Helmchart, have a look [at the GitHub repository](https://github.com/stefanprodan/podinfo/blob/master/charts/podinfo/values.yaml).


| | |
|:--|--:|
|`replicaCount`|2|
|`ui.message`|Podinfo + ArgoCD = ✨Demo Time✨|
|`ingress.enabled`|true|
|`ingress.className`|contour|
|`ingress.hosts[0].host`|podinfo-{{< param session_name >}}.{{< param ingress_domain >}}|
|`ingress.hosts[0].paths[0].pathType`|ImplementationSpecific|
|`ingress.hosts[0].paths[0].path`|"/"|

Let's update the app - it should sync automatically and take the new settings into account, as initially defined above.

```terminal:execute
prefix: Run
title: Update the podinfo Application
command: |
  argocd app set argocd/podinfo \
    --helm-set replicaCount=2 \
    --helm-set ui.message="Podinfo + ArgoCD = ✨Demo Time✨" \
    --helm-set ingress.enabled=true \
    --helm-set ingress.className=contour \
    --helm-set ingress.hosts[0].host=podinfo-{{< param session_name >}}.{{< param ingress_domain >}} \
    --helm-set ingress.hosts[0].paths[0].pathType=ImplementationSpecific \
    --helm-set ingress.hosts[0].paths[0].path="/"
```

The newly created Ingress should be visible in the ArgoCD UI almost immediately - click the link to Podinfo's webpage and be greeted by yet another cute mascot applauding you and your GitOps feats. 😉